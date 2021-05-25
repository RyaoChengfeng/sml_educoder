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

type vector = IntInf.int  * IntInf.int;
type mat = vector * vector;
val n:IntInf.int = getIntInf();
val m:IntInf.int = getIntInf();
fun mat_mult(mat1:mat, mat2:mat) : mat =(
    ( (#1(#1 mat1)* #1(#1 mat2) + #2(#1 mat1)* #1(#2 mat2)) mod m, (#1(#1 mat1)* #2(#1 mat2) + #2(#1 mat1)* #2(#2 mat2)) mod m),
    ( (#1(#2 mat1)* #1(#1 mat2) + #2(#2 mat1)* #1(#2 mat2)) mod m, (#1(#2 mat1)* #2(#1 mat2) + #2(#2 mat1)* #2(#2 mat2)) mod m) );

fun power(mat1:mat, n:IntInf.int):mat = 
    if n=1  then mat1
    else if n=2 then mat_mult(mat1,mat1)
    else if n mod 2 = 0 then power(power( mat1,n div 2) , 2)
        else mat_mult( power( power(mat1, (n-1) div 2), 2 ), mat1);

val  mat1 :mat = ( (1,1),
                   (1,0) ); 


val ans:IntInf.int = #2(#1 (power(mat1,n)));
printIntInf(ans);
(*****End*****)
