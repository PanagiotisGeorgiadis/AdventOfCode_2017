module Days.Day14 exposing (getPuzzleAnswer, getPuzzleAnswer2)


getPuzzleInput : String
getPuzzleInput =
    -- "hfdlxzhv"
    "flqrgnkx"


getPuzzleInputRows : List String
getPuzzleInputRows =
    List.map
        (\index ->
            getPuzzleInput ++ "-" ++ toString index
        )
        (List.range 0 127)


getPuzzleAnswer : String
getPuzzleAnswer =
    toString getPuzzleInputRows


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    ""
