import Types
import ReadGrammar
import GenerateSentence
import System.Random

main :: IO ()
main = do
    f <- readFile "grammars/g1"
    -- gen (readGrammar f) 
    print f