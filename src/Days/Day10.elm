module Days.Day10 exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (Array)


getPuzzleInput : String
getPuzzleInput =
    "106,118,236,1,130,0,235,254,59,205,2,87,129,25,255,118"


applySegmentList : Int -> List Int -> List Int -> List Int -> List Int -> List Int
applySegmentList index list segmentsList targetIndexesList resultingList =
    let
        updatedIndex =
            index + 1

        targetElement =
            Maybe.withDefault -1 <|
                Array.get index (Array.fromList resultingList)

        ( updatedSegmentsList, updatedResultingList ) =
            if List.member index targetIndexesList && targetElement == -1 then
                ( List.drop 1 segmentsList
                , List.append resultingList <| List.take 1 segmentsList
                )
            else
                ( segmentsList
                , List.append resultingList <| List.take 1 list
                )

        updatedList =
            List.drop 1 list
    in
    if List.isEmpty list then
        -- Array.toList resultingList
        resultingList
    else
        applySegmentList updatedIndex updatedList updatedSegmentsList targetIndexesList updatedResultingList


updateMultiSegmentList : List Int -> List ( Int, Int ) -> Int -> List Int
updateMultiSegmentList list selections currentPosition =
    let
        selectedIndexes =
            List.take (List.length list) <|
                List.foldl
                    (\s r ->
                        List.append r (List.range (Tuple.first s) (Tuple.second s))
                    )
                    []
                    selections

        _ =
            Debug.log "selectedIndexes" selectedIndexes

        -- updatedSegment =
        --     List.reverse <|
        --         List.filter (\item -> item >= 0) <|
        --             List.indexedMap
        --                 (\index item ->
        --                     if List.member index selectedIndexes then
        --                         item
        --                     else
        --                         -1
        --                 )
        --                 list
        --
        updatedSegment =
            List.reverse <|
                List.map
                    (\index ->
                        Maybe.withDefault -1 <|
                            Array.get index (Array.fromList list)
                    )
                    selectedIndexes

        markedList =
            List.indexedMap
                (\index item ->
                    if List.member index selectedIndexes then
                        -1
                    else
                        item
                )
                list

        applySegment index updatedSegment selectedIndexes results =
            let
                updatedIndex =
                    if index + 1 >= Array.length results then
                        0
                    else
                        index + 1

                targetIndex =
                    Maybe.withDefault -1 <|
                        List.head selectedIndexes

                targetValue =
                    Maybe.withDefault -1 <|
                        Array.get index results

                ( targetElementValue, updatedSelectedIndexes ) =
                    if targetValue == -1 then
                        ( Maybe.withDefault -1 <| Array.get targetIndex updatedSegment
                        , List.drop 1 selectedIndexes
                        )
                    else
                        ( targetValue
                        , selectedIndexes
                        )

                updatedResults =
                    Array.set index targetElementValue results
            in
            if List.isEmpty updatedSelectedIndexes then
                updatedResults
            else
                applySegment 0 updatedSegment updatedSelectedIndexes updatedResults

        updatedList =
            Array.toList <|
                applySegment 0 (Array.fromList updatedSegment) selectedIndexes (Array.fromList markedList)

        _ =
            Debug.log "markedList" markedList

        -- updatedList1 =
        --     List.map
        --         (\item ->
        --
        --         )
        --         (List.repeat (List.length list) -1)
        --
        -- updatedSegment =
        --     List.foldl
        --         (\index r ->
        --             List.append r [ Maybe.withDefault -1 (Array.get index array) ]
        --         )
        --         []
        --         selectedIndexes
        _ =
            Debug.log "updatedSegment" updatedSegment

        --
        -- initialResultsArray =
        --     Array.fromList <|
        --         List.repeat -1 <|
        --             List.length list
        -- updatedList =
        -- applySegmentList 0 list updatedSegment selectedIndexes []
        -- updatedList =
        --     List.indexedMap
        --         (\index item ->
        --             if item == -1 then
        --                 (List.foldl
        --                     (\i ->
        --                         if i == index then
        --                             Array.get index (Array.fromList updatedSegment)
        --                         else
        --                             item
        --                     )
        --                     selectedIndexes
        --                 )
        --             else
        --                 item
        --         )
        --         markedList
        -- applySegmentList 0 list updatedSegment selectedIndexes []
        -- List.indexedMap
        --     (\index item ->
        --         if List.member index selectedIndexes then
        --             getItemByIndex updatedSegment
        --         else
        --             item
        --     )
        --     list
        -- List.map2
        --     (\seg item ->
        --         if seg >= 0 then
        --             seg
        --         else
        --             item
        --     )
        --     updatedSegment
        --     list
    in
    updatedList



-- if List.length selections == 1 then
--     List.append
--         (List.drop startingIndex list)
--         (List.reverse <|
--             List.take selectionLength <|
--                 List.drop startingIndex list
--         )


