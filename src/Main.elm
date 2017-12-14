module Main exposing (..)

-- import Days.Day15 as Day15
-- import Days.Day16 as Day16
-- import Days.Day17 as Day17
-- import Days.Day18 as Day18
-- import Days.Day19 as Day19
-- import Days.Day20 as Day20
-- import Days.Day21 as Day21
-- import Days.Day22 as Day22
-- import Days.Day23 as Day23
-- import Days.Day24 as Day24
-- import Days.Day25 as Day25

import Days.Day1 as Day1
import Days.Day10b as Day10
import Days.Day11 as Day11
import Days.Day12 as Day12
import Days.Day13 as Day13
import Days.Day14 as Day14
import Days.Day2 as Day2
import Days.Day3b as Day3
import Days.Day4 as Day4
import Days.Day5 as Day5
import Days.Day6 as Day6
import Days.Day7b as Day7
import Days.Day8 as Day8
import Days.Day9 as Day9
import Html exposing (..)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "Welcome to Advent Of Code 2017 in Elm." ]
        , br [] []
        , dayResultHtml "Day 1a: " Day1.getPuzzleAnswer
        , dayResultHtml "Day 1b: " Day1.getPuzzleAnswer2
        , dayResultHtml "Day 2a: " Day2.getPuzzleAnswer
        , dayResultHtml "Day 2b: " Day2.getPuzzleAnswer2
        , dayResultHtml "Day 3a: " Day3.getPuzzleAnswer
        , dayResultHtml "Day 3b: " Day3.getPuzzleAnswer2
        , dayResultHtml "Day 4a: " Day4.getPuzzleAnswer
        , dayResultHtml "Day 4b: " Day4.getPuzzleAnswer2
        , dayResultHtml "Day 5a: " Day5.getPuzzleAnswer
        , dayResultHtml "Day 5b: " Day5.getPuzzleAnswer2
        , dayResultHtml "Day 6a: " Day6.getPuzzleAnswer
        , dayResultHtml "Day 6b: " Day6.getPuzzleAnswer2
        , dayResultHtml "Day 7a: " Day7.getPuzzleAnswer
        , dayResultHtml "Day 7b: " Day7.getPuzzleAnswer2
        , dayResultHtml "Day 8a: " Day8.getPuzzleAnswer
        , dayResultHtml "Day 8b: " Day8.getPuzzleAnswer2
        , dayResultHtml "Day 9a: " Day9.getPuzzleAnswer
        , dayResultHtml "Day 9b: " Day9.getPuzzleAnswer2
        , dayResultHtml "Day 10a: " Day10.getPuzzleAnswer
        , dayResultHtml "Day 10b: " Day10.getPuzzleAnswer2
        , dayResultHtml "Day 11a: " Day11.getPuzzleAnswer
        , dayResultHtml "Day 11b: " Day11.getPuzzleAnswer2
        , dayResultHtml "Day 12a: " Day12.getPuzzleAnswer
        , dayResultHtml "Day 12b: " Day12.getPuzzleAnswer2
        , dayResultHtml "Day 13a: " Day13.getPuzzleAnswer
        , dayResultHtml "Day 13b: " Day13.getPuzzleAnswer2
        , dayResultHtml "Day 14a: " Day14.getPuzzleAnswer
        , dayResultHtml "Day 14b: " Day14.getPuzzleAnswer2
        ]


dayResultHtml : String -> String -> Html Msg
dayResultHtml title answer =
    div []
        [ text title
        , text answer
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
