module Components.ProductCard exposing (..)

import Bootstrap.Accordion exposing (Card)
import Bootstrap.Button as Button
import Bootstrap.CDN as CDN
import Bootstrap.Card as Card
import Bootstrap.Card.Block as Block
import Bootstrap.Grid as Grid
import Bootstrap.Utilities.Spacing as Spacing
import Html as H exposing (Html)
import Html.Attributes as A
import Stuff.Api as Api exposing (Product)


view : Product -> Html msg
view product =
    Card.config [ Card.attrs [ A.style "width" "20rem" ] ]
        |> Card.header [ A.class "text-center" ]
            [ H.img [ A.style "height" "10rem", A.src product.image ] []
            , H.h3 [ Spacing.mt2 ] [ H.text product.title ]
            ]
        |> Card.block []
            [ Block.titleH4 [] [ H.text product.title ]
            , Block.text [] [ H.text product.description ]
            , Block.custom <|
                Button.button [ Button.success ] [ H.text "Add to cart 🛒" ]
            ]
        |> Card.view
