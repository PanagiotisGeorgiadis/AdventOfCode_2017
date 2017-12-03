module Days.Day3 exposing (getPuzzleAnswer, getPuzzleAnswer2)


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


getPuzzleAnswer : String
getPuzzleAnswer =
    let
        nearestDivisor =
            roundPuzzleInputToTheNearestDivisor 0 8

        maxCoordinatesRange =
            getCoordinateRangeFromIndex nearestDivisor 0 ( 0, 0 )
    in
    -- calculateManhatanDistance ( 0, 0 ) <|
    -- getCoordinatesFromIndex puzzleInput 0
    "Commented out the result and changed the annotation because it takes time to execute..."


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    "Answer2"
