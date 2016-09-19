module State exposing (..)

import Types exposing (..)
import Ports exposing (updateStorage)

update : Msg -> Model -> (Model,  Cmd Msg)
update msg model =
    case msg of
        DatabaseLoaded db ->
            ( { model | children = db.children }, Cmd.none )

        NewChildNameUpdate name ->
            ( { model | newChildName = Just name }, Cmd.none )

        SelectChild child ->
            ( { model | selectedChild = Just child }, Cmd.none )

        UpdateChild child ->
            let
                children =
                    model.children
                        |> List.map (\c ->
                            if c.name == child.name then
                                child
                            else
                                c)
            in
                ( { model | selectedChild = Just child
                , children = children }, (updateStorage (Database children) ) )

        UnselectChild ->
            ( { model | selectedChild = Nothing }, Cmd.none )

        DeleteChild child ->
            let
                updated =
                    {model | children = model.children
                        |> List.filter (\c -> c.name /= child.name)}
            in
                (updated, (updateStorage (Database updated.children) ))

        AddChild ->
            case model.newChildName of
                Nothing ->
                    (model, Cmd.none)
                Just name ->
                    let
                        updated =
                            { model | children = (Child name 0) :: model.children
                            , newChildName = Nothing }
                    in
                        (updated, (updateStorage (Database updated.children) ))


