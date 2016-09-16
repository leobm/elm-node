module Node.Url
    exposing
        ( Url
        , Query
        , resolve
        , join
        , parse
        , format
        , emptyUrl
        , parseQueryString
        , toQueryString
        , getQuery
        )

{-| Url

@docs resolve, join, parse, format, parseQueryString, toQueryString, getQuery

-}

import Native.Node.Url
import String
import Dict exposing (Dict)


{-| Query
-}
type alias Query =
    Dict String String


{-| Url
-}
type alias Url =
    { protocol : Maybe String
    , slashes : Maybe Bool
    , host : Maybe String
    , auth : Maybe String
    , hostname : Maybe String
    , port' : Maybe Int
    , pathname : Maybe String
    , search : Maybe String
    , path : Maybe String
    , query : Maybe String
    , hash : Maybe String
    }


emptyUrl : Url
emptyUrl =
    { protocol = Nothing
    , slashes = Nothing
    , host = Nothing
    , auth = Nothing
    , hostname = Nothing
    , port' = Nothing
    , pathname = Nothing
    , search = Nothing
    , path = Nothing
    , query = Nothing
    , hash = Nothing
    }


{-| resolve
-}
resolve : List String -> String
resolve paths =
    Native.Node.Url.resolve paths


{-| join
-}
join : List String -> String
join paths =
    String.join "/" paths


{-| parse
-}
parse : String -> Url
parse urlStr =
    Native.Node.Url.parse urlStr


{-| format
-}
format : Url -> String
format url =
    Native.Node.Url.format url


{-| parseQueryString
-}
parseQueryString : String -> Query
parseQueryString queryStr =
    Native.Node.Url.parseQueryString queryStr


{-| toQueryString
-}
toQueryString : Query -> String
toQueryString query =
    Native.Node.Url.toQueryString query


{-| getQuery
-}
getQuery : Url -> Query
getQuery url =
    Maybe.withDefault Dict.empty
        <| Maybe.map (\qs -> parseQueryString qs) url.query
