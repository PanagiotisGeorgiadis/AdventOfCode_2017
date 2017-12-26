module Days.Day21 exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (..)


getPuzzleInput : String
getPuzzleInput =
    """
    ../.. => .##/.##/###
    #./.. => .../#.#/###
    ##/.. => .##/.../.#.
    .#/#. => ###/.#./##.
    ##/#. => .#./#../#.#
    ##/## => .##/#.#/###
    .../.../... => ####/.##./####/.#..
    #../.../... => ..../..##/#.../.##.
    .#./.../... => #.#./##.#/#.../#.#.
    ##./.../... => .#../.##./#.../....
    #.#/.../... => ###./..##/..##/##.#
    ###/.../... => .###/#.##/..../....
    .#./#../... => ##.#/#..#/.##./...#
    ##./#../... => ..../#..#/#.#./...#
    ..#/#../... => #.##/.#../.#.#/###.
    #.#/#../... => ##../.#.#/...#/...#
    .##/#../... => ##.#/.##./..#./##.#
    ###/#../... => ...#/####/..#./#...
    .../.#./... => ##.#/#.#./..##/.##.
    #../.#./... => .#.#/#.##/.##./....
    .#./.#./... => #..#/#.../.##./....
    ##./.#./... => ###./###./..##/#..#
    #.#/.#./... => .###/...#/###./###.
    ###/.#./... => ...#/..##/..#./#.##
    .#./##./... => .##./.#../...#/..#.
    ##./##./... => .###/..#./.###/###.
    ..#/##./... => .#.#/..#./..#./...#
    #.#/##./... => .#.#/##../#.../.##.
    .##/##./... => .##./...#/#.##/###.
    ###/##./... => ...#/###./####/#.##
    .../#.#/... => #.#./#.../#.#./..#.
    #../#.#/... => ###./##../..#./.#..
    .#./#.#/... => #.../..##/#..#/#.#.
    ##./#.#/... => #.#./.##./#..#/##.#
    #.#/#.#/... => #.##/.#.#/#..#/.#.#
    ###/#.#/... => #.../##.#/###./....
    .../###/... => ..##/...#/##.#/###.
    #../###/... => .#.#/...#/#.##/.#..
    .#./###/... => ####/#.../..#./.#.#
    ##./###/... => ..../####/#.##/#..#
    #.#/###/... => ####/..#./####/.#.#
    ###/###/... => ..##/..../...#/.#..
    ..#/.../#.. => .###/..##/.#.#/.##.
    #.#/.../#.. => #.##/#..#/.#.#/##.#
    .##/.../#.. => #.##/####/.#.#/..#.
    ###/.../#.. => ##../##.#/..../##..
    .##/#../#.. => ...#/####/..##/.##.
    ###/#../#.. => ..#./...#/#.../##.#
    ..#/.#./#.. => #..#/##.#/..##/#..#
    #.#/.#./#.. => ..../.###/#..#/..##
    .##/.#./#.. => ..#./...#/..##/...#
    ###/.#./#.. => ...#/..../##.#/....
    .##/##./#.. => .#../..##/...#/.#.#
    ###/##./#.. => .###/#.#./####/#.#.
    #../..#/#.. => .###/##.#/##../##..
    .#./..#/#.. => ##../.#../###./##.#
    ##./..#/#.. => #..#/####/####/..##
    #.#/..#/#.. => ..##/..../###./..##
    .##/..#/#.. => ..##/.#.#/.#../.#..
    ###/..#/#.. => ...#/.###/.###/.#.#
    #../#.#/#.. => ##../##../##.#/.##.
    .#./#.#/#.. => ...#/.##./.#.#/#...
    ##./#.#/#.. => .##./.#../.#../#...
    ..#/#.#/#.. => ..##/##.#/####/###.
    #.#/#.#/#.. => ..../.###/#.../#..#
    .##/#.#/#.. => ..#./#.#./.#../...#
    ###/#.#/#.. => ##.#/#.../##.#/.##.
    #../.##/#.. => ..../#.../..#./####
    .#./.##/#.. => #..#/.#../#.#./..##
    ##./.##/#.. => .###/..##/###./....
    #.#/.##/#.. => .###/.##./.###/#.##
    .##/.##/#.. => #.##/###./.##./...#
    ###/.##/#.. => ...#/#.##/.##./#.#.
    #../###/#.. => #..#/.###/.###/#.#.
    .#./###/#.. => ..#./#.#./..../...#
    ##./###/#.. => ..##/##../#..#/....
    ..#/###/#.. => ..##/.#../.#../###.
    #.#/###/#.. => ..#./.###/..../...#
    .##/###/#.. => .##./###./#.../#.##
    ###/###/#.. => ##.#/..../.##./##.#
    .#./#.#/.#. => .##./.#.#/####/....
    ##./#.#/.#. => ##.#/#.##/####/.#..
    #.#/#.#/.#. => ####/.##./##.#/...#
    ###/#.#/.#. => #..#/#.##/.##./###.
    .#./###/.#. => .#../..../.##./##.#
    ##./###/.#. => ##.#/.#../#.../.###
    #.#/###/.#. => ###./###./.#../###.
    ###/###/.#. => #..#/#.../#..#/.#.#
    #.#/..#/##. => #..#/#.../##../###.
    ###/..#/##. => #.../.#../.###/#...
    .##/#.#/##. => .#.#/.##./.#../##.#
    ###/#.#/##. => #.../..../##../.###
    #.#/.##/##. => .#.#/##../.###/#.#.
    ###/.##/##. => ###./..#./##.#/.###
    .##/###/##. => ..#./.#.#/##.#/#.#.
    ###/###/##. => ##../.#.#/#..#/.#.#
    #.#/.../#.# => ##../###./..#./##.#
    ###/.../#.# => .#../##../..#./##.#
    ###/#../#.# => ###./#..#/####/....
    #.#/.#./#.# => .###/..../.###/##.#
    ###/.#./#.# => ###./.###/..##/.#.#
    ###/##./#.# => ..#./..##/#..#/#.##
    #.#/#.#/#.# => .#.#/.#../.#.#/#.##
    ###/#.#/#.# => .###/#.../##../.###
    #.#/###/#.# => .#../...#/..../...#
    ###/###/#.# => #..#/##.#/..#./#...
    ###/#.#/### => .###/.#.#/..#./####
    ###/###/### => ##.#/..##/.#../..##
"""


