module Utils.Triplet exposing (..)


type alias Triplet =
    ( Int, Int, Int )


first : Triplet -> Int
first triplet =
    case triplet of
        ( a, b, c ) ->
            a


second : Triplet -> Int
second triplet =
    case triplet of
        ( a, b, c ) ->
            b


third : Triplet -> Int
third triplet =
    case triplet of
        ( a, b, c ) ->
            c


getTripletFromList : List Int -> Maybe Triplet
getTripletFromList list =
    case list of
        a :: b :: c :: _ ->
            Just ( a, b, c )

        _ ->
            Nothing


getAbsoluteMaximum : Triplet -> Int
getAbsoluteMaximum triplet =
    case triplet of
        ( a, b, c ) ->
            max (abs c) <|
                max (abs a) (abs b)
