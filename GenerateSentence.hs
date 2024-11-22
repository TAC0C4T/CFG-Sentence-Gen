module GenerateSentence where
    import Types
    import Data.Int

    genSym :: Sym -> [Int] -> Rule -> String
    genSym (T str) _ rules = str
    genSym (NT str) (h:t) rules = let ruleList = fromJust (lookup str rules) in
        let chosenAlt = ruleList !! mod h (length ruleList) in
            concatMap (\sym -> genSym sym t rules) chosenAlt

    gen :: Rule -> [Int] -> String -> String
    gen rule (h:t) start = let ruleList = fromJust (lookup start rules) in
        let chosenAlt = ruleList !! mod h (length ruleList) in
            concatMap (\sym -> genSym sym t rules) chosenAlt


    rands :: IO [Int]
    rands = do n <- randomIO :: IO Int
               ns <- rands
               return (n : ns)