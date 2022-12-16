module Stuff.Api exposing (..)

import Http
import Json.Decode as JD


allProductsEndpoint : String
allProductsEndpoint =
    "https://fakestoreapi.com/products"


getAllProducts : (Result Http.Error (List Product) -> msg) -> Cmd msg
getAllProducts msg =
    Http.get
        { url = allProductsEndpoint
        , expect = Http.expectJson msg (JD.list productDecoder)
        }


hideError : Result Http.Error (List Product) -> Result () (List Product)
hideError =
    Result.mapError (\_ -> ())


type alias Product =
    { id : Int
    , title : String
    , price : Float
    , description : String
    , category : String
    , image : String
    , rating : ProductRating
    }


type alias ProductRating =
    { rate : Float
    , count : Int
    }


productDecoder : JD.Decoder Product
productDecoder =
    JD.map7 Product
        (JD.field "id" JD.int)
        (JD.field "title" JD.string)
        (JD.field "price" JD.float)
        (JD.field "description" JD.string)
        (JD.field "category" JD.string)
        (JD.field "image" JD.string)
        (JD.field "rating" productRatingDecoder)


productRatingDecoder : JD.Decoder ProductRating
productRatingDecoder =
    JD.map2 ProductRating
        (JD.field "rate" JD.float)
        (JD.field "count" JD.int)
