module Common exposing (..)


getIntFromChar : Char -> Int
getIntFromChar =
    String.fromChar >> String.toInt >> Result.withDefault 0


convertToBinary : String -> Int -> String
convertToBinary result integer =
    let
        updatedInteger =
            integer // 2

        remainder =
            rem integer 2

        updatedResult =
            toString remainder ++ result
    in
    if integer == 0 then
        result
    else
        convertToBinary updatedResult updatedInteger
