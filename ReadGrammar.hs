module ReadGrammar where
    import Data.List.Split
    import Types

    readGrammar :: String -> Rule
    readGrammar rule = foldr parseRule empty (lines rule)

    
    parseRule :: String -> Rule -> Rule
    parseRule str rule = 
        let ruleName = takeWhile (/= '>') str
            alts = parseAlts str               
        in insert ruleName alts rule 

-- parse the string into a list of alts, formatted "(alt)|(alt)|(alt)" with the rule name removed
    getAlts :: String -> [String]
    getAlts alts = splitOn "|" reverse takewhile (/= '>') reverse alts

    makeTerm :: [String] -> [Sym]
    makeTerm [] = []
    makeTerm alts(h:t) = (T h : makeNonTerm t)

    makeNonTerm :: [String] -> [Sym]
    makeNonTerm [] = []
    makeNonTerm alts(h:t) = (NT h : makeTerm t)

-- turn getAlts [String] into [Alts]
    parseAlts :: String -> [String]
    parseAlts alts = splitOn "_" (getAlts alts)
