module Days.Day14 exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (..)
import Common exposing (..)
import Days.Day10b exposing (..)
import Helpers.Ascii exposing (..)


getPuzzleInput : String
getPuzzleInput =
    "flqrgnkx"



-- "hfdlxzhv"


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



-- getFirstAvailableRegionIndex : Int -> Array Char -> Int
-- getFirstAvailableRegionIndex startingIndex binaryArray =
--     if startingIndex > Array.length binaryArray then
--         -1
--     else if (==) '1' <| Maybe.withDefault '0' <| Array.get startingIndex binaryArray then
--         startingIndex
--     else
--         getFirstAvailableRegionIndex (startingIndex + 1) binaryArray
-- isOnPreviousRow : Int -> Array Char -> Bool
-- isOnPreviousRow index binaryArray =
--     (==) '1' <|
--         (Maybe.withDefault '0' <| Array.get (index - 128) binaryArray)
--
--
-- isOnNextRow : Int -> Array Char -> Bool
-- isOnNextRow index binaryArray =
--     (==) '1' <|
--         (Maybe.withDefault '0' <| Array.get (index + 128) binaryArray)
--
--
-- isAdjucentRight : Int -> Array Char -> Bool
-- isAdjucentRight index binaryArray =
--     (==) '1' <|
--         (Maybe.withDefault '0' <| Array.get (index + 1) binaryArray)
--
--
-- isAdjucentLeft : Int -> Array Char -> Bool
-- isAdjucentLeft index binaryArray =
--     (==) '1' <|
--         (Maybe.withDefault '0' <| Array.get (index - 1) binaryArray)
-- getRegionIndexes : Int -> Array Char -> List Int
-- getRegionIndexes index binaryArray =
--     []
--         ++ (if isOnPreviousRow index binaryArray then
--                 [ index - 128 ]
--             else
--                 []
--            )
--         ++ (if isOnNextRow index binaryArray then
--                 [ index + 128 ]
--             else
--                 []
--            )
--         ++ (if isAdjucentRight index binaryArray then
--                 [ index + 1 ]
--             else
--                 []
--            )
--         ++ (if isAdjucentLeft index binaryArray then
--                 [ index + 1 ]
--             else
--                 []
--            )
-- countRegions : List Int -> Array Char -> Int -> Int
-- countRegions indexes binaryArray regionCount =
--     let
--         firstAvailableRegionIndex =
--             getFirstAvailableRegionIndex 0 binaryArray
--
--         tempIndexes =
--             List.concat <|
--                 List.map
--                     (\i ->
--                         getRegionIndexes i binaryArray
--                     )
--                     indexes
--
--         updatedIndexes =
--             if List.isEmpty tempIndexes then
--                 [ firstAvailableRegionIndex ]
--             else
--                 tempIndexes
--
--         updatedBinaryArray =
--             List.foldl
--                 (\i r ->
--                     Array.set i '0' binaryArray
--                 )
--                 binaryArray
--                 indexes
--
--         updatedRegionCount =
--             if List.isEmpty indexes then
--                 regionCount + 1
--             else
--                 regionCount
--     in
--     if firstAvailableRegionIndex == -1 then
--         regionCount
--     else
--         countRegions updatedIndexes updatedBinaryArray updatedRegionCount


countRegionsFromRow row prevIndex regionCount =
    let
        updatedRow =
            List.drop 1 row

        selectedIndex =
            Maybe.withDefault 0 <|
                List.head row

        updatedRegionCount =
            if (prevIndex + 1) == selectedIndex then
                regionCount
            else
                regionCount + 1
    in
    if List.isEmpty row then
        regionCount
    else
        countRegionsFromRow updatedRow selectedIndex updatedRegionCount


getRegionGroup : List Int -> Maybe Int -> List Int -> List Int
getRegionGroup row prevIndex regionGroup =
    let
        updatedRow =
            List.drop 1 row

        ( firstIndex, secondIndex ) =
            case prevIndex of
                Just prev ->
                    ( prev
                    , Maybe.withDefault 0 <| List.head row
                    )

                Nothing ->
                    ( Maybe.withDefault 0 <| List.head row
                    , Maybe.withDefault 0 <| List.head updatedRow
                    )

        ( updatedRegionGroup, shouldTerminate ) =
            if firstIndex + 1 == secondIndex then
                if List.member firstIndex regionGroup then
                    ( List.append regionGroup [ secondIndex ]
                    , False
                    )
                else
                    ( List.append regionGroup [ firstIndex, secondIndex ]
                    , False
                    )
            else
                ( regionGroup
                , True
                )
    in
    if List.isEmpty row || shouldTerminate then
        updatedRegionGroup
    else
        getRegionGroup updatedRow (Just secondIndex) updatedRegionGroup


