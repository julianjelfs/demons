module View exposing (..)

import Html exposing (..)
import Types exposing (..)

renderChild: Child -> Html Msg
renderChild child =
    div
        []
        [ text (child.name ++ " (" ++ (toString child.balance) ++ ")") ]

root: Model -> Html Msg
root model =
    div
        []
        [ div
            []
            [ text "Choose which child to manage" ]
        , div
            []
            (List.map renderChild model.children)
        , div
            []
            [ text "Add another child" ]
        ]
