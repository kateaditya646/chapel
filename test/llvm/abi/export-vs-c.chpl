// This test checks the ABI handling for export functions
// by comparing the declarations with those generated by clang.

// Note that this file is shared among platforms but symlinked
// to directories for each arch so that the .good files can differ.

// If the declarations change for some reason, check the full output
//  * do the types/attributes still match?
//  * does the movement of data to/from arguments look similar?
//    (it does not have to be identical as long as the same values
//     are read from / stored in the arguments)

import IO;

extern {
  #include <stdio.h>
  #include <stdbool.h>
  #include <inttypes.h>
  #include <complex.h>
  #include <string.h>

  // prototypes and type definitions
  void print_output_prefix(void);

  int64_t int64_return_c_____(void);
  void int64_arg_c_____(int64_t i);

  int32_t int32_return_c_____(void);
  void int32_arg_c_____(int32_t i);

  int16_t int16_return_c_____(void);
  void int16_arg_c_____(int16_t i);

  int8_t int8_return_c_____(void);
  void int8_arg_c_____(int8_t i);


  uint64_t uint64_return_c_____(void);
  void uint64_arg_c_____(uint64_t i);

  uint32_t uint32_return_c_____(void);
  void uint32_arg_c_____(uint32_t i);

  uint16_t uint16_return_c_____(void);
  void uint16_arg_c_____(uint16_t i);

  uint8_t uint8_return_c_____(void);
  void uint8_arg_c_____(uint8_t i);


  bool bool_return_c_____(void);
  void bool_arg_c_____(bool i);


  float float_return_c_____(void);
  void float_arg_c_____(float i);

  double double_return_c_____(void);
  void double_arg_c_____(double i);

  float complex complexf_return_c_____(void);
  void complexf_arg_c_____(float complex x);

  double complex complexd_return_c_____(void);
  void complexd_arg_c_____(double complex x);


  struct c_one_int {
    int a;
  };
  struct c_one_int struct_one_int_return_c_____(void);
  void struct_one_int_arg_c_____(struct c_one_int arg);

  struct c_one_long {
    long a;
  };
  struct c_one_long struct_one_long_return_c_____(void);
  void struct_one_long_arg_c_____(struct c_one_long arg);

  struct c_one_float {
    float a;
  };
  struct c_one_float struct_one_float_return_c_____(void);
  void struct_one_float_arg_c_____(struct c_one_float arg);

  struct c_one_double {
    double a;
  };
  struct c_one_double struct_one_double_return_c_____(void);
  void struct_one_double_arg_c_____(struct c_one_double arg);


  struct c_pair_int {
    int a;
    int b;
  };
  struct c_pair_int struct_pair_int_return_c_____(void);
  void struct_pair_int_arg_c_____(struct c_pair_int arg);

  struct c_pair_long {
    long a;
    long b;
  };
  struct c_pair_long struct_pair_long_return_c_____(void);
  void struct_pair_long_arg_c_____(struct c_pair_long arg);

  struct c_pair_float {
    float a;
    float b;
  };
  struct c_pair_float struct_pair_float_return_c_____(void);
  void struct_pair_float_arg_c_____(struct c_pair_float arg);

  struct c_pair_double {
    double a;
    double b;
  };
  struct c_pair_double struct_pair_double_return_c_____(void);
  void struct_pair_double_arg_c_____(struct c_pair_double arg);

  struct c_triple {
    int64_t a;
    int64_t b;
    int64_t c;
  };
  struct c_triple struct_triple_return_c_____(void);
  void struct_triple_arg_c_____(struct c_triple arg);

  struct c_twelve {
    int64_t a;
    int64_t b;
    int64_t c;
    int64_t d;
    int64_t e;
    int64_t f;
    int64_t g;
    int64_t h;
    int64_t i;
    int64_t j;
    int64_t k;
    int64_t l;
  };
  struct c_twelve struct_twelve_return_c_____(void);
  void struct_twelve_arg_c_____(struct c_twelve arg);

  // this example inspired by an example in
  // System V Application Binary Interface AMD64 Architecture Processor Supplement (With LP64 and ILP32 Programming Models) Version 1.0
  typedef struct {
    int a, b;
    double d;
  } abistruct;
  void abistructfunc_c_____(int e, int f,
                            abistruct s, int g, int h,
                            /*long*/ double ld, double m,
                            double n, int i, int j, int k);

  struct paddingtest {
    unsigned char c1;
    uint16_t h2;
    int64_t d3;
  };
  struct paddingtest struct_paddingtest_return_c_____(void);
  void struct_paddingtest_arg_c_____(struct paddingtest arg);


  // function definitions
  int64_t int64_return_c_____(void) {
    return -1;
  }
  void int64_arg_c_____(int64_t i) {
    print_output_prefix();
    printf("arg %i\n", (int) i);
  }

  int32_t int32_return_c_____(void) {
    return -1;
  }
  void int32_arg_c_____(int32_t i) {
    print_output_prefix();
    printf("arg %i\n", (int) i);
  }

  int16_t int16_return_c_____(void) {
    return -1;
  }
  void int16_arg_c_____(int16_t i) {
    print_output_prefix();
    printf("arg %i\n", (int) i);
  }

  int8_t int8_return_c_____(void) {
    return -1;
  }
  void int8_arg_c_____(int8_t i) {
    print_output_prefix();
    printf("arg %i\n", (int) i);
  }


  uint64_t uint64_return_c_____(void) {
    return 0xffffffffffffffffull;
  }
  void uint64_arg_c_____(uint64_t i) {
    print_output_prefix();
    printf("arg %llu\n", (unsigned long long) i);
  }

  uint32_t uint32_return_c_____(void) {
    return 0xffffffff;
  }
  void uint32_arg_c_____(uint32_t i) {
    print_output_prefix();
    printf("arg %u\n", (unsigned int) i);
  }

  uint16_t uint16_return_c_____(void) {
    return 0xffff;
  }
  void uint16_arg_c_____(uint16_t i) {
    print_output_prefix();
    printf("arg %i\n", (int) i);
  }

  uint8_t uint8_return_c_____(void) {
    return 0xff;
  }
  void uint8_arg_c_____(uint8_t i) {
    print_output_prefix();
    printf("arg %i\n", (int) i);
  }

  bool bool_return_c_____(void) {
    return true;
  }
  void bool_arg_c_____(bool i) {
    print_output_prefix();
    printf("arg %i\n", (int) i);
  }

  float float_return_c_____(void) {
    return 0.125;
  }
  void float_arg_c_____(float i) {
    print_output_prefix();
    printf("arg %f\n", (double) i);
  }

  double double_return_c_____(void) {
    return true;
  }
  void double_arg_c_____(double i) {
    print_output_prefix();
    printf("arg %f\n", i);
  }

  float complex complexf_return_c_____(void) {
    return true;
  }
  void complexf_arg_c_____(float complex x) {
    print_output_prefix();
    printf("arg %f %f\n", (double) crealf(x), (double) cimagf(x));
  }

  double complex complexd_return_c_____(void) {
    return true;
  }
  void complexd_arg_c_____(double complex x) {
    print_output_prefix();
    printf("arg %f %f\n", (double) creal(x), (double) cimag(x));
  }


  struct c_one_int struct_one_int_return_c_____(void) {
    struct c_one_int one;
    one.a = -2;
    return one;
  }
  void struct_one_int_arg_c_____(struct c_one_int arg) {
    print_output_prefix();
    printf("arg.a %i\n", arg.a);
  }

  struct c_one_long struct_one_long_return_c_____(void) {
    struct c_one_long one;
    one.a = -8;
    return one;
  }
  void struct_one_long_arg_c_____(struct c_one_long arg) {
    print_output_prefix();
    printf("arg.a %li\n", arg.a);
  }

  struct c_one_float struct_one_float_return_c_____(void) {
    struct c_one_float one;
    one.a = 12.0;
    return one;
  }
  void struct_one_float_arg_c_____(struct c_one_float arg) {
    print_output_prefix();
    printf("arg.a %f\n", (double) arg.a);
  }

  struct c_one_double struct_one_double_return_c_____(void) {
    struct c_one_double one;
    one.a = 15.0;
    return one;
  }
  void struct_one_double_arg_c_____(struct c_one_double arg) {
    print_output_prefix();
    printf("arg.a %f\n", (double) arg.a);
  }


  struct c_pair_int struct_pair_int_return_c_____(void) {
    struct c_pair_int pair;
    pair.a = 0;
    pair.b = 1;
    return pair;
  }
  void struct_pair_int_arg_c_____(struct c_pair_int arg) {
    print_output_prefix();
    printf("arg.a %i arg.b %i\n", arg.a, arg.b);
  }

  struct c_pair_long struct_pair_long_return_c_____(void) {
    struct c_pair_long pair;
    pair.a = 0;
    pair.b = 1;
    return pair;
  }
  void struct_pair_long_arg_c_____(struct c_pair_long arg) {
    print_output_prefix();
    printf("arg.a %li arg.b %li\n", arg.a, arg.b);
  }

  struct c_pair_float struct_pair_float_return_c_____(void) {
    struct c_pair_float pair;
    pair.a = 0;
    pair.b = 1;
    return pair;
  }
  void struct_pair_float_arg_c_____(struct c_pair_float arg) {
    print_output_prefix();
    printf("arg.a %f arg.b %f\n", (double) arg.a, (double) arg.b);
  }

  struct c_pair_double struct_pair_double_return_c_____(void) {
    struct c_pair_double pair;
    pair.a = 0;
    pair.b = 1;
    return pair;
  }
  void struct_pair_double_arg_c_____(struct c_pair_double arg) {
    print_output_prefix();
    printf("arg.a %f arg.b %f\n", (double) arg.a, (double) arg.b);
  }


  struct c_triple struct_triple_return_c_____(void) {
    struct c_triple t;
    t.a = 0;
    t.b = 1;
    t.c = 2;
    return t;
  }
  void struct_triple_arg_c_____(struct c_triple arg) {
    print_output_prefix();
    printf("arg.a %li arg.b %li arg.c %li\n",
           (long) arg.a, (long) arg.b, (long) arg.c);
  }

  struct c_twelve struct_twelve_return_c_____(void) {
    struct c_twelve t;
    t.a = 0;
    t.b = 1;
    t.c = 2;
    t.d = 3;
    t.e = 4;
    t.f = 5;
    t.g = 6;
    t.h = 7;
    t.i = 8;
    t.j = 9;
    t.k = 10;
    t.l = 11;
    return t;
  }
  void struct_twelve_arg_c_____(struct c_twelve arg) {
    print_output_prefix();
    printf("arg.a %li arg.b %li arg.c %li "
           "arg.d %li arg.e %li arg.f %li "
           "arg.g %li arg.h %li arg.i %li "
           "arg.j %li arg.k %li arg.l %li\n",
           (long) arg.a, (long) arg.b, (long) arg.c,
           (long) arg.d, (long) arg.e, (long) arg.f,
           (long) arg.g, (long) arg.h, (long) arg.i,
           (long) arg.j, (long) arg.k, (long) arg.l);
  }

  void abistructfunc_c_____(int e, int f,
                            abistruct s, int g, int h,
                            /*long*/ double ld, double m,
                            double n, int i, int j, int k) {
    print_output_prefix();
    printf("e %i f %i "
           "s.a %i s.b %i s.d %f g %i h %i "
           "ld %f m %f"
           "n %f i %i j %i k %i\n",
           e, f,
           s.a, s.b, s.d, g, h,
           ld, m,
           n, i, j, k);
  }

  struct paddingtest struct_paddingtest_return_c_____(void) {
    struct paddingtest t;
    memset(&t, 0, sizeof(t));
    t.c1 = 1;
    t.h2 = 2;
    t.d3 = 3;
    return t;
  }
  void struct_paddingtest_arg_c_____(struct paddingtest arg) {
    print_output_prefix();
    printf("arg.c1 %i arg.h2 %i arg.d3 %li\n",
           arg.c1, arg.h2, (long) arg.d3);
  }
}

