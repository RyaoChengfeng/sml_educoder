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
val n =  getInt();
val m = getInt();
val li = getIntVector(n);
val fin = getIntVector(m);

fun binary_search(obj,xs,left,right) = 
  let
  val m = (left+right) div 2
  val value = Vector.sub(xs,m)
  in
  if left>right then ~1
  else if obj < value then binary_search(obj,xs,left,m-1)
  else if obj > value then binary_search(obj,xs,m+1,right)
  else if obj = value then m
  else ~1
  end;

fun output(num,cnt) = 
  let
  val obj = Vector.sub(fin,cnt)
  val rst = binary_search(obj,li,0,n-1)
  val tmp = printInt(rst)
  in
  if num-1>cnt then output(num,cnt+1)
  else ()
  end;

output(m,0);

(*****End*****)

