module GenerateSentence where
    import Types
    import Data.Int
    import System.Random
    import Data.Map as M

    genSym :: Sym -> [Int] -> Rule -> String
    genSym (T str) _ rules = str
    genSym E _ _= ""
    genSym (NT str) (h:t) rules = let Just ruleList = (M.lookup str rules) in
        let chosenAlt = ruleList !! mod h (length ruleList) in
            concatMap (\sym -> genSym sym t rules) chosenAlt

    gen :: Rule -> [Int] -> String -> String
    gen rule (h:t) start = let Just ruleList = (M.lookup start rule) in
        let chosenAlt = ruleList !! mod h (length ruleList) in
            concatMap (\sym -> genSym sym t rule) chosenAlt


    rands :: Int -> IO [Int]
    rands 0 = return []
    rands x = do n <- randomIO :: IO Int
                 ns <- rands (x - 1)
                 return (n : ns)