module Node.Stream
    exposing
        ( Writable
        , Readable
        , createReadStream
        , pipe
        , setEncoding
        , onData
        )

import Native.Node.Stream
import Node.Path exposing (FilePath)
import Node.Encoding exposing (Encoding)
import Task exposing (Task)


{-| Writable
-}
type alias Writable =
    {}


{-| Readable
-}
type alias Readable =
    {}


{-| Returns a new ReadStream object.
-}
createReadStream : FilePath -> Task x Readable
createReadStream p =
    Native.Node.Stream.createReadStream p


{-| Pulls all the data out of a readable stream, and writes it to the writeable destination
-}
pipe : Readable -> Writable -> Task x ()
pipe r w =
    Native.Node.Stream.pipe r w


setEncoding : Encoding -> Readable -> Readable
setEncoding enc r =
    Native.Node.Stream.setEncoding r (Node.Encoding.toString enc)


onData : Readable -> Task x ()
onData r =
    Native.Node.Stream.onData r
