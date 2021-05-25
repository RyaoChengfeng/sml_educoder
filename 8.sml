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
val a1= getIntInf();
val a2  =  getIntInf();
val b1 = getIntInf();
val b2 = getIntInf();


fun maxnum(x:IntInf.int,y:IntInf.int):IntInf.int = 
    if (x mod y)=0 then y
    else if (y mod x)=0 then x 
    else if x > y then maxnum(x mod y,y) 
    else maxnum(x, y mod x)

val mu = a2 * b2;
val zi = a1*b2 + a2*b1;
val h = maxnum(mu,zi);

printIntInf(zi div h);
printIntInf(mu div h);

(*****End*****)
