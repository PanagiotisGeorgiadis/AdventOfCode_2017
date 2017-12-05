module Main exposing (..)

import Days.Day1 as Day1
import Days.Day2 as Day2
import Days.Day3 as Day3
import Days.Day4 as Day4
import Days.Day5 as Day5
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
