module ReadGrammar where
    import Data.List.Split
    import Types

    readGrammar :: String -> Rule
    readGrammar rule = foldr parseRule (lines rule)

-- insert alts into rule and generate the rule
    parseRule :: String -> Rule -> Rule
    parseRule str rule = insert (takewhile (/= '>') str) (makeTerm (parseAlts str))

-- parse the string into a list of alts, formatted "(alt)|(alt)|(alt)" with the rule name removed
    getAlts :: String -> [String]
    getAlts alts = splitOn "|" reverse takewhile (/= '>') reverse alts

    makeTerm :: [String] -> [Sym]
    makeTerm alts(head : tail) = 
        | null alts = []
        | otherwise = (T head : makeNonTerm tail)

    makeNonTerm :: [String] -> [Sym]
    makeNonTerm alts =
        | null alts = []
        | otherwise (NT head : makeNonTerm tail)

-- turn getAlts [String] into [Alts]
    parseAlts :: String -> [String]
    parseAlts alts = splitOn "_" (getAlts alts)
