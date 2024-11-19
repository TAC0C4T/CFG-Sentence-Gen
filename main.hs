import Types
 import ReadGrammar
 import GenerateSentence

main :: IO ()
main = do
    f <- readFile "grammars/g1"
    gen (readGrammar f) rands 
    print f