applyKnotHash : List Int -> Int -> Int -> List Int -> List Int
applyKnotHash list currentPosition skipSize sequenceOfLengths =
    let
        selectedLength =
            Maybe.withDefault 0 <|
                List.head <|
                    List.take 1 sequenceOfLengths

        listLength =
            List.length list

        updatedSelections =
            if currentPosition + selectedLength >= listLength then
                -- [ ( currentPosition, listLength - abs (selectedLength - currentPosition) )
                [ ( currentPosition, listLength - 1 )

                -- , ( 0, selectedLength - (listLength - currentPosition) - 1 )
                , ( 0, abs (selectedLength - (listLength - 1 + currentPosition)) )
                ]
                -- else if currentPosition + selectedLength == listLength then
                -- [ ( currentPosition, listLength - 1 )
                -- , ( 0, (selectedLength + currentPosition) - (listLength - 1) )
                -- ]
            else
                [ ( currentPosition, selectedLength - 1 ) ]

        _ =
            Debug.log "list" list

        _ =
            Debug.log "currentPosition" currentPosition

        _ =
            Debug.log "skipSize" skipSize

        _ =
            Debug.log "sequenceOfLengths" sequenceOfLengths

        _ =
            Debug.log "selectedLength" selectedLength

        _ =
            Debug.log "updatedSelections" updatedSelections

        -- updatedSelectedLengths =
        --     if selectedLength + currentPosition > listLength then
        --         [ listLength
        --         , selectedLength + currentPosition - listLength
        --         ]
        --     else
        --         [ selectedLength + currentPosition ]
        -- updatedList =
        --     List.foldl
        --         (\usl r ->
        --             updateList r currentPosition usl
        --         )
        --         list
        --         updatedSelectedLengths
        updatedList =
            -- if List.length updatedSelections > 1 then
            --     updateMultiSegmentList list updatedSelections currentPosition
            -- else
            --     updateMultiSegmentList list updatedSelections currentPosition
            []

        updatedCurrentPosition =
            if currentPosition + selectedLength + skipSize > listLength then
                currentPosition + selectedLength + skipSize - listLength
            else
                currentPosition + selectedLength + skipSize

        updatedSkipSize =
            skipSize + 1

        -- _ =
        --     Debug.log "list" list
        --
        -- _ =
        --     Debug.log "listLength" listLength
        --
        _ =
            Debug.log "updatedList" updatedList

        --
        -- _ =
        --     Debug.log "updatedSelectedLengths" updatedSelectedLengths
        --
        -- _ =
        --     Debug.log "updatedCurrentPosition" updatedCurrentPosition
        --
        -- _ =
        --     Debug.log "updatedSkipSize" updatedSkipSize
        --
        -- _ = Debug.log "selectedListSegment" selectedListSegment
        _ =
            Debug.log "---------------------" ""
    in
    if List.isEmpty sequenceOfLengths then
        updatedList
    else
        applyKnotHash updatedList updatedCurrentPosition updatedSkipSize (List.drop 1 sequenceOfLengths)


getPuzzleAnswer : String
getPuzzleAnswer =
    let
        initialList =
            List.range 0 255

        currentPosition =
            0

        skipSize =
            0

        sequenceOfLengths =
            List.map (\item -> Result.withDefault 0 <| String.toInt item) <|
                String.split "," getPuzzleInput

        exampleList =
            [ 0, 1, 2, 3, 4 ]

        exampleSequenceOfLengths =
            [ 3, 4, 1, 5 ]

        -- For each length
        -- forEachLength =
        --     List.map
        --         (\selectedLength ->
        --             let
        --                 updatedSelectedLength =
        --                     if selectedLength + currentPosition > List.length initialList then
        --                         [ List.length initialList
        --                         , selectedLength + currentPosition - List.length initialList
        --                         ]
        --                     else
        --                         [selectedLength + currentPosition]
        --
        --                 updateList list selectedLength currentPosition =
        --                     List.append
        --                         (List.drop selectedLength list)
        --                         (List.reverse <|
        --                             List.take selectedLength <|
        --                                 List.drop (currentPosition + 1) list)
        --
        --                 -- reversedSegment =
        --                 --     List.foldl
        --                 --         (\usl r ->
        --                 --             List.reverse <|
        --                 --                 List.take selectedLength <|
        --                 --                     List.drop (currentPosition + 1) r
        --                 --         )
        --                 --         initialList
        --                 --         updatedSelectedLength
        --                 --
        --                 --
        --                 -- remainingSegment =
        --                 --     List.drop selectedLength initialList
        --                 updatedList =
        --                     List.foldl
        --                         (\usl r ->
        --                             updateList r currentPosition usl
        --                         )
        --                         initialList
        --                         updatedSelectedLength
        --
        --                 updatedCurrentPosition =
        --                     selectedLength + skipSize
        --
        --                 updatedSkipSize =
        --                     skipSize + 1
        --
        --             in
        --         )
        --         (List.map String.toInt sequenceOfLengths)
    in
    -- toString <| applyKnotHash initialList 0 0 sequenceOfLengths
    toString <| applyKnotHash exampleList 0 0 exampleSequenceOfLengths


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    ""