groupRegionsInRow : Int -> List Int -> List Int -> List (List Int) -> List (List Int)
groupRegionsInRow index row prevRegion groupedRegionsRow =
    let
        updatedRow =
            List.drop (List.length prevRegion) row

        regionGroup =
            getRegionGroup updatedRow Nothing []

        updatedGroupRegionsRow =
            List.append groupedRegionsRow [ regionGroup ]
    in
    if List.isEmpty row || index > 20 then
        groupedRegionsRow
    else
        groupRegionsInRow (index + 1) updatedRow regionGroup updatedGroupRegionsRow



-- countRegions indexes prevRow regionCount =
--     let
--         updatedIndexes =
--             Array.slice 1 (Array.length indexes) indexes
--
--         selectedRow =
--             Maybe.withDefault [] <|
--                 Array.get 0 indexes
--
--         updatedRegionCount =
--
--
--     in
--     if Array.isEmpty indexes then
--         regionCount
--     else
--         countRegions indexes selectedRow updatedRegionCount


getFirstValidIndex : Array Char -> Int -> Int
getFirstValidIndex binaryRow index =
    let
        character =
            Maybe.withDefault ' ' <|
                Array.get index binaryRow

        shouldTerminate =
            character == '1'

        updatedIndex =
            index + 1
    in
    if index > Array.length binaryRow then
        -1
    else if shouldTerminate then
        index
    else
        getFirstValidIndex binaryRow updatedIndex


getRegionIndexes2 : Int -> Int -> Array Char -> List Int -> List Int
getRegionIndexes2 firstValidIndex index binaryRow regionIndexes =
    let
        updatedIndex =
            index + 1

        prevElementIndex =
            firstValidIndex - index

        nextElementIndex =
            firstValidIndex + index

        targetElement =
            -- Maybe.withDefault ' ' <|
            Array.get firstValidIndex binaryRow

        prevElement =
            -- Maybe.withDefault ' ' <|
            Array.get prevElementIndex binaryRow

        nextElement =
            -- Maybe.withDefault ' ' <|
            Array.get nextElementIndex binaryRow

        tempRegionIndexes =
            if List.isEmpty regionIndexes then
                [ firstValidIndex ]
            else
                regionIndexes

        -- _ = Debug.log "prevElement" prevElement
        -- _ = Debug.log "targetElement" targetElement
        -- _ = Debug.log "nextElement" nextElement
        ( updatedRegionIndexes, shouldTerminate ) =
            case ( targetElement, prevElement, nextElement ) of
                ( Just a, Just b, Just c ) ->
                    if a == '1' && b == '1' && c == '1' then
                        ( List.append tempRegionIndexes [ prevElementIndex, nextElementIndex ]
                        , False
                        )
                    else if a == '1' && b == '1' then
                        ( List.append tempRegionIndexes [ prevElementIndex ]
                        , False
                        )
                    else if a == '1' && c == '1' then
                        ( List.append tempRegionIndexes [ nextElementIndex ]
                        , False
                        )
                    else
                        ( tempRegionIndexes
                        , True
                        )

                ( Just a, Just b, _ ) ->
                    if a == '1' && b == '1' then
                        ( List.append tempRegionIndexes [ prevElementIndex ]
                        , False
                        )
                    else
                        ( tempRegionIndexes
                        , True
                        )

                ( Just a, _, Just c ) ->
                    if a == '1' && c == '1' then
                        ( List.append tempRegionIndexes [ nextElementIndex ]
                        , False
                        )
                    else
                        ( tempRegionIndexes
                        , True
                        )

                _ ->
                    ( tempRegionIndexes
                    , True
                    )

        -- ( updatedRegionIndexes, shouldTerminate ) =
        --     if targetElement == '1' && targetElement == nextElement then
        --         ( if List.isEmpty regionIndexes then
        --             [ index, updatedIndex ]
        --           else
        --             List.append regionIndexes [ updatedIndex ]
        --         , False
        --         )
        --     else if firstELement == '1' && List.isEmpty regionIndexes then
        --         ( [ index ]
        --         , True
        --         )
        --     else
        --         ( regionIndexes
        --         , True
        --         )
        _ =
            Debug.log "updatedRegionIndexes" updatedRegionIndexes
    in
    if shouldTerminate || updatedIndex > 10 then
        updatedRegionIndexes
    else
        getRegionIndexes2 firstValidIndex updatedIndex binaryRow updatedRegionIndexes


getConnectedRegionIndexes : List Int -> Int -> Array (Array Char) -> List (List Int) -> List (List Int)
getConnectedRegionIndexes indexes rowIndex binaryGrid regionIndexes =
    let
        targetRow =
            Maybe.withDefault (Array.fromList []) <|
                Array.get rowIndex binaryGrid

        rowRegionIndexes =
            List.foldl
                (\i r ->
                    let
                        targetElement =
                            Maybe.withDefault '0' <|
                                Array.get i targetRow
                    in
                    if targetElement == '1' then
                        List.append r <| getRegionIndexes2 i 1 targetRow []
                    else
                        r
                )
                []
                indexes

        _ =
            Debug.log "rowRegionIndexes" rowRegionIndexes

        updatedRegionIndexes =
            List.append regionIndexes [ rowRegionIndexes ]
    in
    if List.isEmpty rowRegionIndexes || rowIndex > Array.length binaryGrid then
        regionIndexes
    else
        getConnectedRegionIndexes rowRegionIndexes (rowIndex + 1) binaryGrid updatedRegionIndexes


