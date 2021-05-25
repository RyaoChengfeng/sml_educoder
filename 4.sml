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
val a = getIntInf();
val n = getIntInf();
val m = getIntInf();
val k = 1000000007;
fun fnl(a:IntInf.int, n:IntInf.int) = 
        if n = 0 then 1
        else if (n mod 2)=1 
        then fnl(a,n-1)*a mod k
        else (fnl(a:IntInf.int,(n div 2):IntInf.int) mod k) * (fnl(a:IntInf.int,(n div 2):IntInf.int) mod k) mod k


val ans = fnl(a,n);
printIntInf(ans mod m);

(*****End*****)
