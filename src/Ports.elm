port module Ports exposing (..)

import Types exposing (..)

port storage : (Database -> msg) -> Sub msg