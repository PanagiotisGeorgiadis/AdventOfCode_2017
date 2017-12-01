module Common exposing (..)


getIntFromChar : Char -> Int
getIntFromChar =
    String.fromChar >> String.toInt >> Result.withDefault 0
