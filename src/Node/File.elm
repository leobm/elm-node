module Node.File
    exposing
        ( Error(..)
        , read
        , write
        , lstat
        )

{-| File

@docs Error
@docs read
@docs lstat
@docs write

-}

import Native.Node.File
import Task exposing (Task)
import Node.Path exposing (FilePath)
import Node.Stats exposing (Stats)


{-| Error
-}
type Error
    = ReadError String
    | WriteError String


{-| Read a file.
-}
read : FilePath -> Task Error String
read path =
    Native.Node.File.read path


{-| Write a file.
-}
write : FilePath -> String -> Task Error ()
write path data =
    Native.Node.File.write path data


{-| lstat
-}
lstat : FilePath -> Task Error Stats
lstat path =
    Native.Node.File.lstat path
