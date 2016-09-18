module Types exposing (..)

type alias Model =
    { children : List Child
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

initialModel : Model
initialModel =
    Model []