getTotalRegionCount : Array (Array Char) -> String
getTotalRegionCount binaryGrid =
    let
        firstRow =
            Maybe.withDefault (Array.fromList []) <|
                Array.get 0 binaryGrid

        secondRow =
            Maybe.withDefault (Array.fromList []) <|
                Array.get 1 binaryGrid

        firstValidIndex =
            getFirstValidIndex firstRow 0

        regionIndexes =
            getRegionIndexes2 firstValidIndex 1 firstRow []

        connectedRegionIndexes =
            -- getRegionIndexes2 1 1 secondRow []
            getConnectedRegionIndexes regionIndexes 1 binaryGrid []

        -- regionIndexes2 =
        --     List.append [ 4 ] <|
        --         getRegionIndexes2 4 firstRow []
        -- _ = Debug.log "firstValidIndex 0" <| getFirstValidIndex firstRow 0
        -- _ = Debug.log "firstValidIndex 1" <| getFirstValidIndex (Array.fromList [ '0', '0', '0', '0', '0', '0' ]) 0
        -- _ = Debug.log "firstValidIndex 2" <| getFirstValidIndex (Array.fromList [ '0', '0', '0', '0', '1', '0' ]) 0
        -- _ = Debug.log "firstValidIndex 3" <| getFirstValidIndex (Array.fromList [ '0', '0', '1', '0', '0', '0' ]) 2
        -- _ = Debug.log "firstValidIndex 4" <| getFirstValidIndex (Array.fromList [ '0', '0', '1', '0', '0', '0' ]) 3
        _ =
            Debug.log "regionIndexes" regionIndexes

        _ =
            Debug.log "connectedRegionIndexes" connectedRegionIndexes

        -- _ = Debug.log "regionIndexes2" regionIndexes2
    in
    ""


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
        --     -- Array.map (Array.fromList << String.toList) <|
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
        -- _ =
        --     Debug.log "gridRowsBinary" gridRowsBinary
        _ =
            0

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
        -- _ =
        --     Debug.log "binaryArray" binaryArray
        --
        -- totalRegions =
        --     countRegions [] binaryArray 0
        -- _ = Debug.log "binaryArray" binaryArray
        -- _ = Debug.log "totalRegions" totalRegions
        -- _ =
        --     -- Debug.log "Just a message from Day 14b" ""
        --     Debug.log "gridRowsBinary" gridRowsBinary
        -- indexes =
        --     Array.map
        --         (\row ->
        --             String.indexes "1" row
        --         )
        --         gridRowsBinary
        --
        -- _ =
        --     Debug.log "indexes" indexes
        --
        -- firstRow =
        --     Maybe.withDefault [] <|
        --         Array.get 0 indexes
        --
        -- getRegionGroupsInRow row prevRegionGroup regionGroupsRow =
        --     let
        --         updatedRow =
        --             List.drop (List.length prevRegionGroup) row
        --
        --         newRegionGroup =
        --             getRegionGroup row Nothing []
        --
        --         updatedRegionGroupsRow =
        --             List.append regionGroupsRow [ newRegionGroup ]
        --     in
        --     if List.isEmpty row then
        --         regionGroupsRow
        --     else
        --         getRegionGroupsInRow updatedRow newRegionGroup updatedRegionGroupsRow
        --
        -- _ =
        --     Debug.log "regionCount from first row" <| (+) 1 <| countRegionsFromRow firstRow 0 0
        -- regionGroups =
        --     getRegionGroup firstRow Nothing []
        -- getRegionGroupsInRow firstRow [] []
        -- groupRegionsInRow 0 firstRow [] []
        -- List.foldl
        --     (\row r ->
        --         List.foldl
        --             (\index rr ->
        --
        --             )
        --             []
        --             row
        --         List.append r <| getRegionGroup row Nothing []
        --     )
        --     []
        --     firstRow
        -- 0
    in
    -- "I think logic is there but needs perfomance improvements"
    toString "totalRegions"



{--
 [0,1]
 [4,5,6,7,8]
 [10]
 13,
 15,16,17,
 20,
 25,26,27,28,
 30,
 33,
 35,
 38,39,40,
 42,43,44,
 46,47,48,
 51,
 53,
 55,56,57,58,
 60,
 62,63,64,65,66,67,68,69,70,
 73,74,
 83,
 87,
 90,91,92,
 96,
 98,99,100,
 103,104,105,106,107,108,
 110,
 113,
 116,
 119,
 120,
 123,
 125,
 127]
--}
{--
[1,
4,
7,8,9,10,11,
13,
15,
18,19,
22,23,
26,27,28,
31,32,33,34,
37,38,39,
42,
45,
47,48,
53,54,55,
57,
60,
66,67,
69,70,71,
73,74,
81,
84,85,86,87,88,
96,
98,99,100,101,
107,108,
110,
115,
117,118,119,
123,124,
126]
--}
