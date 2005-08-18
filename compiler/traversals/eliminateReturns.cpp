#include <typeinfo>
#include "eliminateReturns.h"
#include "stmt.h"
#include "symtab.h"
#include "stringutil.h"

EliminateReturns::EliminateReturns(void) {
  whichModules = MODULES_CODEGEN;
}


static bool alreadyProcessedThisReturn(Expr* retExpr, Symbol* retval) {
  if (typeid(*retExpr) == typeid(Variable)) {
    Variable* retVar = dynamic_cast<Variable*>(retExpr);
    if (retVar->var == retval) {
      return true;
    }
  }
  return false;
}


void EliminateReturns::preProcessStmt(Stmt* stmt) {
  static int uid = 1;

  if (ReturnStmt* retStmt = dynamic_cast<ReturnStmt*>(stmt)) {
    Expr* retExpr = retStmt->expr;

    if (retExpr == NULL) {
      return;
    }

    //    fprintf(stderr, "\n\n\nFound a return statement: ");
    //    retStmt->println(stderr);

    FnSymbol* fnSym = retStmt->parentFunction();
    if (fnSym == NULL) {
      INT_FATAL(stmt, "Return statement doesn't have parent function");
    }

    //    fprintf(stderr, "Parent function is: %s\n", fnSym->name);
    Type* retType = fnSym->retType;
    //    fprintf(stderr, "Return type is: ");
    //    retType->println(stderr);
    BlockStmt* body = fnSym->body;
    
    SymScope* fnScope = body->blkScope;
    if (fnScope == NULL) {
      INT_FATAL(body, "Block body has NULL blkScope");
    }
    Symbol* retvalSym = Symboltable::lookupInCurrentScope("_retval");
    VarSymbol* retval = dynamic_cast<VarSymbol*>(retvalSym);
    if (retval == NULL) {
      retval = new VarSymbol("_retval", retType);
      retval->cname = glomstrings(3, retval->name, "_", intstring(uid++));
      retval->noDefaultInit = true;
      body->body->insertAtHead(new ExprStmt(new DefExpr(retval)));
    } else {
      if (alreadyProcessedThisReturn(retExpr, retval)) {
        return;
      }
    }

    Variable* retVar = new Variable(retval);
    CallExpr* assignRetVar = new CallExpr(OP_GETSNORM, retVar, retExpr->copy());
    ExprStmt* assignStmt = new ExprStmt(assignRetVar);
    BlockStmt *retBlock = new BlockStmt(assignStmt);
    retStmt->replace(retBlock);
    Variable* newRetExpr = new Variable(retval);
    ReturnStmt *newRetStmt = new ReturnStmt(newRetExpr);
    assignStmt->insertAfter(newRetStmt);
  }
}



