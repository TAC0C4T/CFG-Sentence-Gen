module GenerateSentence where
    genSym :: Sym -> [Int] -> Rule -> String
    genSym (T str) _ rules = str
    genSym (NT str) (h:t) rules = let ruleList = fromJust (lookup str rules) 
        chosenAlt = ruleList !! mod h (length ruleList) in
            concatmap (\sym -> genSym sym t rules) chosenAlt

    gen :: Rule -> [Int] -> String -> String
    gen rule (h:t) start = let ruleList = fromJust (lookup start rules)
        chosenAlt = ruleList !! mod h (length ruleList) in
            concatmap (\sym -> genSym sym t rules) chosenAlt

    rands :: Random -> IO[Int]
    rands r = do n <- nextInt r
        ns <- rands r
        return n in ns