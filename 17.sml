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
val n = getInt(); 
val ml = getIntTable(n);

fun min(a:int,b:int)= 
    if a> b then b else a

fun max(a:int,b:int) = if a> b then a else b

fun reverseTabel([],m,x:int) = []
    | reverseTabel(x::xs,m,n:int) = 
        if n>0 then reverseTabel(xs@[x],x::m,n-1)
        else m

val reml = reverseTabel(ml,[],n);

fun swapvalue(x,len,n,m,cnt,rst) = 
    if cnt < min(n,m) then swapvalue(x,len,n,m,cnt+1,rst@[List.nth(x,cnt)])
    else if cnt = min(n,m) then swapvalue(x,len,n,m,cnt+1,rst@[List.nth(x,max(n,m))])
    else if cnt > min(n,m) andalso cnt < max(n,m) then swapvalue(x,len,n,m,cnt+1,rst@[List.nth(x,cnt)])
    else if cnt = max(n,m) then swapvalue(x,len,n,m,cnt+1,rst@[List.nth(x,min(n,m))])
    else if cnt > max(n,m) andalso cnt < len then swapvalue(x,len,n,m,cnt+1,rst@[List.nth(x,cnt)])
    else rst

fun nextp(x,n:int,i:int,j:int) = 
    if i >= 0 andalso List.nth(x,i) >= List.nth(x,i+1)
        then nextp(x,n,i-1,j)
        else if i >= 0 
            then if j >= 0 andalso List.nth(x,i) >= List.nth(x,j)
                    then nextp(x,n,i,j-1)
                    else List.take(swapvalue(x,n,i,j,0,[]),i+1)@List.rev(List.drop(swapvalue(x,n,i,j,0,[]),i+1))
            else []
        
val rst = nextp(reml,n,n-2,n-1);

printIntTable(List.rev(rst));
(*****End*****)
