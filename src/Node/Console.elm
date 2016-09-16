module Node.Console exposing (log, error, fatal)

{-| Console

@docs log, error, fatal

-}

import Task exposing (Task)
import Native.Node.Console


{-| Prints to stdout with a newline.
-}
log : a -> Task x ()
log value =
    Native.Node.Console.log value


{-| Prints to stderr with a newline.
-}
error : a -> Task x ()
error value =
    Native.Node.Console.error value


{-| Prints to stderr with a newline, then exits with an error code of 1.
-}
fatal : a -> Task x ()
fatal value =
    Native.Node.Console.fatal value
