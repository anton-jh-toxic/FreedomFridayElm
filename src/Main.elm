module Main exposing (..)

import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid exposing (row)
import Browser
import Components.ProductCard as CardComponent
import Html as H exposing (Html)
import Html.Attributes as A
import Html.Events as E
import Stuff.Api as Api exposing (Product)


type Model
    = Loading
    | Failure
    | Success ShopModel


type alias ShopModel =
    { products : List Product
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading
    , Api.getAllProducts (Api.hideError >> GotStuff)
    )


type Msg
    = GotStuff (Result () (List Product))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotStuff result ->
            case result of
                Result.Err _ ->
                    ( Failure, Cmd.none )

                Result.Ok res ->
                    ( Success (ShopModel res), Cmd.none )


view model =
    Grid.container []
        [ CDN.stylesheet -- creates an inline style node with the Bootstrap CSS
        , Grid.row []
            (viewProductList model)
        ]


viewProductList : Model -> List (Grid.Column Msg)
viewProductList model =
    case model of
        Loading ->
            [ Grid.col [] [ H.text "LOADING..." ] ]

        Failure ->
            [ Grid.col [] [ H.text "Failed" ] ]

        Success shop ->
            List.map viewProduct shop.products


viewProduct : Product -> Grid.Column Msg
viewProduct product =
    Grid.col [] [ CardComponent.view product ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
