module ReadGrammar where
    import Data.List.Split
    import Types
    import Data.Map

    readGrammar :: String -> Rule
    readGrammar rule = Prelude.foldr parseRule empty (lines rule)

    
    parseRule :: String -> Rule -> Rule
    parseRule str rule = 
        let ruleName = takeWhile (/= '>') str in
             let alts = makeTerm (parseAlts str) in
                insert ruleName alts rule 

-- parse the string into a list of alts, formatted "(alt)|(alt)|(alt)" with the rule name removed
    getAlts :: String -> [String]
    getAlts alts = splitOn "|" reverse takeWhile (/= '>') reverse alts

    makeTerm :: [String] -> [Sym]
    makeTerm [] = []
    makeTerm (h:t) = (T h : makeNonTerm t)

    makeNonTerm :: [String] -> [Sym]
    makeNonTerm [] = []
    makeNonTerm (h:t) = (NT h : makeTerm t)

-- turn getAlts [String] into [Alts]
    parseAlts :: String -> [String]
    parseAlts alts = Data.Map.map (\alt -> splitOn "_" alt) (getAlts alts)
