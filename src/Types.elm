module Types exposing (..)

type alias Model =
    { children : List Child
    , selectedChild : Maybe Child
    , newChildName : Maybe String
    }

type alias Database =
    { children : List Child
    }

type alias Child =
    { name : String
    , balance : Int
    }

type Msg =
    DatabaseLoaded Database
    | NewChildNameUpdate String
    | AddChild
    | DeleteChild Child
    | SelectChild Child
    | UnselectChild
    | UpdateChild Child

initialModel : Model
initialModel =
    Model [] Nothing Nothing
