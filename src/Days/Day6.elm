module Days.Day6 exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (Array)


getPuzzleInput : String
getPuzzleInput =
    "4 1 15 12 0 9 9 5 5 8 7 3 14 5 12 3"


getExampleInput : String
getExampleInput =
    "0 2 7 0"


areIdentical : Array Int -> Array Int -> Bool
areIdentical updatedMemoryBanks memoryBanks =
    let
        equalityList =
            List.map2
                (\item1 item2 ->
                    item1 == item2
                )
                (Array.toList updatedMemoryBanks)
                (Array.toList memoryBanks)
    in
    if Array.length updatedMemoryBanks == Array.length memoryBanks then
        List.all identity equalityList
    else
        False


applyMemoryAllocation : Int -> Int -> Array Int -> Array Int
applyMemoryAllocation remainder index memoryBanks =
    let
        updatedIndex =
            if (index + 1) >= Array.length memoryBanks then
                0
            else
                index + 1

        ( updatedArray, updatedRemainder ) =
            if remainder >= 0 then
                ( Array.set updatedIndex ((+) 1 <| Maybe.withDefault 0 <| Array.get updatedIndex memoryBanks) memoryBanks
                , remainder - 1
                )
            else
                ( memoryBanks, remainder )
    in
    if updatedRemainder > 0 then
        applyMemoryAllocation updatedRemainder updatedIndex updatedArray
    else
        updatedArray


getStepsForMemoryAllocation : Array Int -> List (Array Int) -> Int -> Bool -> Int
getStepsForMemoryAllocation memoryBanks history steps shouldExecuteAgain =
    let
        maxValue =
            Array.foldl
                (\bank r ->
                    if bank > r then
                        bank
                    else
                        r
                )
                0
                memoryBanks

        ( maxIndex, _ ) =
            Array.foldl
                (\bank r ->
                    if Tuple.second r then
                        r
                    else if bank == maxValue then
                        ( Tuple.first r, True )
                    else
                        ( Tuple.first r + 1, False )
                )
                ( 0, False )
                memoryBanks

        updatedMemoryBanks =
            applyMemoryAllocation maxValue maxIndex (Array.set maxIndex 0 memoryBanks)

        answer =
            List.any
                (\bank ->
                    if areIdentical updatedMemoryBanks bank then
                        True
                    else
                        False
                )
                history
    in
    if answer == False then
        getStepsForMemoryAllocation updatedMemoryBanks (List.append [ memoryBanks ] history) (steps + 1) shouldExecuteAgain
    else if answer && shouldExecuteAgain then
        getStepsForMemoryAllocation updatedMemoryBanks [ Array.initialize 0 identity ] 0 False
    else
        steps + 1


getPuzzleAnswer : String
getPuzzleAnswer =
    let
        puzzleInput =
            Array.fromList <|
                List.map (Result.withDefault -1 << String.toInt) <|
                    -- String.split " " getPuzzleInput
                    String.split " " getExampleInput

        stepsForMemoryAllocation =
            getStepsForMemoryAllocation puzzleInput [ Array.initialize 0 identity ] 0 False
    in
    "Answer for Example Input because it takes too long to execute the puzzle answer: " ++ toString stepsForMemoryAllocation


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    let
        puzzleInput =
            Array.fromList <|
                List.map (Result.withDefault -1 << String.toInt) <|
                    -- String.split " " getPuzzleInput
                    String.split " " getExampleInput

        stepsForSecondMemoryAllocation =
            getStepsForMemoryAllocation puzzleInput [ Array.initialize 0 identity ] 0 True
    in
    "Answer 2 for Example Input because it takes too long to execute the puzzle answer: " ++ toString stepsForSecondMemoryAllocation
