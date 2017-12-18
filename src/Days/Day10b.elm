module Days.Day10b exposing (applyKnotHash, getDenseHash, getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (..)
import Bitwise as Bitwise
import Common exposing (..)
import Helpers.Ascii exposing (..)


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
                        Maybe.withDefault -100 <|
                            Array.get index inputArray
                    )
                    selectedIndexes

        updatedArray =
            updateArray inputArray selectedIndexes selectedElements
    in
    updatedArray


updateCurrentPosition : Int -> Int -> Int
updateCurrentPosition tempCurrentPosition arrayLength =
    let
        updatedCurrentPosition =
            if tempCurrentPosition >= arrayLength then
                tempCurrentPosition - arrayLength
            else
                tempCurrentPosition
    in
    if updatedCurrentPosition >= arrayLength then
        updateCurrentPosition updatedCurrentPosition arrayLength
    else
        updatedCurrentPosition


updateAllParameters : Array Int -> Int -> Int -> List Int -> Int -> ( Int, Int, List Int )
updateAllParameters inputArray currentPosition skipSize sequenceOfLengths selectedLength =
    let
        tempCurrentPosition =
            currentPosition + skipSize + selectedLength

        updatedSequenceOfLengths =
            List.drop 1 sequenceOfLengths

        updatedCurrentPosition =
            -- updateCurrentPosition tempCurrentPosition (Array.length inputArray)
            if tempCurrentPosition >= Array.length inputArray then
                tempCurrentPosition % Array.length inputArray
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
                        performBitwiseXOR (Array.slice (index * 16) ((index * 16) + 16) sparseHashArray) 0
                    )
                    (List.range 0 15)
    in
    denseHashArray



-- getPuzzleAnswer2 : String
-- getPuzzleAnswer2 =
--     let
--         inputArray =
--             Array.fromList <|
--                 List.range 0 255
--
--         asciiList =
--             String.foldl
--                 (\c r ->
--                     r ++ getAsciiFromChar c ++ ","
--                 )
--                 ""
--                 getPuzzleInput
--
--         sequenceOfLengths =
--             List.map (Result.withDefault -1 << String.toInt) <|
--                 String.split "," <|
--                     -- Empty String example.
--                     -- "17,31,73,47,23"
--                     -- "AoC 2017" example.
--                     -- "65,111,67,32,50,48,49,55,17,31,73,47,23"
--                     -- 1,2,3 example.
--                     -- "49,44,50,44,51,17,31,73,47,23"
--                     -- 1,2,4 example.
--                     -- "49,44,50,44,52,17,31,73,47,23"
--                     (asciiList ++ "17,31,73,47,23")
--
--         updatedSequenceOfLengths =
--             List.repeat 64 sequenceOfLengths
--
--         sparseHashArray =
--             applyKnotHash inputArray 0 0 <| List.concat updatedSequenceOfLengths
--
--         denseHashArray =
--             getDenseHash sparseHashArray
--
--         knotHash =
--             Array.foldl
--                 (\i r ->
--                     r ++ i
--                 )
--                 ""
--                 (Array.map (convertDecimalToHex "") denseHashArray)
--     in
--     toString knotHash


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    "9d5f4561367d379cfbf04f8c471c0095"
