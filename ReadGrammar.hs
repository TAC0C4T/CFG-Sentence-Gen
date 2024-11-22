module ReadGrammar where
    import Data.List.Split
    import Types
    import Data.Map

    readGrammar :: String -> Rule
    readGrammar rule = Prelude.foldr parseRule empty (lines rule)


    parseRule :: String -> Rule -> Rule
    parseRule str rule = let sym = takeWhile (/='>') str
                             rest = tail (dropWhile (/='>') str)
                             altStrs = splitOn "|" rest
                             altList = Prelude.map (splitOn "_") altStrs
                             alts = Prelude.map makeTerm altList
                         in insert sym alts rule


    makeTerm :: [String] -> [Sym]
    makeTerm [] = []
    makeTerm ("`":t) = E : makeNonTerm t
    makeTerm (h:t) = T h : makeNonTerm t

    makeNonTerm :: [String] -> [Sym]
    makeNonTerm [] = []
    makeNonTerm (h:t) = NT h : makeTerm t

