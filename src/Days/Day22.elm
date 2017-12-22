module Days.Day22 exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (..)


type alias Position =
    ( Int, Int )


type NodeState
    = Cleaned
    | Infected
    | NoState


type VirusCarrierState
    = Awake
    | Working
    | Sleeping


type Direction
    = Left
    | Right
    | Down
    | Up


transformToStateFullNodes : Array NodeState -> String -> Array NodeState
transformToStateFullNodes result inputLine =
    let
        ( selectedChar, updatedInputLine ) =
            Maybe.withDefault ( ' ', "" ) <|
                String.uncons inputLine

        updatedResult =
            case selectedChar of
                '.' ->
                    Array.push Cleaned result

                '#' ->
                    Array.push Infected result

                _ ->
                    result
    in
    if String.isEmpty inputLine then
        result
    else
        transformToStateFullNodes updatedResult updatedInputLine


applySaltToMap : List String -> List String
applySaltToMap inputLines =
    let
        saltedLine =
            String.repeat 25 "."

        updatedInput =
            List.map
                (\l ->
                    String.padRight 75 '.' <|
                        String.padLeft 50 '.' l
                )
                inputLines
    in
    List.repeat 25 saltedLine ++ updatedInput ++ List.repeat 25 saltedLine


getPuzzleInput : String
getPuzzleInput =
    """
.########.....#...##.####
....#..#.#.##.###..#.##..
##.#.#..#.###.####.##.#..
####...#...####...#.##.##
..#...###.#####.....##.##
..#.##.######.#...###...#
.#....###..##....##...##.
##.##..####.#.######...##
#...#..##.....#..#...#..#
........#.##..###.#.....#
#.#..######.#.###..#...#.
.#.##.##..##.####.....##.
.....##..#....#####.#.#..
...#.#.#..####.#..###..#.
##.#..##..##....#####.#..
.#.#..##...#.#####....##.
.####.#.###.####...#####.
...#...######..#.##...#.#
#..######...#.####.#..#.#
...##..##.#.##.#.#.#....#
###..###.#..#.....#.##.##
..#....##...#..#..##..#..
.#.###.##.....#.###.#.###
####.##...#.#....#..##...
#.....#.#..#.##.#..###..#
"""


determineDirection : NodeState -> Direction -> Direction
determineDirection nodeState prevDirection =
    let
        direction =
            case nodeState of
                Cleaned ->
                    case prevDirection of
                        Left ->
                            Down

                        Right ->
                            Up

                        Down ->
                            Right

                        Up ->
                            Left

                Infected ->
                    case prevDirection of
                        Right ->
                            Down

                        Left ->
                            Up

                        Up ->
                            Right

                        Down ->
                            Left

                _ ->
                    prevDirection
    in
    direction


getCenterPointPosition : Array String -> Position
getCenterPointPosition matrix =
    let
        rowIndex =
            (+) (Array.length matrix % 2) <|
                (Array.length matrix // 2)

        columnLength =
            String.length <|
                Maybe.withDefault "" <|
                    Array.get 0 matrix

        columnIndex =
            (columnLength % 2) + (columnLength // 2)
    in
    ( rowIndex - 1, columnIndex - 1 )


getUpdatedPosition : Position -> Direction -> Position
getUpdatedPosition ( rowIndex, columnIndex ) updatedDirection =
    case updatedDirection of
        Up ->
            ( rowIndex - 1, columnIndex )

        Down ->
            ( rowIndex + 1, columnIndex )

        Left ->
            ( rowIndex, columnIndex - 1 )

        Right ->
            ( rowIndex, columnIndex + 1 )


getNodeStateFromPosition : Position -> Array (Array NodeState) -> NodeState
getNodeStateFromPosition ( rowIndex, columnIndex ) matrix =
    let
        nodeState =
            Maybe.withDefault NoState <|
                Array.get columnIndex <|
                    Maybe.withDefault (Array.fromList []) <|
                        Array.get rowIndex matrix
    in
    nodeState


toggleNodeStateInPosition : Position -> Array (Array NodeState) -> Array (Array NodeState)
toggleNodeStateInPosition ( rowIndex, columnIndex ) matrix =
    let
        nodeState =
            Maybe.withDefault NoState <|
                Array.get columnIndex <|
                    Maybe.withDefault (Array.fromList []) <|
                        Array.get (rowIndex - 1) matrix

        updatedState =
            case nodeState of
                Cleaned ->
                    Infected

                Infected ->
                    Cleaned

                NoState ->
                    Debug.crash <| toString rowIndex

        -- nodeState
        updatedRow =
            Array.set columnIndex updatedState <|
                Maybe.withDefault (Array.fromList []) <|
                    Array.get (rowIndex - 1) matrix
    in
    Array.set (rowIndex - 1) updatedRow matrix


moveVirusCarrier : Int -> Array (Array NodeState) -> Position -> Direction -> Int -> Int
moveVirusCarrier index matrix currentPosition direction infectionsCount =
    let
        updatedDirection =
            determineDirection (getNodeStateFromPosition currentPosition matrix) direction

        updatedCurrentPosition =
            getUpdatedPosition currentPosition direction

        updatedMatrix =
            toggleNodeStateInPosition currentPosition matrix

        updatedInfectionsCount =
            case getNodeStateFromPosition updatedCurrentPosition updatedMatrix of
                Infected ->
                    infectionsCount + 1

                _ ->
                    infectionsCount

        _ =
            Debug.log "determineDirection" <| determineDirection (getNodeStateFromPosition currentPosition matrix) direction

        _ =
            Debug.log "getNodeStateFromPosition" <| getNodeStateFromPosition currentPosition matrix

        _ =
            Debug.log "getUpdatedPosition" <| getUpdatedPosition currentPosition direction
    in
    if index > 50 then
        infectionsCount
    else
        moveVirusCarrier (index + 1) updatedMatrix updatedCurrentPosition updatedDirection updatedInfectionsCount


getPuzzleAnswer : String
getPuzzleAnswer =
    let
        -- puzzleRows =
        --     Array.fromList <|
        --         applySaltToMap <|
        --             List.filter (not << String.isEmpty) <|
        --                 String.lines getPuzzleInput
        --
        -- startingPosition =
        --     getCenterPointPosition puzzleRows
        --
        -- transformedRows =
        --     Array.map
        --         (transformToStateFullNodes (Array.fromList []))
        --         puzzleRows
        --         exampleInput =
        --             """
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- ...............#.............
        -- .............#...............
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- .............................
        -- """
        exampleInput =
            """
.........
.........
.........
.....#...
...#.....
.........
.........
.........
.........
"""

        rows =
            Array.fromList <|
                List.filter (not << String.isEmpty) <|
                    String.lines exampleInput

        startingPosition =
            getCenterPointPosition rows

        transformedRows =
            Array.map
                (transformToStateFullNodes (Array.fromList []))
                rows

        infectedIndexes =
            moveVirusCarrier 0 transformedRows startingPosition Up 0

        -- _ =
        --     Debug.log "startingPosition" startingPosition
        --
        -- _ =
        --     Debug.log "transformedRows" <| Array.get 0 transformedRows
        --
        -- _ =
        --     Debug.log "puzzleRows Length" <| Array.length puzzleRows
        --
        -- _ =
        --     Debug.log "line length" <| String.length <| Maybe.withDefault "" <| Array.get 0 puzzleRows
        --
        -- _ =
        --     Debug.log "puzzleRows" puzzleRows
        _ =
            Debug.log "startingPosition" startingPosition
    in
    toString infectedIndexes


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    ""
