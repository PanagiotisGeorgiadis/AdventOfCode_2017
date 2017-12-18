module Common exposing (convertDecimalToHex, convertHexToBinary, convertToBinary, getIntFromChar)

import Dict exposing (..)


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
        getBinaryString result
    else
        convertToBinary updatedResult updatedInteger


convertDecimalToHex : String -> Int -> String
convertDecimalToHex result integer =
    let
        updatedInteger =
            integer // 16

        remainder =
            rem integer 16

        updatedResult =
            if remainder == 0 then
                result
            else if String.isEmpty result then
                toString remainder
            else
                toString remainder ++ "," ++ result
    in
    if integer == 0 then
        let
            hex =
                String.join "" <|
                    List.map
                        (transformHexIntToHexString << Result.withDefault -1 << String.toInt)
                        (if String.isEmpty updatedResult then
                            [ "0" ]
                         else
                            String.split "," updatedResult
                        )
        in
        if integer < 16 then
            String.padRight 2 '0' hex
        else
            String.padLeft 2 '0' hex
    else
        convertDecimalToHex updatedResult updatedInteger


convertHexToBinary : Char -> String
convertHexToBinary hex =
    Maybe.withDefault "####" <|
        Dict.get hex <|
            Dict.fromList
                [ ( '0', "0000" )
                , ( '1', "0001" )
                , ( '2', "0010" )
                , ( '3', "0011" )
                , ( '4', "0100" )
                , ( '5', "0101" )
                , ( '6', "0110" )
                , ( '7', "0111" )
                , ( '8', "1000" )
                , ( '9', "1001" )
                , ( 'a', "1010" )
                , ( 'b', "1011" )
                , ( 'c', "1100" )
                , ( 'd', "1101" )
                , ( 'e', "1110" )
                , ( 'f', "1111" )
                ]



{--Private functions --}


getBinaryString : String -> String
getBinaryString result =
    if String.length result <= 4 then
        String.padLeft 4 '0' result
    else if String.length result <= 8 then
        String.padLeft 8 '0' result
    else if String.length result <= 12 then
        String.padLeft 12 '0' result
    else if String.length result <= 16 then
        String.padLeft 16 '0' result
    else if String.length result <= 20 then
        String.padLeft 20 '0' result
    else if String.length result <= 24 then
        String.padLeft 24 '0' result
    else if String.length result <= 28 then
        String.padLeft 28 '0' result
    else if String.length result <= 32 then
        String.padLeft 32 '0' result
    else if String.length result <= 36 then
        String.padLeft 36 '0' result
    else
        result


transformHexIntToHexString : Int -> String
transformHexIntToHexString integer =
    if integer == 15 then
        "f"
    else if integer == 14 then
        "e"
    else if integer == 13 then
        "d"
    else if integer == 12 then
        "c"
    else if integer == 11 then
        "b"
    else if integer == 10 then
        "a"
    else
        toString integer
