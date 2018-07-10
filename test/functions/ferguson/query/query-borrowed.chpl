pragma "use default init"
class MyClass {
  var x;
}

pragma "use default init"
class OtherClass {
  var y;
}

pragma "use default init"
class Concrete {
  var z:int;
}

proc g(arg:borrowed MyClass(?t)) {
  writeln(t:string);
}
proc h(arg:borrowed MyClass(borrowed OtherClass(?t))) {
  writeln(t:string);
}

proc i(arg:borrowed) {
  writeln(arg.type:string);
}
proc j(arg:borrowed MyClass) {
  writeln(arg.type:string);
}
proc k(arg:borrowed MyClass(borrowed OtherClass)) {
  writeln(arg.type:string);
}

proc ll(arg:unmanaged MyClass) {
  writeln(arg.type:string);
}
proc ll(arg) {
  writeln(arg.type:string);
}



proc test() {
  var a = new borrowed MyClass(new borrowed OtherClass(1));
  var b = new borrowed Concrete();
  g(a);
  h(a);
  i(a);
  j(a);
  k(a);
  ll(a);
  ll(b);
}

test();
