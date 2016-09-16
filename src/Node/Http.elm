module Node.Http
    exposing
        ( Error(..)
        , Request
        , Response
        , get
        , serve
        , sendResponse
        , end
        , setHeader
        , setStatusCode
        , responseAsStream
        , requestAsStream
        )

{-|

@docs Error
@docs get, serve, getURL, sendResponse

-}

import Task exposing (Task)
import Native.Node.Http
import Dict exposing (Dict)
import Node.Url exposing (Url)
import Node.Stream exposing (Writable, Readable)


{-| Error
-}
type Error
    = NetworkError String


{-| Request
-}
type alias Request =
    { httpVersion : String
    , headers : Dict String String
    , method : String
    , url : Url
    }


{-| Response
-}
type alias Response =
    {}


{-| get
-}
get : String -> Task Error String
get url =
    Native.Node.Http.get url


{-| serve
-}
serve : Int -> (Request -> Response -> Task x a) -> Task x ()
serve prt taskFunction =
    Native.Node.Http.serve prt taskFunction


{-| sendResponse
-}
sendResponse : String -> Response -> Task x ()
sendResponse s res =
    Task.succeed <| Native.Node.Http.end res s


{-| end
-}
end : Response -> Task x ()
end res =
    Task.succeed <| Native.Node.Http.end res ""


{-| setHeader
-}
setHeader : String -> String -> Response -> Response
setHeader name value res =
    Native.Node.Http.setHeader res name value


{-| setStatusCode
-}
setStatusCode : Int -> Response -> Response
setStatusCode code res =
    Native.Node.Http.setStatusCode res code


{-| responseAsStream
-}
responseAsStream : Response -> Writable
responseAsStream =
    Native.Node.Http.responseAsStream


{-| requestAsStream
-}
requestAsStream : Request -> Readable
requestAsStream =
    Native.Node.Http.requestAsStream
