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

fun getIntVector ( 0 ) =  Vector.fromList []
  | getIntVector ( N:int) = Vector.fromList(getIntTable(N));

fun getIntInfVector ( 0 ) = Vector.fromList []
  | getIntInfVector ( N:int) = Vector.fromList(getIntInfTable(N));


(*****Begin*****)
val N = getInt();
val M = getInt();
val x = getInt();
val y = getInt();
fun dp(0,0) = 0
  | dp(0,b) = if b<0 then 0
              else if x = 1 then 
              if b >= y - 2 then 0
              else 1
              else if x = 2 then
              if b >= y - 1 then 0
              else 1
              else 1
  | dp(a,0) = if a<0 then 0
              else if y = 2 then
              if a >= x - 1 then 0
              else 1
              else if y = 1 then
              if a >= x - 2 then 0
              else 1
              else 1        
  | dp(a,b) = if a<0 then 0
              else if b<0 then 0
              else if a=x then if b=y then 0
              else dp(a-1,b) + dp(a,b-1)
              else if a=x-2 then
              if b=y-1 then 0
              else if b = y+1 then 0
              else dp(a-1,b) + dp(a,b-1)
              else if a=x+2 then
              if b=y-1 then 0
              else if b = y+1 then 0
              else dp(a-1,b) + dp(a,b-1)
              else if a = x-1 then
              if b = y-2 then 0
              else if b= y+2 then 0
              else dp(a-1,b) + dp(a,b-1)
              else if a = x+1 then
              if b = y-2 then 0
              else if b= y+2 then 0
              else dp(a-1,b) + dp(a,b-1)
              else dp(a-1,b) + dp(a,b-1);
printInt(dp(N,M));

(*****End*****)

