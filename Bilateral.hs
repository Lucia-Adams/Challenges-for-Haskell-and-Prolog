-- any imports go here
import Data.List

{-Begin Question 2.1-}
number :: [Int] -> Int
number list
  = read (concat charlist) :: Int
  where
  charlist = map show list

{-End Question 2.1-}

{-Begin Question 2.2 -}
splits :: [a] -> [([a],[a])]
splits [x,y] = [([x],[y])]
splits xs
  = map lastAET (splits initList) ++ [(initList, [lastElem])]
  where lastElem = last xs
        initList = init xs
        lastAET = addEndTuple lastElem

addEndTuple :: a -> ([a],[a]) -> ([a],[a])
addEndTuple z (xs,ys) = (xs, ys ++ [z])

possibles :: [([Int],[Int])]
possibles = concat (map splits (permutations [1..9]))

{-End Question 2.2-}

{-Begin Question 2.3-}
isAcceptable :: ([Int],[Int]) -> Bool
isAcceptable (xs,ys)
  =  (minNumEnd == 3) && (prodStart == 4) && pallin
  where
  numxs = number xs
  numys = number ys
  prod = numxs * numys
  pallin = isPallindrome prod
  prodStart = head $ digits prod
  minNumEnd = last $ digits (min (numxs) (numys))

isPallindrome :: Int -> Bool
isPallindrome a
   = digitList == reverse digitList
  where
  digitList = digits a

-- from part 1
digits :: Int -> [Int]
digits a
  = map (\x -> read [x]:: Int) stra
  where
  stra = show a

acceptables :: [([Int],[Int])]
acceptables = [a | a <- possibles, isAcceptable a ]

{-End Question 2.3-}

-- any main functions for testing goes here
