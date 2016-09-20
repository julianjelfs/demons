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
                    [ class "score-btns good" ]
                    ([1..3]
                        |> List.map (btn child (+)))
                , div
                    [ class "current-score" ]
                    [ text (child.name ++ " : " ++ (toString child.balance)) ]
                , div
                    [ class "score-btns bad" ]
                    ([1..3]
                        |> List.map (btn child (-)))
                , div
                    [ class "back-btn" ]
                    [ button
                        [ onClick UnselectChild ]
                        [ text "Back" ]
                    ]
                ]