type PixelState
    = On
    | Off


type alias EnhancementRule =
    { input : Array (Array PixelState)
    , output : Array (Array PixelState)
    }


nonValidEnhancementRule : EnhancementRule
nonValidEnhancementRule =
    { input = Array.empty
    , output = Array.empty
    }


getPixelStateFromChar : Char -> PixelState
getPixelStateFromChar char =
    case char of
        '.' ->
            Off

        '#' ->
            On

        _ ->
            Debug.crash "Unexpected Character"


rotateTwoByTwoRule : Array (Array PixelState) -> Array (Array PixelState)
rotateTwoByTwoRule input =
    let
        ( firstRow, secondRow ) =
            ( Maybe.withDefault Array.empty <|
                Array.get 0 input
            , Maybe.withDefault Array.empty <|
                Array.get 1 input
            )
    in
    Array.fromList <|
        List.map2
            (\first second ->
                Array.fromList [ second, first ]
            )
            (Array.toList firstRow)
            (Array.toList secondRow)


rotateThreeByThreeRule : Array (Array PixelState) -> Array (Array PixelState)
rotateThreeByThreeRule input =
    let
        ( firstRow, secondRow, thirdRow ) =
            ( Maybe.withDefault Array.empty <|
                Array.get 0 input
            , Maybe.withDefault Array.empty <|
                Array.get 1 input
            , Maybe.withDefault Array.empty <|
                Array.get 2 input
            )
    in
    Array.fromList <|
        List.map3
            (\first second third ->
                Array.fromList [ third, second, first ]
            )
            (Array.toList firstRow)
            (Array.toList secondRow)
            (Array.toList thirdRow)


