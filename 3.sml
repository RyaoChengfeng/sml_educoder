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

type vector = int * int;

fun det(v1:vector, v2:vector):int =
    (#1 v1 * #2 v2 - #1 v2 * #2 v1);


(*****Begin*****)
fun mul(a,b):int = a*b;
val a1  = getInt();
val b1 = getInt();
val c1 = getInt();
val a2  = getInt();
val b2 = getInt();
val c2 = getInt();
val m = mul(c1,b2)-mul(c2,b1);
val n = mul(a1,b2)-mul(a2,b1);
val x = if n=0 then 0 else m div n;
if x=0 then printString("No Solution") else printInt(x);

	    
(*****End*****)
