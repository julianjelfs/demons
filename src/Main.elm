module Main exposing(..)

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json exposing ((:=))
import Http exposing (get)
import Task

type Msg =
    ResultSuccess Int
    | ResultFailed Http.Error
    | Refresh

init : ( Int, Cmd Msg )
init =
  ( 0, getArrivalTime )

view: Int -> Html Msg
view model =
    div
        [ class "container" ]
        [ div
            [ class "minutes" ]
            [ text (toString model)]
        , div
            [ class "refresh" ]
            [ button
                [ onClick Refresh ]
                [ text "Refresh" ]
            ]
        ]

update : Msg -> Int -> (Int,  Cmd Msg)
update msg model =
    case msg of
        ResultSuccess min ->
            ( min, Cmd.none )

        ResultFailed err ->
            ( 0, Cmd.none )

        Refresh ->
            ( model, getArrivalTime )

getArrivalTime : Cmd Msg
getArrivalTime =
    (get timeDecoder "https://api.tfl.gov.uk/StopPoint/490010849S/Arrivals?app_id=da7d2b38&app_key=6e41a466bf61c85ce50712c5622e12d1")
        |> Task.perform ResultFailed ResultSuccess


timeDecoder : Json.Decoder Int
timeDecoder =
    Json.list ("timeToStation" := Json.int)
        `Json.andThen` (\l -> l |> List.head |> (Maybe.withDefault 0) |> Json.succeed)

main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = \m -> Sub.none
        }