completeEnhancementBook : EnhancementRule -> List EnhancementRule
completeEnhancementBook { input, output } =
    let
        flippedInput =
            Array.map
                (Array.fromList << List.reverse << Array.toList)
                input

        rotatedInput =
            if Array.length input == 2 then
                rotateTwoByTwoRule input
            else if Array.length input == 3 then
                rotateThreeByThreeRule input
            else
                Array.empty

        reversedInput =
            Array.fromList <|
                List.reverse <|
                    Array.toList input
    in
    [ EnhancementRule input output
    , EnhancementRule flippedInput output
    , EnhancementRule rotatedInput output
    , EnhancementRule reversedInput output
    ]


transformEnhancementSegment : List String -> Array (Array PixelState)
transformEnhancementSegment seg =
    Array.fromList <|
        List.map
            (\row ->
                String.foldl
                    (\c r ->
                        Array.push (getPixelStateFromChar c) r
                    )
                    Array.empty
                    row
            )
            seg


transformToEnhancementRule : String -> List EnhancementRule
transformToEnhancementRule enhancementLine =
    let
        io =
            String.split " => " enhancementLine

        input =
            transformEnhancementSegment <|
                String.split "/" <|
                    Maybe.withDefault "" <|
                        List.head io

        output =
            transformEnhancementSegment <|
                String.split "/" <|
                    Maybe.withDefault "" <|
                        List.head <|
                            List.reverse io
    in
    completeEnhancementBook <| EnhancementRule input output



--
-- isRuleOnBook : EnhancementRule -> List EnhancementRule -> Bool
-- isRuleOnBook rule book =
--     let
--         updatedBook =
--             List.drop 1 book
--
--         selectedRule =
--             Maybe.withDefault nonValidEnhancementRule <|
--                 List.head book
--     in
--     if rule.input == selectedRule.input then
--         True
--     else if List.isEmpty book then
--         False
--     else
--         isRuleOnBook rule updatedBook


removeDuplicatesFromBook : List EnhancementRule -> List EnhancementRule -> List EnhancementRule
removeDuplicatesFromBook book resultingBook =
    let
        updatedBook =
            List.drop 1 book

        selectedRule =
            Maybe.withDefault nonValidEnhancementRule <|
                List.head book

        updatedResultingBook =
            -- if isRuleOnBook selectedRule resultingBook then
            --     resultingBook
            -- else
            --     List.append resultingBook [ selectedRule ]
            if List.member selectedRule resultingBook then
                resultingBook
            else
                List.append resultingBook [ selectedRule ]
    in
    if List.isEmpty book then
        resultingBook
    else
        removeDuplicatesFromBook updatedBook updatedResultingBook


