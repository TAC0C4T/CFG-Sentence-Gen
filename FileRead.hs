module FileRead where
    import IOString
    
    fileRead :: string -> IOString
    fileRead fileName = 
        readFile