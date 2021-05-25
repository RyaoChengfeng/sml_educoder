fun printInt (a:int) =
    print(Int.toString(a)^" ");

fun printIntInf (a:IntInf.int) =
    print(IntInf.toString(a)^" ");


fun printReal (a:real) =
    print(Real.toString(a)^" ");

fun printString (a:string) =
    print(a^" ");

fun getInt () =
    Option.valOf (TextIO.scanStream (Int.scan StringCvt.DEC) TextIO.stdIn);

fun getIntInf () =
    Option.valOf (TextIO.scanStream (IntInf.scan StringCvt.DEC) TextIO.stdIn);

fun getReal () =
    Option.valOf (TextIO.scanStream (Real.scan) TextIO.stdIn);

(*****Begin*****)
val n = getIntInf();
val m = getIntInf();

fun fab(a:IntInf.int, b:IntInf.int, n:IntInf.int):IntInf.int = 
    if n>3 then fab(b mod m,(a+b)mod m,n-1)
    else a+b;

val ans:IntInf.int = fab(1,1,n) mod m;
printIntInf(ans);
(*****End*****)