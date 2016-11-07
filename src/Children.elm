module Children exposing (..)

import Html exposing (..)
import Types exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String
import Json.Decode as Json

renderChild: Child -> Html Msg
renderChild child =
    let
        cls =
            if child.balance < 0 then
                "child bad"
            else
                "child good"
    in
        div
            [ class cls
            , onClick (SelectChild child) ]
            [ span
                []
                [ text (child.name ++ " (" ++ (toString child.balance) ++ ")") ]
            , button
                [ class "del-btn"
                , onWithOptions
                    "click"
                    { defaultOptions | stopPropagation = True }
                    (Json.succeed (DeleteChild child)) ]
                [ text "X" ]
            ]


root: Model -> Html Msg
root model =
    let
        newChild =
            Maybe.withDefault "" model.newChildName

        dup =
            model.children
                |> List.map (.name >> String.toLower)
                |> List.member (newChild |> String.toLower)

        canAdd =
            (newChild |> String.length) > 0 && (not dup)

    in
        div
            [ class "container" ]
            [ h3
                [ class "choose" ]
                [ text "Choose which child to manage" ]
            , div
                []
                (model.children
                    |> List.sortBy .name
                    |> List.map renderChild)
            , fieldset
                [ class "add-child" ]
                [ legend
                    []
                    [ text "Add another child" ]
                , div
                    []
                    [ input
                        [ onInput NewChildNameUpdate
                        , placeholder "Child Name"
                        , value newChild
                        ]
                        []
                    , button
                        [ class "add-btn"
                        , disabled (not canAdd)
                        , onClick AddChild ]
                        [ text "Add" ]
                    ]
                ]
            ]
