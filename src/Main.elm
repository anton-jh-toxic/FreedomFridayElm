module Main exposing (..)

import Browser
import Components.ProductCard as CardComponent
import Html as H exposing (Html)
import Html.Attributes as A
import Html.Events as E


type alias Model =
    { number : Int
    }


init : Model
init =
    Model 0


type Msg
    = DidStuff


update : Msg -> Model -> Model
update msg model =
    case msg of
        DidStuff ->
            { model | number = model.number + 1 }


view : Model -> Html Msg
view =
    CardComponent.view


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }
