quicksort [] = []
quicksort (x:xs,cmp) =
    let smallerSorted = quicksort [a | a <- xs, cmp a x] cmp
        biggerSoted = quicksort [a | a <- xs, !(cmp a x)] cmp
    in smallerSorted ++ [x] ++ biggerSoted