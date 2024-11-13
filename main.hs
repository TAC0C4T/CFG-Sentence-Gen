import Types
-- import ReadGrammar

main :: IO ()
main = do
    f <- readFile "grammars/g1"
    print f