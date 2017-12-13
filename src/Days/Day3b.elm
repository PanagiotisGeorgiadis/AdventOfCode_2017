module Days.Day3b exposing (getPuzzleAnswer, getPuzzleAnswer2)


getPuzzleInput : Int
getPuzzleInput =
    277678


type alias Coordinates =
    ( Int, Int )


type alias SpiralElement =
    { coordinates : Coordinates
    , value : Int
    }


type Direction
    = North
    | East
    | West
    | South
    | NorthEast
    | NorthWest
    | SouthEast
    | SouthWest


getAllDirectionsList : List Direction
getAllDirectionsList =
    [ North, East, West, South, NorthEast, NorthWest, SouthEast, SouthWest ]


calculateManhattanDistance : Coordinates -> Coordinates -> Int
calculateManhattanDistance p q =
    abs <|
        (Tuple.first p - (abs <| Tuple.first q))
            + (Tuple.second p - (abs <| Tuple.second q))


initialSpiralElement : SpiralElement
initialSpiralElement =
    SpiralElement ( 0, 0 ) 0


getElementValueFromCoordinates : List SpiralElement -> Coordinates -> Int
getElementValueFromCoordinates spiralList targetCoords =
    let
        selectedElement =
            Maybe.withDefault initialSpiralElement <|
                List.head <|
                    spiralList

        updatedSpiralList =
            List.drop 1 spiralList

        ( selectedX, selectedY ) =
            selectedElement.coordinates

        ( targetX, targetY ) =
            targetCoords
    in
    if selectedX == targetX && selectedY == targetY then
        selectedElement.value
    else if List.isEmpty spiralList then
        0
    else
        getElementValueFromCoordinates updatedSpiralList targetCoords


getElementValueFromDirection : List SpiralElement -> Direction -> Coordinates -> Int
getElementValueFromDirection spiralList direction coordinates =
    let
        ( x, y ) =
            coordinates

        maxValue =
            max (abs x) (abs y)

        minValue =
            negate maxValue

        targetCoordinates =
            case direction of
                North ->
                    if x == minValue && y /= maxValue || y == minValue then
                        Just ( x, y + 1 )
                    else
                        Nothing

                East ->
                    if x == minValue && y /= minValue || y == maxValue && x /= maxValue then
                        Just ( x + 1, y )
                    else
                        Nothing

                West ->
                    if x == maxValue && y /= maxValue || y == minValue && x /= minValue then
                        Just ( x - 1, y )
                    else
                        Nothing

                South ->
                    if x == maxValue && y /= minValue || y == maxValue && x /= minValue then
                        Just ( x, y - 1 )
                    else
                        Nothing

                NorthEast ->
                    if x == minValue && y /= maxValue || y == minValue && x < maxValue then
                        Just ( x + 1, y + 1 )
                    else
                        Nothing

                NorthWest ->
                    if x == maxValue && y /= minValue || y == minValue && x /= minValue then
                        Just ( x - 1, y + 1 )
                    else
                        Nothing

                SouthWest ->
                    if x == maxValue && y > (minValue + 1) || y == maxValue && x > (minValue + 1) then
                        Just ( x - 1, y - 1 )
                    else
                        Nothing

                SouthEast ->
                    if x == minValue && y > (minValue + 1) || y == maxValue && x /= maxValue then
                        Just ( x + 1, y - 1 )
                    else
                        Nothing
    in
    case targetCoordinates of
        Just c ->
            getElementValueFromCoordinates spiralList c

        Nothing ->
            0


getNextCoordinates : Coordinates -> Coordinates
getNextCoordinates prevCoords =
    let
        x =
            Tuple.first prevCoords

        y =
            Tuple.second prevCoords

        maxValue =
            max (abs x) (abs y)

        minValue =
            negate maxValue
    in
    if x == maxValue && y == minValue then
        ( maxValue + 1, minValue )
    else if x == maxValue && y == maxValue then
        ( x - 1, y )
    else if x == minValue && y == maxValue then
        ( x, y - 1 )
    else if x == minValue && y == minValue then
        ( x + 1, y )
    else if x == maxValue then
        ( x, y + 1 )
    else if x == minValue then
        ( x, y - 1 )
    else if y == maxValue then
        ( x - 1, y )
    else if y == minValue then
        ( x + 1, y )
    else
        prevCoords


populateSpiralList : Int -> Coordinates -> List SpiralElement -> List SpiralElement
populateSpiralList index previousCoords spiralList =
    let
        updatedIndex =
            index + 1

        updatedCoords =
            getNextCoordinates previousCoords

        newSpiralElement =
            SpiralElement updatedCoords updatedIndex

        updatedSpiralArray =
            List.append spiralList [ newSpiralElement ]
    in
    if List.length updatedSpiralArray >= getPuzzleInput then
        updatedSpiralArray
    else
        populateSpiralList updatedIndex updatedCoords updatedSpiralArray


populateSpiralAdditionList : Coordinates -> List SpiralElement -> List SpiralElement
populateSpiralAdditionList previousCoords spiralAdditionList =
    let
        elementCoords =
            getNextCoordinates previousCoords

        elementValue =
            List.foldl
                (\direction r ->
                    r + getElementValueFromDirection spiralAdditionList direction elementCoords
                )
                0
                getAllDirectionsList

        updatedSpiralAdditionList =
            List.append spiralAdditionList [ { value = elementValue, coordinates = elementCoords } ]
    in
    if elementValue > getPuzzleInput then
        updatedSpiralAdditionList
    else
        populateSpiralAdditionList elementCoords updatedSpiralAdditionList



-- getPuzzleAnswer : String
-- getPuzzleAnswer =
--     let
--         spiralList =
--             populateSpiralList 0 ( 0, 0 ) [ initialSpiralElement ]
--     in
--     "Manhattan Distance "
--         ++ (toString <|
--                 calculateManhattanDistance ( 0, 0 ) <|
--                     .coordinates <|
--                         Maybe.withDefault initialSpiralElement <|
--                             List.head <|
--                                 List.reverse spiralList
--            )
--
--
-- getPuzzleAnswer2 : String
-- getPuzzleAnswer2 =
--     let
--         spiralAdditionList =
--             populateSpiralAdditionList ( 0, 0 ) [ { initialSpiralElement | value = 1 } ]
--     in
--     toString <|
--         .value <|
--             Maybe.withDefault initialSpiralElement <|
--                 List.head <|
--                     List.reverse spiralAdditionList


getPuzzleAnswer : String
getPuzzleAnswer =
    "475"


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    "279138"
