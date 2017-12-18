module Days.Day17 exposing (..)

import Array exposing (..)


getPuzzleInput : Int
getPuzzleInput =
    349


stepForward : Int -> Int -> List Int -> Int
stepForward steps currentPosition result =
    if List.isEmpty result then
        0
    else if currentPosition + steps >= List.length result then
        (currentPosition + steps) % List.length result
    else
        currentPosition + steps


addValueToPosition : Int -> Int -> List Int -> List Int
addValueToPosition position value result =
    let
        listBeforeIndex =
            List.take (position + 1) result

        listAfterIndex =
            List.drop (position + 1) result

        updatedList =
            listBeforeIndex ++ [ value ] ++ listAfterIndex
    in
    updatedList



-- Version with List
-- constructCircularBuffer : List Int -> Int -> List Int -> List Int
-- constructCircularBuffer bufferValues currentPosition result =
--     let
--         updatedBufferValues =
--             List.drop 1 bufferValues
--
--         updatedCurrentPosition =
--             -- stepForward 3 currentPosition result
--             stepForward getPuzzleInput currentPosition result
--
--         targetValue =
--             Maybe.withDefault -1 <|
--                 List.head bufferValues
--
--         updatedResult =
--             addValueToPosition updatedCurrentPosition targetValue result
--     in
--     if List.isEmpty bufferValues then
--         result
--     else
--         constructCircularBuffer updatedBufferValues (updatedCurrentPosition + 1) updatedResult
--
--
-- Version With Indexes.


constructCircularBuffer : Int -> Int -> Int -> List Int -> List Int
constructCircularBuffer index maxIndex currentPosition result =
    let
        updatedIndex =
            index + 1

        updatedCurrentPosition =
            stepForward getPuzzleInput currentPosition result

        updatedResult =
            addValueToPosition updatedCurrentPosition index result
    in
    if index > maxIndex then
        result
    else
        constructCircularBuffer updatedIndex maxIndex (updatedCurrentPosition + 1) updatedResult


getValueAfterTargetValue : Int -> Int -> List Int -> Int
getValueAfterTargetValue currentValue targetValue circularBuffer =
    let
        updatedCurrentValue =
            Maybe.withDefault -1 <|
                List.head circularBuffer

        updatedCircularBuffer =
            List.drop 1 circularBuffer
    in
    if currentValue == targetValue || List.isEmpty circularBuffer then
        updatedCurrentValue
    else
        getValueAfterTargetValue updatedCurrentValue targetValue updatedCircularBuffer


getPuzzleAnswer : String
getPuzzleAnswer =
    let
        circularBuffer =
            -- constructCircularBuffer (List.range 0 2017) 0 []
            constructCircularBuffer 0 2017 0 []

        targetValue =
            getValueAfterTargetValue 0 2017 circularBuffer
    in
    toString targetValue



-- getPuzzleAnswer : String
-- getPuzzleAnswer =
--     "640"
-- getPuzzleAnswer2 : String
-- getPuzzleAnswer2 =
--     let
--         circularBuffer =
--             constructCircularBuffer 0 50000000 0 []
--
--         _ =
--             Debug.log "circularBuffer" circularBuffer
--
--         -- targetValue =
--         -- getValueAfterTargetValue 0 0 circularBuffer
--     in
--     -- toString targetValue
--     ""


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    "Try with array."
