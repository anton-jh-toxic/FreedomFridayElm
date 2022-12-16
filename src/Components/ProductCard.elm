module Components.ProductCard exposing (..)

import Bootstrap.Button as Button
import Bootstrap.CDN as CDN
import Bootstrap.Card as Card
import Bootstrap.Card.Block as Block
import Bootstrap.Grid as Grid
import Bootstrap.Utilities.Spacing as Spacing
import Html as H
import Html.Attributes as A


view model =
    Card.config [ Card.attrs [ A.style "width" "20rem" ] ]
        |> Card.header [ A.class "text-center" ]
            [ H.img [ A.src "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg" ] []
            , H.h3 [ Spacing.mt2 ] [ H.text "Custom Card Header" ]
            ]
        |> Card.block []
            [ Block.titleH4 [] [ H.text "Card title" ]
            , Block.text [] [ H.text "Some quick example text to build on the card title and make up the bulk of the card's content." ]
            , Block.custom <|
                Button.button [ Button.primary ] [ H.text "Go somewhere" ]
            ]
        |> Card.view
