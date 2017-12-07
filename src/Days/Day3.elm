module Days.Day3 exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (Array)
import Utils.Triplet as Triplet


type alias Coordinates =
    ( Int, Int )


puzzleInput : Int
puzzleInput =
    277678


roundPuzzleInputToTheNearestDivisor : Int -> Int -> Int
roundPuzzleInputToTheNearestDivisor weight divisor =
    if (puzzleInput + weight) % divisor == 0 then
        puzzleInput + weight
    else
        roundPuzzleInputToTheNearestDivisor (weight + 1) divisor


calculateManhatanDistance : Coordinates -> Coordinates -> Int
calculateManhatanDistance p q =
    abs <|
        (Tuple.first p - (abs <| Tuple.first q))
            + (Tuple.second p - (abs <| Tuple.second q))


incrementCoordinateRange : Coordinates -> Coordinates
incrementCoordinateRange coordinates =
    ( negate <| (abs <| Tuple.first coordinates) + 1, Tuple.second coordinates + 1 )


calculatePreviousCoordinateElements : Coordinates -> Coordinates -> Int
calculatePreviousCoordinateElements x y =
    let
        xMin =
            abs (Tuple.first x) - 1

        xMax =
            abs (Tuple.second x) - 1

        yMin =
            abs (Tuple.first y) - 1

        yMax =
            abs (Tuple.second y) - 1
    in
    (abs xMin + abs xMax + 1) * (abs yMin + abs yMax + 1)


getCoordinateRangeElementsCount : Int -> Int -> Int -> Int -> Int
getCoordinateRangeElementsCount xMin xMax yMin yMax =
    if xMin == 0 && xMax == 0 && yMin == 0 && yMax == 0 then
        1
    else
        ((abs xMin + abs xMax + 1) * (abs yMin + abs yMax + 1))
            - calculatePreviousCoordinateElements ( xMin, xMax ) ( yMin, yMax )


getCoordinateRangeFromIndex : Int -> Int -> Coordinates -> Coordinates
getCoordinateRangeFromIndex targetIndex prevRangeElementsCount prevCoordinatesRange =
    let
        xMax =
            Tuple.first prevCoordinatesRange

        xMin =
            Tuple.second prevCoordinatesRange

        yMax =
            Tuple.first prevCoordinatesRange

        yMin =
            Tuple.second prevCoordinatesRange

        coordinateRangeElementsCount =
            getCoordinateRangeElementsCount xMax xMin yMax yMin
    in
    if targetIndex - (prevRangeElementsCount + coordinateRangeElementsCount) < 0 then
        prevCoordinatesRange
    else
        getCoordinateRangeFromIndex targetIndex (prevRangeElementsCount + coordinateRangeElementsCount) (incrementCoordinateRange prevCoordinatesRange)


getCoordinatesFromIndex : Int -> Int -> Coordinates
getCoordinatesFromIndex targetIndex previousIndex =
    let
        coordinateRange =
            getCoordinateRangeFromIndex (targetIndex - 1) 0 ( 0, 0 )

        previousCoordinateRange =
            getCoordinateRangeFromIndex previousIndex 0 ( 0, 0 )

        minValue =
            Tuple.first coordinateRange

        maxValue =
            Tuple.second coordinateRange

        prevMinValue =
            Tuple.first previousCoordinateRange

        prevMaxValue =
            Tuple.second previousCoordinateRange
    in
    if minValue == prevMinValue && maxValue == prevMaxValue then
        List.foldl
            (\index r ->
                let
                    xValue =
                        Tuple.first r

                    yValue =
                        Tuple.second r
                in
                if xValue == maxValue && yValue == maxValue then
                    ( xValue - 1, yValue )
                else if xValue == maxValue && yValue == minValue then
                    ( xValue, yValue + 1 )
                else if xValue == minValue && yValue == maxValue then
                    ( xValue, yValue - 1 )
                else if xValue == minValue && yValue == minValue then
                    ( xValue + 1, yValue )
                else if xValue == maxValue then
                    ( xValue, yValue + 1 )
                else if xValue == minValue then
                    ( xValue, yValue - 1 )
                else if yValue == maxValue then
                    ( xValue - 1, yValue )
                else if yValue == minValue then
                    ( xValue + 1, yValue )
                else
                    r
            )
            ( maxValue, negate <| abs minValue )
            (List.range previousIndex (targetIndex - 1))
    else
        getCoordinatesFromIndex targetIndex (previousIndex + 1)



-- getPuzzleAnswer : String
-- getPuzzleAnswer =
--     let
--         nearestDivisor =
--             roundPuzzleInputToTheNearestDivisor 0 8
--
--         maxCoordinatesRange =
--             getCoordinateRangeFromIndex nearestDivisor 0 ( 0, 0 )
--     in
--     toString <|
--         calculateManhatanDistance ( 0, 0 ) <|
--             getCoordinatesFromIndex puzzleInput 0


getPuzzleAnswer : String
getPuzzleAnswer =
    "Commented out the result and changed the annotation because it takes time to execute..."



---------------------------------------------------------------------------------------------


type Direction
    = North
    | South
    | West
    | East
    | NorthWest
    | NorthEast
    | SouthWest
    | SouthEast


