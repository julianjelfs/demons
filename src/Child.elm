module Child exposing (..)

import Html exposing (..)
import Types exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

btn child fn n =
    button
        [ onClick (UpdateChild { child | balance = fn child.balance n }) ]
        [ text (toString n) ]

root: Model -> Html Msg
root model =
    case model.selectedChild of
        Nothing -> div [] []
        Just child ->
            div
                []
                [ div
                    []
                    [ h3
                        []
                        [ text ("Scorecard for " ++ child.name) ]
                    ]
                , div
                    []
                    ([1..3]
                        |> List.map (btn child (+)))
                , div
                    []
                    [ text ("Current score: " ++ (toString child.balance)) ]
                , div
                    []
                    ([1..3]
                        |> List.map (btn child (-)))
                , div
                    []
                    [ button
                        [ onClick UnselectChild ]
                        [ text "Back" ]
                    ]
                ]
