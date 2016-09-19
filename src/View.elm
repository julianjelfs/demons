module View exposing (..)

import Html exposing (..)
import Types exposing (..)
import Children
import Child

root: Model -> Html Msg
root model =
    case model.selectedChild of
        Nothing ->
            Children.root model
        Just child ->
            Child.root model