getElementValueFromCoords : Array ( Int, Int, Int ) -> Coordinates -> Int
getElementValueFromCoords spiralArray targetCoords =
    let
        targetX =
            Tuple.first targetCoords

        targetY =
            Tuple.second targetCoords
    in
    Array.foldl
        (\item r ->
            if targetX == Triplet.first item && targetY == Triplet.second item then
                Triplet.third item
            else
                r
        )
        0
        spiralArray


getElementValueFromDirection : Direction -> Coordinates -> Array ( Int, Int, Int ) -> Int
getElementValueFromDirection direction sourceCoords spiralArray =
    case direction of
        North ->
            getElementValueFromCoords spiralArray ( Tuple.first sourceCoords + 1, Tuple.second sourceCoords )

        South ->
            getElementValueFromCoords spiralArray ( Tuple.first sourceCoords - 1, Tuple.second sourceCoords )

        West ->
            getElementValueFromCoords spiralArray ( Tuple.first sourceCoords, Tuple.second sourceCoords - 1 )

        East ->
            getElementValueFromCoords spiralArray ( Tuple.first sourceCoords, Tuple.second sourceCoords + 1 )

        NorthWest ->
            getElementValueFromCoords spiralArray ( Tuple.first sourceCoords + 1, Tuple.second sourceCoords - 1 )

        NorthEast ->
            getElementValueFromCoords spiralArray ( Tuple.first sourceCoords + 1, Tuple.second sourceCoords + 1 )

        SouthWest ->
            getElementValueFromCoords spiralArray ( Tuple.first sourceCoords - 1, Tuple.second sourceCoords - 1 )

        SouthEast ->
            getElementValueFromCoords spiralArray ( Tuple.first sourceCoords - 1, Tuple.second sourceCoords + 1 )


getNewElementValue : Coordinates -> Array ( Int, Int, Int ) -> Int
getNewElementValue coords spiralArray =
    getElementValueFromDirection North coords spiralArray
        + getElementValueFromDirection South coords spiralArray
        + getElementValueFromDirection West coords spiralArray
        + getElementValueFromDirection East coords spiralArray
        + getElementValueFromDirection NorthWest coords spiralArray
        + getElementValueFromDirection NorthEast coords spiralArray
        + getElementValueFromDirection SouthWest coords spiralArray
        + getElementValueFromDirection SouthEast coords spiralArray


createSpiralAdditionArray : Int -> Coordinates -> Array ( Int, Int, Int ) -> Array ( Int, Int, Int )
createSpiralAdditionArray maxValue ( maxCoord, minCoord ) spiralArray =
    let
        lastItem =
            Maybe.withDefault ( 0, 0, 0 ) <|
                Array.get ((-) 1 <| Array.length spiralArray) spiralArray

        xValue =
            Triplet.first lastItem

        yValue =
            Triplet.second lastItem

        newMaxCoords =
            if xValue == maxCoord && yValue == minCoord then
                ( maxCoord + 1, minCoord - 1 )
            else
                ( maxCoord, minCoord )

        newItemCoords =
            if xValue == maxCoord && yValue == maxCoord then
                ( xValue - 1, yValue )
            else if xValue == maxCoord && yValue == minCoord then
                ( xValue, yValue + 1 )
            else if xValue == minCoord && yValue == maxCoord then
                ( xValue, yValue - 1 )
            else if xValue == minCoord && yValue == minCoord then
                ( xValue + 1, yValue )
            else if xValue == maxCoord then
                ( xValue, yValue + 1 )
            else if xValue == minCoord then
                ( xValue, yValue - 1 )
            else if yValue == maxCoord then
                ( xValue - 1, yValue )
            else if yValue == minCoord then
                ( xValue + 1, yValue )
            else
                ( xValue, yValue )

        newItemValue =
            getNewElementValue newItemCoords spiralArray

        updatedSpiralArray =
            Array.push ( Tuple.first newItemCoords, Tuple.second newItemCoords, newItemValue ) spiralArray
    in
    -- if newItemValue > 10 then
    updatedSpiralArray



-- else
-- createSpiralAdditionArray maxValue newMaxCoords updatedSpiralArray


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    let
        spiralAdditionList =
            createSpiralAdditionArray 25 ( 0, 0 ) <|
                Array.initialize 1 (\_ -> ( 0, 0, 1 ))
    in
    -- "Answer2"
    toString spiralAdditionList



{--
||   17 (-2, 2) ||   16 (-1, 2) ||   15 (0, 2) ||    14 (1, 2) ||    13 (2, 2) ||
||   18 (-2, 1) ||   5  (-1, 1) ||   4  (0, 1) ||    3  (1, 1) ||    12 (2, 1) ||
||   19 (-2, 0) ||   6  (-1, 0) ||   1  (0, 0) ||    2  (1, 0) ||    11 (2, 0) ||
||   20 (-2,-1) ||   7  (-1,-1) ||   8  (0,-1) ||    9  (1,-1) ||    10 (2,-1) ||
||   21 (-2,-2) ||   22 (-1,-2) ||   23 (0,-2) ||    24 (1,-2) ||    25 (2,-2) ||   26 (3, -2)
--}
