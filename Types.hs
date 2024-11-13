module Types where

    data Sym = NT String
        | T String
    
    type Alt = [Sym]

    type Rule = Map String [Alt]

    type Grammar = [Rule]
    