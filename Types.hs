module Types where
    import Data.Map

    data Sym = NT String
        | T String
        | E
    
    type Alt = [Sym]

    type Rule = Map String [Alt]