-- any imports go here

{-Begin Question 1.1-}
digits :: Int -> [Int]
digits a
  = map (\x -> read [x]:: Int) stra
  where
  stra = show a
{-End Question 1.1-}


{-Begin Question 1.2-}
isPar :: Int -> Bool
isPar x =
  (secnum `mod` firstnum == 0) && (uniquedigits diglist)
  where
   diglist = digits x
   firstnum = (10 * diglist !! 0) + diglist !! 1
   secnum = (10 * diglist !! 2) + diglist !! 3

-- check in list whether all values are unique
uniquedigits :: [Int] -> Bool
uniquedigits [] = True
uniquedigits (x:xs)
  | x `elem` xs = False
  | otherwise = uniquedigits xs


pars :: [Int]
pars = [x | x <- [1111..9999], isPar x, not (0 `elem` digits x)]

{-End Question 1.2-}

{-Begin Question 1.3-}
isParty :: (Int, Int) -> Bool
isParty (a,b) =
  let
  otherdigit = missdigit $ digits a ++ digits b
  aDiv = a `mod` otherdigit == 0
  bDiv = b `mod` otherdigit == 0
  allunique = uniquedigits $ digits a ++ digits b
  in
  aDiv && bDiv && allunique

-- returns digit 1-9 missing from list
missdigit :: [Int] -> Int
missdigit digList = head [x | x <- [1..9],  x `notElem` digList]

partys :: [(Int, Int)]
partys = [(x,y) | x<- pars, y <- pars, isParty(x,y)]

{-End Question 1.3-}

-- any main functions for testing goes here
