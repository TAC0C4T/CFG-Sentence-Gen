import Types
import ReadGrammar
import GenerateSentence

main :: IO ()
main = do
    f <- readFile "grammars/g6"
    randList <- rands 10000
    print $ gen (readGrammar f) randList "S"