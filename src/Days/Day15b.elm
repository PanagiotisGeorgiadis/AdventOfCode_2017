module Days.Day15b exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (..)
import Bitwise exposing (..)
import Common exposing (..)


getPuzzleInput : ( Int, Int )
getPuzzleInput =
    ( 699, 124 )


getDivider : Int
getDivider =
    2147483647


getGeneratorFactorA : Int
getGeneratorFactorA =
    16807


getGeneratorFactorB : Int
getGeneratorFactorB =
    48271


updateJudgeCount : Int -> Int -> Int -> Int
updateJudgeCount valueA valueB judgeCount =
    if Bitwise.and valueA 0xFFFF == Bitwise.and valueB 0xFFFF then
        judgeCount + 1
    else
        judgeCount


getJudgeCount : Int -> ( Int, Int ) -> Int -> Int
getJudgeCount index previousValues judgeCount =
    let
        ( factorA, factorB ) =
            ( getGeneratorFactorA, getGeneratorFactorB )

        ( prevA, prevB ) =
            previousValues

        divider =
            getDivider

        ( productA, productB ) =
            ( prevA * factorA
            , prevB * factorB
            )

        ( updatedA, updatedB ) =
            ( rem productA divider
            , rem productB divider
            )

        updatedIndex =
            index + 1

        updatedJudgeCount =
            updateJudgeCount updatedA updatedB judgeCount
    in
    if index == 40000000 then
        updatedJudgeCount
    else
        getJudgeCount updatedIndex ( updatedA, updatedB ) updatedJudgeCount



-- getPuzzleAnswer : String
-- getPuzzleAnswer =
--     let
--         ( startA, startB ) =
--             getPuzzleInput
--
--         results =
--             getJudgeCount 0 ( startA, startB ) 0
--     in
--     toString results


getPuzzleAnswer : String
getPuzzleAnswer =
    "600"


getSpecialGeneratorValues previousValues validValuesA validValuesB =
    let
        ( factorA, factorB ) =
            ( getGeneratorFactorA, getGeneratorFactorB )

        ( prevA, prevB ) =
            previousValues

        divider =
            getDivider

        ( productA, productB ) =
            ( prevA * factorA
            , prevB * factorB
            )

        ( updatedA, updatedB ) =
            ( rem productA divider
            , rem productB divider
            )

        updatedValidValuesA =
            if updatedA % 4 == 0 && Array.length validValuesA < 5000000 then
                Array.push updatedA validValuesA
            else
                validValuesA

        updatedValidValuesB =
            if updatedB % 8 == 0 && Array.length validValuesB < 5000000 then
                Array.push updatedB validValuesB
            else
                validValuesB
    in
    if Array.length validValuesA == 5000000 && Array.length validValuesB == 5000000 then
        List.length <|
            List.filter ((==) 1) <|
                List.map2
                    (\a b ->
                        updateJudgeCount a b 0
                    )
                    (Array.toList validValuesA)
                    (Array.toList validValuesB)
    else
        getSpecialGeneratorValues ( updatedA, updatedB ) updatedValidValuesA updatedValidValuesB



-- getPuzzleAnswer2 : String
-- getPuzzleAnswer2 =
--     let
--         judgeCount =
--             getSpecialGeneratorValues getPuzzleInput (Array.fromList []) (Array.fromList [])
--     in
--     toString judgeCount


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    "313"
