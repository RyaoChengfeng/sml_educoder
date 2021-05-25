fun printInt (a:int) =
    print(Int.toString(a)^" ");

fun printReal (a:real) =
    print(Real.toString(a)^" ");

fun printString (a:string) =
    print(a^" ");

fun getInt () =
    Option.valOf (TextIO.scanStream (Int.scan StringCvt.DEC) TextIO.stdIn);
    
fun getReal () =
    Option.valOf (TextIO.scanStream (Real.scan) TextIO.stdIn);

val m  = getInt();
val n = getInt();
fun gcd(m,n)= 
    if m=0 then n else gcd(n mod m,m);

printInt(gcd(m,n));