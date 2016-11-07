port module Ports exposing (..)

import Types exposing (..)

port storage : (Database -> msg) -> Sub msg

port updateStorage : Database -> Cmd msg