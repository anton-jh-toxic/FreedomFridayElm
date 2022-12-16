module Main exposing(..)

import Html as H exposing (Html, text)
import Html.Events as E
import Html.Attributes as A
import Browser


type alias Model =
    { number: Int
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
view model =
    H.button
        [ E.onClick DidStuff
        , A.class "hurr"
        , A.style "color" "black"
        , A.type_ "button"
        ]
        [ H.text (String.fromInt model.number)
        , H.p [] [ H.text "hurr" ]
        ]



main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view}
