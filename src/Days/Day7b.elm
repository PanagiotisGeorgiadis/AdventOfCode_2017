module Days.Day7b exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (Array)
import Char exposing (isDigit)
import Days.Day7 exposing (getPuzzleInput)


type alias Program =
    { name : String
    , weight : Int
    , discContents : List String
    }


initialProgram : Program
initialProgram =
    Program "" 0 []


initialProgramWithMaxWeight : Program
initialProgramWithMaxWeight =
    Program "" 1000000000 []


getNameAndWeightFromString : String -> ( String, Int )
getNameAndWeightFromString inputLine =
    let
        items =
            String.split " " inputLine
    in
    case items of
        [ a, b ] ->
            let
                weight =
                    Result.withDefault 0 <|
                        String.toInt <|
                            String.filter isDigit b
            in
            ( a, weight )

        _ ->
            ( "", 0 )


transformRowToBlock : String -> Program
transformRowToBlock row =
    let
        rowCompartments =
            Array.fromList <|
                String.split " -> " row

        ( name, weight ) =
            getNameAndWeightFromString <|
                Maybe.withDefault "" <|
                    Array.get 0 rowCompartments

        discContents =
            if Array.length rowCompartments > 1 then
                String.split ", " <|
                    Maybe.withDefault "" <|
                        Array.get 1 rowCompartments
            else
                []
    in
    Program name weight discContents


getProgramByName : List Program -> String -> Program
getProgramByName programs name =
    List.foldl
        (\p r ->
            if p.name == name then
                p
            else
                r
        )
        initialProgram
        programs


getBottomProgram : List Program -> List Program
getBottomProgram programsWithDiscs =
    List.filter
        (\p ->
            List.foldl
                (\pp r ->
                    if r then
                        List.foldl
                            (\disc rr ->
                                if p.name == disc || not rr then
                                    False
                                else
                                    True
                            )
                            True
                            pp.discContents
                    else
                        r
                )
                True
                programsWithDiscs
        )
        programsWithDiscs


getPuzzleAnswer : String
getPuzzleAnswer =
    let
        puzzleRows =
            List.map String.trim <|
                String.lines getPuzzleInput

        programs =
            List.map transformRowToBlock puzzleRows

        programsWithDiscs =
            List.filter
                (\p ->
                    if List.isEmpty p.discContents then
                        False
                    else
                        True
                )
                programs

        bottomProgram =
            Maybe.withDefault initialProgram <|
                List.head <|
                    getBottomProgram programsWithDiscs
    in
    "From Scratch: " ++ toString bottomProgram


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    let
        puzzleRows =
            List.map String.trim <|
                String.lines getPuzzleInput

        programs =
            List.map transformRowToBlock puzzleRows

        svugoProgram =
            getProgramByName programs "svugo"

        xolvnpyProgram =
            getProgramByName programs "xolvnpy"

        gjxqxProgram =
            getProgramByName programs "gjxqx"

        gtzxxavProgram =
            getProgramByName programs "gtzxxav"

        njorjqProgram =
            getProgramByName programs "njorjq"

        qpiklvfProgram =
            getProgramByName programs "qpiklvf"

        getDiscWeight program =
            let
                subPrograms =
                    List.map (getProgramByName programs) program.discContents
            in
            program.weight
                + List.foldl
                    (\sub r ->
                        r + sub.weight
                    )
                    0
                    subPrograms

        _ =
            Debug.log "svugo Weight" <| getDiscWeight svugoProgram

        _ =
            Debug.log "xolvnpy Weight" <| getDiscWeight xolvnpyProgram

        _ =
            Debug.log "gjxqx Weight" <| getDiscWeight gjxqxProgram

        _ =
            Debug.log "gtzxxav Weight" <| getDiscWeight gtzxxavProgram

        _ =
            Debug.log "njorjq Weight" <| getDiscWeight njorjqProgram

        _ =
            Debug.log "qpiklvf Weight" <| getDiscWeight qpiklvfProgram
    in
    "From Scratch"