var phase: string;
export proc print_output_prefix() {
  IO.stdout.write("OUTPUT ");
  IO.stdout.write(phase);
  IO.stdout.write(": ");
  IO.stdout.flush();
}
proc start_phase(name:string) {
  writeln("OUTPUT ", name);
  phase = name;
}

export proc int64_return_chapel(): int(64) {
  return int64_return_c_____();
}
export proc int64_arg_chapel(i: int(64)) {
  int64_arg_c_____(i);
}

export proc int32_return_chapel(): int(32) {
  return int32_return_c_____();
}
export proc int32_arg_chapel(i: int(32)) {
  int32_arg_c_____(i);
}

export proc int16_return_chapel(): int(16) {
  return int16_return_c_____();
}
export proc int16_arg_chapel(i: int(16)) {
  int16_arg_c_____(i);
}

export proc int8_return_chapel(): int(8) {
  return int8_return_c_____();
}
export proc int8_arg_chapel(i: int(8)) {
  int8_arg_c_____(i);
}


export proc uint64_return_chapel(): uint(64) {
  return uint64_return_c_____();
}
export proc uint64_arg_chapel(i: uint(64)) {
  uint64_arg_c_____(i);
}

export proc uint32_return_chapel(): uint(32) {
  return uint32_return_c_____();
}
export proc uint32_arg_chapel(i: uint(32)) {
  uint32_arg_c_____(i);
}

