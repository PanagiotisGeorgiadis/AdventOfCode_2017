module Utils.Triplet exposing (first, second, third)


first : ( Int, Int, Int ) -> Int
first triplet =
    case triplet of
        ( a, b, c ) ->
            a


second : ( Int, Int, Int ) -> Int
second triplet =
    case triplet of
        ( a, b, c ) ->
            b


third : ( Int, Int, Int ) -> Int
third triplet =
    case triplet of
        ( a, b, c ) ->
            c
