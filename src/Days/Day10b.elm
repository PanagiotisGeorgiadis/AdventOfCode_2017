module Days.Day10b exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (..)


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
            -- Array.slice 1 <| Array.length selectedIndexes
            -- Array.toList selectedIndexes
            List.drop 1 selectedIndexes

        updatedSelectedElements =
            -- Array.slice 1 <| Array.length selectedElements
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

        _ =
            Debug.log "selectionRanges" selectionRanges

        updatedArray =
            -- List.foldl
            --     (\index r ->
            --         let
            --             newElement =
            --                 Maybe.withDefault -1 <|
            --                     Array.get index selectedElements
            --         in
            --         Array.set index newElement r
            --     )
            --     inputArray
            --     selectedIndexes
            updateArray inputArray selectedIndexes selectedElements

        _ =
            Debug.log "updatedArray" updatedArray
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


calculateKnotHash : Array Int -> Int -> Int -> List Int -> Array Int
calculateKnotHash inputArray currentPosition skipSize sequenceOfLengths =
    let
        selectedLength =
            Maybe.withDefault -1 <|
                List.head sequenceOfLengths

        selectionRanges =
            if selectedLength > Array.length inputArray then
                []
            else if currentPosition + selectedLength >= Array.length inputArray then
                [ ( currentPosition, Array.length inputArray )
                , ( 0, Array.length inputArray - currentPosition )
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
        calculateKnotHash updatedArray updatedCurrentPosition updatedSkipSize updatedSequenceOfLengths


getPuzzleAnswer : String
getPuzzleAnswer =
    let
        inputArray =
            Array.fromList <|
                -- List.range 0 255
                List.range 0 4

        sequenceOfLengths =
            -- Array.fromList <|
            List.map
                (\item ->
                    Result.withDefault -1 <|
                        String.toInt item
                )
                -- (String.split "," getPuzzleInput)
                (String.split "," getExampleInput)

        knotHashArray =
            -- Array.map (calculateKnotHash inputArray 0 0) sequenceOfLengths
            calculateKnotHash inputArray 0 0 sequenceOfLengths

        firstElemements =
            List.product <|
                List.take 2 <|
                    Array.toList knotHashArray
    in
    toString firstElemements


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    ""