export proc uint16_return_chapel(): uint(16) {
  return uint16_return_c_____();
}
export proc uint16_arg_chapel(i: uint(16)) {
  uint16_arg_c_____(i);
}

export proc uint8_return_chapel(): uint(8) {
  return uint8_return_c_____();
}
export proc uint8_arg_chapel(i: uint(8)) {
  uint8_arg_c_____(i);
}


export proc bool_return_chapel(): bool {
  return bool_return_c_____();
}
export proc bool_arg_chapel(i: bool) {
  bool_arg_c_____(i);
}

export proc float_return_chapel(): real(32) {
  return float_return_c_____();
}
export proc float_arg_chapel(i: c_float) {
  float_arg_c_____(i);
}

export proc double_return_chapel(): c_double {
  return double_return_c_____();
}
export proc double_arg_chapel(i: real(64)) {
  double_arg_c_____(i);
}

export proc complexf_return_chapel(): complex(64) {
  return complexf_return_c_____();
}
export proc complexf_arg_chapel(i: complex(64)) {
  complexf_arg_c_____(i);
}

export proc complexd_return_chapel(): complex(128) {
  return complexd_return_c_____();
}
export proc complexd_arg_chapel(i: complex(128)) {
  complexd_arg_c_____(i);
}


export proc struct_one_int_return_chapel(): c_one_int {
  var one:c_one_int;
  one = struct_one_int_return_c_____();
  return one;
}
export proc struct_one_int_arg_chapel(in arg: c_one_int) {
  struct_one_int_arg_c_____(arg);
}

