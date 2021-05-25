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

fun printIntTable ( [] ) = ()
  | printIntTable ( x::xs ) = 
    let
	val tmp = printInt(x)
    in
	printIntTable(xs)
    end;

fun printIntInfTable ( [] ) = ()
  | printIntInfTable ( x::xs ) = 
    let
	val tmp = printIntInf(x)
    in
	printIntInfTable(xs)
    end;

fun getIntTable ( 0 ) = []
  | getIntTable ( N:int) = getInt()::getIntTable(N-1);

fun getIntInfTable ( 0 ) = []
  | getIntInfTable ( N:int) = getIntInf()::getIntInfTable(N-1);

(*****Begin*****)
val n= getInt();
val ml = getIntTable(n);
fun maxll(a,b)=if a>b then a else b

fun maxNumTabel(x::xs,n:int,max:int):int=
    let val ma = maxll(max,x)
    in
        if n>0 then maxNumTabel(xs@[x],n-1,ma)
        else max
    end
  | maxNumTabel(nil,_,_) = ~1

fun output(ans:int) =  
    if ans= ~1 then printString("Empty Table")
    else printInt(ans)

val ans = maxNumTabel(ml,n,0);
output(ans);
(*****End*****)