getPuzzleAnswer : String
getPuzzleAnswer =
    let
        {--
            defaultProgram:
            . # .
            . . #
            # # #
        --}
        -- size == rows == columns
        --
        -- if size % 2 == 0 then
        --     make it a 3x3 by following the enhancement rule.
        -- else if size % 3 == 0 then
        --     make it a 4x4 by following the enhancement rule.
        puzzleRows =
            List.filter (not << String.isEmpty) <|
                String.lines getPuzzleInput

        defaultProgram =
            Array.fromList
                [ Array.fromList [ Off, On, Off ]
                , Array.fromList [ Off, Off, On ]
                , Array.fromList [ On, On, On ]
                ]

        dummy =
            Array.fromList
                [ Array.fromList [ Off, On, Off ]
                , Array.fromList [ Off, Off, On ]
                , Array.fromList [ On, On, On ]
                ]

        enhancementBook =
            List.map (transformToEnhancementRule << String.trim) puzzleRows

        filteredEnhancementBook =
            removeDuplicatesFromBook (List.concat enhancementBook) []

        -- _ =
        --     List.map
        --         (Debug.log "rule")
        --         (List.concat enhancementBook)
        applyRule targetProgram =
            List.foldl
                (\rule r ->
                    let
                        reversedInput =
                            Array.fromList <|
                                List.reverse <|
                                    Array.toList targetProgram
                    in
                    if targetProgram == rule.input || reversedInput == rule.input then
                        -- Debug.crash "Found!"
                        rule.output
                    else
                        -- Debug.log "rule" rule
                        r
                )
                (.output <| nonValidEnhancementRule)
                filteredEnhancementBook

        iteration1 =
            applyRule defaultProgram

        iteration2 =
            -- you need to find the YxY sub-matrix and apply the rules.
            applyRule iteration1

        _ =
            Debug.log "iteration1" iteration1

        _ =
            Debug.log "iteration2" iteration2

        -- _ = Debug.log "enchancement Book length" <| List.length <| List.concat enhancementBook
        -- _ = Debug.log "filteredEnhancementBook Book length" <| List.length filteredEnhancementBook
        -- selectedEnhancementRule =
        --     transformToEnhancementRule <|
        --         String.trim <|
        --             Maybe.withDefault "" <|
        --                 List.head <|
        --                     List.drop 12 puzzleRows
        -- _ =
        -- Debug.log "enchancementRule1" <| Array.toList selectedEnhancementRule.input
        -- transformToEnhancementRule <|
        --     String.trim <|
        --         Maybe.withDefault "" <|
        --             List.head <|
        --                 List.drop 12 puzzleRows
        -- book =
        -- completeEnhancementBook selectedEnhancementRule
    in
    ""


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    ""



{--
    module Main exposing (main)

import Array exposing (..)
import Html exposing (Html, br, div, text, hr)


printInput input =
    div []
    (Array.foldl
        (\row r ->
                 r
                    ++ [ text
                            (Array.foldl
                                (\item rr ->
                                    rr ++ item
                                )
                                ""
                                row
                            )
                       , br [] []
                       ]

        )
        []
        input
    )



rotateEnhancementRule input =
    let
        randomArray =
            Array.empty

        vector =
            Array.foldl
                (\row r ->
                    Debug.log "row" row
                )
                Array.empty
                input

        _ = Debug.log "vector" vector
    in
    vector

rotateTwoByTwoRule : Array (Array String) -> Array (Array String)
rotateTwoByTwoRule input =
    let
        (firstRow, secondRow) =
          ( Maybe.withDefault Array.empty <|
              Array.get 0 input
          , Maybe.withDefault Array.empty <|
              Array.get 1 input
          )
    in
    Array.fromList <|
    List.map2
      (\first second ->
        Array.fromList [first,second]
      )
      (Array.toList firstRow)
      (Array.toList secondRow)

rotateThreeByThreeRule : Array (Array String) -> Array (Array String)
rotateThreeByThreeRule input =
    let
        (firstRow, secondRow, thirdRow) =
          ( Maybe.withDefault Array.empty <|
              Array.get 0 input
          , Maybe.withDefault Array.empty <|
              Array.get 1 input
          , Maybe.withDefault Array.empty <|
              Array.get 2 input
          )
    in
    Array.fromList <|
    List.map3
      (\first second third ->
        Array.fromList [third,second,first]
      )
      (Array.toList firstRow)
      (Array.toList secondRow)
      (Array.toList thirdRow)


main : Html msg
main =
    let
        input =
            Array.fromList <|
                [ Array.fromList [ ".", "#", "." ]
                , Array.fromList [ ".", ".", "#" ]
                , Array.fromList [ "#", "#", "#" ]
                ]

        flippedInput =
            Array.map
                (Array.fromList << List.reverse << Array.toList)
                input

        rotatedInput =
            --rotateEnhancementRule input
            rotateThreeByThreeRule input

        reversedInput =
            Array.fromList <|
            List.reverse <|
                Array.toList input
    in
    div []
        [ text "Hello, World!"
        , br [] []
        , text "1"
        , printInput input
        , hr [] []
        , br [] []
        , text "2"
        , printInput flippedInput
        , hr [] []
        , text "3"
        , printInput rotatedInput
        , hr [] []
        , br [] []
        , text "4"
        , br [] []
        , printInput reversedInput
        ]

--}
