module Child exposing (..)

import Html exposing (..)
import Types exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

root: Model -> Html Msg
root model =
    case model.selectedChild of
        Nothing -> div [] []
        Just child ->
            div
                [ class "container selected-child" ]
                [ div
                    [ class "score-btns good" ]
                    [ button
                        [ onClick (UpdateChild { child | balance = child.balance + 1 }) ]
                        [ text "Nice" ]
                    ]
                , div
                    [ class "current-score" ]
                    [ text (child.name ++ " : " ++ (toString child.balance)) ]
                , div
                    [ class "score-btns bad" ]
                    [ button
                        [ onClick (UpdateChild { child | balance = child.balance - 1 }) ]
                        [ text "Naughty" ]
                    ]
                , div
                    [ class "back-btn" ]
                    [ button
                        [ onClick UnselectChild ]
                        [ text "Back" ]
                    ]
                ]