export proc struct_one_long_return_chapel(): c_one_long {
  var one:c_one_long;
  one = struct_one_long_return_c_____();
  return one;
}
export proc struct_one_long_arg_chapel(in arg: c_one_long) {
  struct_one_long_arg_c_____(arg);
}

export proc struct_one_float_return_chapel(): c_one_float {
  var one:c_one_float;
  one = struct_one_float_return_c_____();
  return one;
}
export proc struct_one_float_arg_chapel(in arg: c_one_float) {
  struct_one_float_arg_c_____(arg);
}

export proc struct_one_double_return_chapel(): c_one_double {
  var one:c_one_double;
  one = struct_one_double_return_c_____();
  return one;
}
export proc struct_one_double_arg_chapel(in arg: c_one_double) {
  struct_one_double_arg_c_____(arg);
}


export proc struct_pair_int_return_chapel(): c_pair_int {
  var pair:c_pair_int;
  pair = struct_pair_int_return_c_____();
  return pair;
}
export proc struct_pair_int_arg_chapel(in arg: c_pair_int) {
  struct_pair_int_arg_c_____(arg);
}

export proc struct_pair_long_return_chapel(): c_pair_long {
  var pair:c_pair_long;
  pair = struct_pair_long_return_c_____();
  return pair;
}
export proc struct_pair_long_arg_chapel(in arg: c_pair_long) {
  struct_pair_long_arg_c_____(arg);
}

export proc struct_pair_float_return_chapel(): c_pair_float {
  var pair:c_pair_float;
  pair = struct_pair_float_return_c_____();
  return pair;
}
export proc struct_pair_float_arg_chapel(in arg: c_pair_float) {
  struct_pair_float_arg_c_____(arg);
}

export proc struct_pair_double_return_chapel(): c_pair_double {
  var pair:c_pair_double;
  pair = struct_pair_double_return_c_____();
  return pair;
}
export proc struct_pair_double_arg_chapel(in arg: c_pair_double) {
  struct_pair_double_arg_c_____(arg);
}


export proc struct_triple_return_chapel(): c_triple {
  var tt:c_triple;
  tt = struct_triple_return_c_____();
  return tt;
}
export proc struct_triple_arg_chapel(in arg: c_triple) {
  struct_triple_arg_c_____(arg);
}

