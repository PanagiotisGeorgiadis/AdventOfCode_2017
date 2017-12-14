module Days.Day10b exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (..)
import Bitwise as Bitwise


getPuzzleInput : String
getPuzzleInput =
    "106,118,236,1,130,0,235,254,59,205,2,87,129,25,255,118"


getExampleInput : String
getExampleInput =
    "3,4,1,5"


removeDuplicateIndexes : List Int -> List Int
removeDuplicateIndexes indexes =
    List.foldl
        (\index r ->
            if List.member index r then
                r
            else
                List.append r [ index ]
        )
        []
        indexes


updateArray : Array Int -> List Int -> List Int -> Array Int
updateArray inputArray selectedIndexes selectedElements =
    let
        index =
            Maybe.withDefault -1 <|
                List.head selectedIndexes

        value =
            Maybe.withDefault -1 <|
                List.head selectedElements

        updatedArray =
            Array.set index value inputArray

        updatedSelectedIndexes =
            List.drop 1 selectedIndexes

        updatedSelectedElements =
            List.drop 1 selectedElements
    in
    if List.isEmpty selectedElements then
        inputArray
    else
        updateArray updatedArray updatedSelectedIndexes updatedSelectedElements


getUpdatedArray : Array Int -> List ( Int, Int ) -> Array Int
getUpdatedArray inputArray selectionRanges =
    let
        selectedIndexes =
            removeDuplicateIndexes <|
                List.concat <|
                    List.map
                        (\( start, end ) ->
                            List.range start (end - 1)
                        )
                        selectionRanges

        selectedElements =
            List.reverse <|
                List.map
                    (\index ->
                        Maybe.withDefault -1 <|
                            Array.get index inputArray
                    )
                    selectedIndexes

        updatedArray =
            updateArray inputArray selectedIndexes selectedElements
    in
    updatedArray


updateAllParameters : Array Int -> Int -> Int -> List Int -> Int -> ( Int, Int, List Int )
updateAllParameters inputArray currentPosition skipSize sequenceOfLengths selectedLength =
    let
        tempCurrentPosition =
            currentPosition + skipSize + selectedLength

        updatedSequenceOfLengths =
            List.drop 1 sequenceOfLengths

        updatedCurrentPosition =
            if tempCurrentPosition >= Array.length inputArray then
                tempCurrentPosition - Array.length inputArray
            else
                tempCurrentPosition

        updatedSkipSize =
            skipSize + 1
    in
    ( updatedCurrentPosition, updatedSkipSize, updatedSequenceOfLengths )


applyKnotHash : Array Int -> Int -> Int -> List Int -> Array Int
applyKnotHash inputArray currentPosition skipSize sequenceOfLengths =
    let
        selectedLength =
            Maybe.withDefault -1 <|
                List.head sequenceOfLengths

        selectionRanges =
            if selectedLength > Array.length inputArray then
                []
            else if currentPosition + selectedLength >= Array.length inputArray then
                [ ( currentPosition, Array.length inputArray )
                , ( 0, selectedLength - (Array.length inputArray - currentPosition) )
                ]
            else
                [ ( currentPosition, currentPosition + selectedLength ) ]

        updatedArray =
            getUpdatedArray inputArray selectionRanges

        ( updatedCurrentPosition, updatedSkipSize, updatedSequenceOfLengths ) =
            updateAllParameters inputArray currentPosition skipSize sequenceOfLengths selectedLength
    in
    if List.isEmpty sequenceOfLengths then
        inputArray
    else
        applyKnotHash updatedArray updatedCurrentPosition updatedSkipSize updatedSequenceOfLengths



-- getPuzzleAnswer : String
-- getPuzzleAnswer =
--     let
--         inputArray =
--             Array.fromList <|
--                 -- List.range 0 4
--                 List.range 0 255
--
--         sequenceOfLengths =
--             List.map
--                 (\item ->
--                     Result.withDefault -1 <|
--                         String.toInt item
--                 )
--                 -- (String.split "," getExampleInput)
--                 (String.split "," getPuzzleInput)
--
--         knotHashArray =
--             applyKnotHash inputArray 0 0 sequenceOfLengths
--
--         firstElemements =
--             List.product <|
--                 List.take 2 <|
--                     Array.toList knotHashArray
--     in
--     toString firstElemements


getPuzzleAnswer : String
getPuzzleAnswer =
    "6909"


getSecondPuzzleInput : String
getSecondPuzzleInput =
    -- "106,118,236,1,130,0,235,254,59,205,2,87,129,25,255,118"
    "049,048,054,044,049,049,056,044,050,051,054,044,049,044,049,051,048,044,048,044,050,051,053,044,050,053,052,044,053,057,044,050,048,053,044,050,044,056,055,044,049,050,057,044,050,053,044,050,053,053,044,049,049,056"


getSparseHash : Array Int -> List Int -> Array Int
getSparseHash inputArray sequenceOfLengths =
    let
        updatedSequenceOfLengths =
            List.foldl
                (\_ r ->
                    List.append r sequenceOfLengths
                )
                []
                (List.range 0 63)

        sparseHashArray =
            applyKnotHash inputArray 0 0 updatedSequenceOfLengths
    in
    sparseHashArray



-- Array.fromList []


performBitwiseXOR : Array Int -> Int -> Int
performBitwiseXOR array previousResult =
    let
        ( updatedArray, result ) =
            ( Array.slice 1 (Array.length array) array
            , Bitwise.xor previousResult <| Maybe.withDefault 0 <| Array.get 0 array
            )
    in
    if Array.isEmpty array then
        previousResult
    else
        performBitwiseXOR updatedArray result


getDenseHash : Array Int -> Array Int
getDenseHash sparseHashArray =
    let
        denseHashArray =
            Array.fromList <|
                List.indexedMap
                    (\index item ->
                        performBitwiseXOR (Array.slice (index * 16) ((index + 1) * 16) sparseHashArray) -1
                    )
                    (List.range 0 15)
    in
    denseHashArray


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    let
        inputArray =
            Array.fromList <|
                -- List.range 0 4
                List.range 0 255

        sequenceOfLengths =
            List.map (Result.withDefault -1 << String.toInt) <|
                String.split "," <|
                    (getSecondPuzzleInput ++ "," ++ "17,31,73,47,23")

        sparseHashArray =
            getSparseHash inputArray sequenceOfLengths

        denseHashArray =
            getDenseHash sparseHashArray
    in
    -- toString <| List.length updatedSequenceOfLengths
    toString denseHashArray
