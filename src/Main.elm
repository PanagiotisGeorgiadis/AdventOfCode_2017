module Main exposing (..)

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
import Days.Day15b as Day15
import Days.Day16 as Day16
import Days.Day17 as Day17
import Days.Day18 as Day18
import Days.Day19 as Day19
import Days.Day2 as Day2
import Days.Day20 as Day20
import Days.Day21 as Day21
import Days.Day3b as Day3
import Days.Day4 as Day4
import Days.Day5 as Day5
import Days.Day6 as Day6
import Days.Day7b as Day7
import Days.Day8 as Day8
import Days.Day9 as Day9
import Html exposing (..)
import Html.Attributes exposing (class)


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
        , dayResultHtml "Day 1a: " "done" Day1.getPuzzleAnswer
        , dayResultHtml "Day 1b: " "done" Day1.getPuzzleAnswer2
        , dayResultHtml "Day 2a: " "done" Day2.getPuzzleAnswer
        , dayResultHtml "Day 2b: " "done" Day2.getPuzzleAnswer2
        , dayResultHtml "Day 3a: " "done" Day3.getPuzzleAnswer
        , dayResultHtml "Day 3b: " "done" Day3.getPuzzleAnswer2
        , dayResultHtml "Day 4a: " "done" Day4.getPuzzleAnswer
        , dayResultHtml "Day 4b: " "done" Day4.getPuzzleAnswer2
        , dayResultHtml "Day 5a: " "done" Day5.getPuzzleAnswer
        , dayResultHtml "Day 5b: " "done" Day5.getPuzzleAnswer2
        , dayResultHtml "Day 6a: " "done" Day6.getPuzzleAnswer
        , dayResultHtml "Day 6b: " "done" Day6.getPuzzleAnswer2
        , dayResultHtml "Day 7a: " "done" Day7.getPuzzleAnswer
        , dayResultHtml "Day 7b: " "in-progress" Day7.getPuzzleAnswer2
        , dayResultHtml "Day 8a: " "done" Day8.getPuzzleAnswer
        , dayResultHtml "Day 8b: " "done" Day8.getPuzzleAnswer2
        , dayResultHtml "Day 9a: " "done" Day9.getPuzzleAnswer
        , dayResultHtml "Day 9b: " "done" Day9.getPuzzleAnswer2
        , dayResultHtml "Day 10a: " "done" Day10.getPuzzleAnswer
        , dayResultHtml "Day 10b: " "done" Day10.getPuzzleAnswer2
        , dayResultHtml "Day 11a: " "done" Day11.getPuzzleAnswer
        , dayResultHtml "Day 11b: " "done" Day11.getPuzzleAnswer2
        , dayResultHtml "Day 12a: " "done" Day12.getPuzzleAnswer
        , dayResultHtml "Day 12b: " "done" Day12.getPuzzleAnswer2
        , dayResultHtml "Day 13a: " "done" Day13.getPuzzleAnswer
        , dayResultHtml "Day 13b: " "done" Day13.getPuzzleAnswer2
        , dayResultHtml "Day 14a: " "done" Day14.getPuzzleAnswer
        , dayResultHtml "Day 14b: " "in-progress" Day14.getPuzzleAnswer2
        , dayResultHtml "Day 15a: " "done" Day15.getPuzzleAnswer
        , dayResultHtml "Day 15b: " "done" Day15.getPuzzleAnswer2
        , dayResultHtml "Day 16a: " "done" Day16.getPuzzleAnswer
        , dayResultHtml "Day 16b: " "done" Day16.getPuzzleAnswer2
        , dayResultHtml "Day 17a: " "done" Day17.getPuzzleAnswer
        , dayResultHtml "Day 17b: " "done" Day17.getPuzzleAnswer2
        , dayResultHtml "Day 18a: " "done" Day18.getPuzzleAnswer
        , dayResultHtml "Day 18b: " "in-progress" Day18.getPuzzleAnswer2
        , dayResultHtml "Day 19a: " "done" Day19.getPuzzleAnswer
        , dayResultHtml "Day 19b: " "done" Day19.getPuzzleAnswer2
        , dayResultHtml "Day 20a: " "done" Day20.getPuzzleAnswer
        , dayResultHtml "Day 20b: " "in-progress" Day20.getPuzzleAnswer2
        , dayResultHtml "Day 21a: " "in-progress" Day21.getPuzzleAnswer
        , dayResultHtml "Day 21b: " "in-progress" Day21.getPuzzleAnswer2
        ]


dayResultHtml : String -> String -> String -> Html Msg
dayResultHtml title className answer =
    div [ class className ]
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