export proc struct_twelve_return_chapel(): c_twelve {
  var tt:c_twelve;
  tt = struct_twelve_return_c_____();
  return tt;
}
export proc struct_twelve_arg_chapel(in arg: c_twelve) {
  struct_twelve_arg_c_____(arg);
}

export proc abistructfunc_chapel(e: c_int, f: c_int,
                                 in s: abistruct, g: c_int, h: c_int,
                                 ld: real(64), m: real(64),
                                 n: real(64), i: c_int, j: c_int, k: c_int) {
  abistructfunc_c_____(e, f, s, g, h, ld, m, n, i, j, k);
}

export proc struct_paddingtest_return_chapel(): paddingtest {
  var tt:paddingtest;
  tt = struct_paddingtest_return_c_____();
  return tt;
}
export proc struct_paddingtest_arg_chapel(in arg: paddingtest) {
  struct_paddingtest_arg_c_____(arg);
}


proc main() {
  {
    var i:int(64);
    start_phase("testing int64_..._c_____");
    i = int64_return_c_____();
    int64_arg_c_____(i);
    start_phase("testing int64_..._chapel");
    i = int64_return_chapel();
    int64_arg_chapel(i);
  }
  {
    var i:int(32);
    start_phase("testing int32_..._c_____");
    i = int32_return_c_____();
    int32_arg_c_____(i);
    start_phase("testing int32_..._chapel");
    i = int32_return_chapel();
    int32_arg_chapel(i);
  }
  {
    var i:int(16);
    start_phase("testing int16_..._c_____");
    i = int16_return_c_____();
    int16_arg_c_____(i);
    start_phase("testing int16_..._chapel");
    i = int16_return_chapel();
    int16_arg_chapel(i);
  }
  {
    var i:int(8);
    start_phase("testing int8_..._c_____");
    i = int8_return_c_____();
    int8_arg_c_____(i);
    start_phase("testing int8_..._chapel");
    i = int8_return_chapel();
    int8_arg_chapel(i);
  }

  {
    var i:uint(64);
    start_phase("testing uint64_..._c_____");
    i = uint64_return_c_____();
    uint64_arg_c_____(i);
    start_phase("testing uint64_..._chapel");
    i = uint64_return_chapel();
    uint64_arg_chapel(i);
  }
  {
    var i:uint(32);
    start_phase("testing uint32_..._c_____");
    i = uint32_return_c_____();
    uint32_arg_c_____(i);
    start_phase("testing uint32_..._chapel");
    i = uint32_return_chapel();
    uint32_arg_chapel(i);
  }
  {
    var i:uint(16);
    start_phase("testing uint16_..._c_____");
    i = uint16_return_c_____();
    uint16_arg_c_____(i);
    start_phase("testing uint16_..._chapel");
    i = uint16_return_chapel();
    uint16_arg_chapel(i);
  }
  {
    var i:uint(8);
    start_phase("testing uint8_..._c_____");
    i = uint8_return_c_____();
    uint8_arg_c_____(i);
    start_phase("testing uint8_..._chapel");
    i = uint8_return_chapel();
    uint8_arg_chapel(i);
  }

  {
    var i:bool;
    start_phase("testing bool_..._c_____");
    i = bool_return_c_____();
    bool_arg_c_____(i);
    start_phase("testing bool_..._chapel");
    i = bool_return_chapel();
    bool_arg_chapel(i);
  }

  {
    var i:real(32);
    start_phase("testing float_..._c_____");
    i = float_return_c_____();
    float_arg_c_____(i);
    start_phase("testing float_..._chapel");
    i = float_return_chapel();
    float_arg_chapel(i);
  }

  {
    var i:real(64);
    start_phase("testing double_..._c_____");
    i = double_return_c_____();
    double_arg_c_____(i);
    start_phase("testing double_..._chapel");
    i = double_return_chapel();
    double_arg_chapel(i);
  }

  {
    var i:complex(64);
    start_phase("testing complexf_..._c_____");
    i = complexf_return_c_____();
    complexf_arg_c_____(i);
    start_phase("testing complexf_..._chapel");
    i = complexf_return_chapel();
    complexf_arg_chapel(i);
  }

  {
    var i:complex(128);
    start_phase("testing complexd_..._c_____");
    i = complexd_return_c_____();
    complexd_arg_c_____(i);
    start_phase("testing complexd_..._chapel");
    i = complexd_return_chapel();
    complexd_arg_chapel(i);
  }


  {
    var one:c_one_int;
    start_phase("testing struct_one_int..._c_____");
    one = struct_one_int_return_c_____();
    struct_one_int_arg_c_____(one);
    start_phase("testing struct_one_int..._chapel");
    one = struct_one_int_return_chapel();
    struct_one_int_arg_chapel(one);
  }

  {
    var one:c_one_long;
    start_phase("testing struct_one_long..._c_____");
    one = struct_one_long_return_c_____();
    struct_one_long_arg_c_____(one);
    start_phase("testing struct_one_long..._chapel");
    one = struct_one_long_return_chapel();
    struct_one_long_arg_chapel(one);
  }

  {
    var one:c_one_float;
    start_phase("testing struct_one_float..._c_____");
    one = struct_one_float_return_c_____();
    struct_one_float_arg_c_____(one);
    start_phase("testing struct_one_float..._chapel");
    one = struct_one_float_return_chapel();
    struct_one_float_arg_chapel(one);
  }

  {
    var one:c_one_double;
    start_phase("testing struct_one_double..._c_____");
    one = struct_one_double_return_c_____();
    struct_one_double_arg_c_____(one);
    start_phase("testing struct_one_double..._chapel");
    one = struct_one_double_return_chapel();
    struct_one_double_arg_chapel(one);
  }

  {
    var pair:c_pair_int;
    start_phase("testing struct_pair_int..._c_____");
    pair = struct_pair_int_return_c_____();
    struct_pair_int_arg_c_____(pair);
    start_phase("testing struct_pair_int..._chapel");
    pair = struct_pair_int_return_chapel();
    struct_pair_int_arg_chapel(pair);
  }

  {
    var pair:c_pair_long;
    start_phase("testing struct_pair_long..._c_____");
    pair = struct_pair_long_return_c_____();
    struct_pair_long_arg_c_____(pair);
    start_phase("testing struct_pair_long..._chapel");
    pair = struct_pair_long_return_chapel();
    struct_pair_long_arg_chapel(pair);
  }

  {
    var pair:c_pair_float;
    start_phase("testing struct_pair_float..._c_____");
    pair = struct_pair_float_return_c_____();
    struct_pair_float_arg_c_____(pair);
    start_phase("testing struct_pair_float..._chapel");
    pair = struct_pair_float_return_chapel();
    struct_pair_float_arg_chapel(pair);
  }

  {
    var pair:c_pair_double;
    start_phase("testing struct_pair_double..._c_____");
    pair = struct_pair_double_return_c_____();
    struct_pair_double_arg_c_____(pair);
    start_phase("testing struct_pair_double..._chapel");
    pair = struct_pair_double_return_chapel();
    struct_pair_double_arg_chapel(pair);
  }


  {
    var ttt:c_triple;
    start_phase("testing struct_triple_..._c_____");
    ttt = struct_triple_return_c_____();
    struct_triple_arg_c_____(ttt);
    start_phase("testing struct_triple_..._chapel");
    ttt = struct_triple_return_chapel();
    struct_triple_arg_chapel(ttt);
  }

  {
    var ttt:c_twelve;
    start_phase("testing struct_twelve_..._c_____");
    ttt = struct_twelve_return_c_____();
    struct_twelve_arg_c_____(ttt);
    start_phase("testing struct_twelve_..._chapel");
    ttt = struct_twelve_return_chapel();
    struct_twelve_arg_chapel(ttt);
  }


  {
    var e: c_int = 0;
    var f: c_int = 1;
    var s: abistruct;
    s.a = 2;
    s.b = 3;
    s.d = 12.25;
    var g: c_int = 4;
    var h: c_int = -5;
    var ld: real(64) = 66.0;
    var m: real(64) = 1.125;
    var n: real(64) = 10000;
    var i: c_int = 7;
    var j: c_int = 8;
    var k: c_int = -1;
    start_phase("testing abistructfunc_c_____");
    abistructfunc_c_____(e, f, s, g, h, ld, m, n, i, j, k);
    start_phase("testing abistructfunc_chapel");
    abistructfunc_chapel(e, f, s, g, h, ld, m, n, i, j, k);
  }
}
