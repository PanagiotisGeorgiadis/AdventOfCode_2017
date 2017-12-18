module Days.Day14 exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (..)
import Common exposing (..)
import Days.Day10b exposing (..)
import Helpers.Ascii exposing (..)


getPuzzleInput : String
getPuzzleInput =
    -- "flqrgnkx"
    "hfdlxzhv"


getPuzzleInputRows : List String
getPuzzleInputRows =
    List.map
        (\index ->
            getPuzzleInput ++ "-" ++ toString index
        )
        (List.range 0 127)


getGridRows : Array Int -> List String -> Array String -> Array String
getGridRows inputArray puzzleRows result =
    let
        targetRow =
            Maybe.withDefault "" <| List.head puzzleRows

        sequenceOfLengths =
            String.foldl
                (\c r ->
                    List.append r <|
                        List.singleton <|
                            Result.withDefault -1 <|
                                String.toInt <|
                                    getAsciiFromChar c
                )
                []
                targetRow

        denseHashArray =
            getDenseHash <|
                applyKnotHash inputArray 0 0 <|
                    List.concat <|
                        List.repeat 64 <|
                            List.append sequenceOfLengths [ 17, 31, 73, 47, 23 ]

        knotHash =
            Array.foldl
                (\i r ->
                    r ++ i
                )
                ""
                (Array.map (convertDecimalToHex "") denseHashArray)

        updatedResult =
            Array.push knotHash result

        updatedPuzzleRows =
            List.drop 1 puzzleRows
    in
    if List.isEmpty puzzleRows then
        result
    else
        getGridRows inputArray updatedPuzzleRows updatedResult



-- getPuzzleAnswer : String
-- getPuzzleAnswer =
--     let
--         puzzleRows =
--             getPuzzleInputRows
--
--         inputArray =
--             Array.fromList <|
--                 List.range 0 255
--
--         gridRows =
--             getGridRows inputArray puzzleRows (Array.fromList [])
--
--         gridRowsBinary =
--             Array.map
--                 (\row ->
--                     String.foldl
--                         (\hexChar r ->
--                             r ++ convertHexToBinary hexChar
--                         )
--                         ""
--                         row
--                 )
--                 gridRows
--
--         usedSquares =
--             Array.foldl
--                 (\row r ->
--                     String.foldl
--                         (\c rr ->
--                             if c == '1' then
--                                 rr + 1
--                             else
--                                 rr
--                         )
--                         r
--                         row
--                 )
--                 0
--                 gridRowsBinary
--     in
--     toString usedSquares


getPuzzleAnswer : String
getPuzzleAnswer =
    "8230"


getFirstAvailableRegionIndex : Int -> Array Char -> Int
getFirstAvailableRegionIndex startingIndex binaryArray =
    if startingIndex > Array.length binaryArray then
        -1
    else if (==) '1' <| Maybe.withDefault '0' <| Array.get startingIndex binaryArray then
        startingIndex
    else
        getFirstAvailableRegionIndex (startingIndex + 1) binaryArray


isOnPreviousRow : Int -> Array Char -> Bool
isOnPreviousRow index binaryArray =
    (==) '1' <|
        (Maybe.withDefault '0' <| Array.get (index - 128) binaryArray)


isOnNextRow : Int -> Array Char -> Bool
isOnNextRow index binaryArray =
    (==) '1' <|
        (Maybe.withDefault '0' <| Array.get (index + 128) binaryArray)


isAdjucentRight : Int -> Array Char -> Bool
isAdjucentRight index binaryArray =
    (==) '1' <|
        (Maybe.withDefault '0' <| Array.get (index + 1) binaryArray)


isAdjucentLeft : Int -> Array Char -> Bool
isAdjucentLeft index binaryArray =
    (==) '1' <|
        (Maybe.withDefault '0' <| Array.get (index - 1) binaryArray)


getRegionIndexes : Int -> Array Char -> List Int
getRegionIndexes index binaryArray =
    []
        ++ (if isOnPreviousRow index binaryArray then
                [ index - 128 ]
            else
                []
           )
        ++ (if isOnNextRow index binaryArray then
                [ index + 128 ]
            else
                []
           )
        ++ (if isAdjucentRight index binaryArray then
                [ index + 1 ]
            else
                []
           )
        ++ (if isAdjucentLeft index binaryArray then
                [ index + 1 ]
            else
                []
           )


countRegions : List Int -> Array Char -> Int -> Int
countRegions indexes binaryArray regionCount =
    let
        firstAvailableRegionIndex =
            getFirstAvailableRegionIndex 0 binaryArray

        tempIndexes =
            List.concat <|
                List.map
                    (\i ->
                        getRegionIndexes i binaryArray
                    )
                    indexes

        updatedIndexes =
            if List.isEmpty tempIndexes then
                [ firstAvailableRegionIndex ]
            else
                tempIndexes

        updatedBinaryArray =
            List.foldl
                (\i r ->
                    Array.set i '0' binaryArray
                )
                binaryArray
                indexes

        updatedRegionCount =
            if List.isEmpty indexes then
                regionCount + 1
            else
                regionCount
    in
    if firstAvailableRegionIndex == -1 then
        regionCount
    else
        countRegions updatedIndexes updatedBinaryArray updatedRegionCount


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    let
        -- puzzleRows =
        --     getPuzzleInputRows
        --
        -- inputArray =
        --     Array.fromList <|
        --         List.range 0 255
        --
        -- gridRows =
        --     getGridRows inputArray puzzleRows (Array.fromList [])
        --
        -- gridRowsBinary =
        --     Array.map
        --         (\row ->
        --             String.foldl
        --                 (\hexChar r ->
        --                     r ++ convertHexToBinary hexChar
        --                 )
        --                 ""
        --                 row
        --         )
        --         gridRows
        --
        -- binaryArray =
        --     Array.fromList <|
        --         List.concat <|
        --             List.foldl
        --                 (\row r ->
        --                     List.append r <|
        --                         List.singleton <|
        --                             String.foldl
        --                                 (\item rr ->
        --                                     List.append rr [ item ]
        --                                 )
        --                                 []
        --                                 row
        --                 )
        --                 []
        --                 (Array.toList gridRowsBinary)
        --
        -- _ =
        --     Debug.log "binaryArray" binaryArray
        --
        -- totalRegions =
        --     countRegions [] binaryArray 0
        -- _ = Debug.log "binaryArray" binaryArray
        -- _ = Debug.log "totalRegions" totalRegions
        _ =
            Debug.log "Just a message from Day 14b" ""
    in
    "I think logic is there but needs perfomance improvements"
