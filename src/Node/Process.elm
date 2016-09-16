module Node.Process
    exposing
        ( args
        , argv
        , execPath
        , execArgv
        , exec
        , exit
        , pid
        , version
        , cwd
        )

{-| Process

@docs args, argv, execPath, execArgv

@docs exec

@docs exit, pid

@docs version

-}

import Native.Node.Process
import Task exposing (Task)


{-| A List containing the command line arguments.
The first element will be 'node', the second element will be the name of the JavaScript file.
The next elements will be any additional command line arguments.
-}
argv : List String
argv =
    Native.Node.Process.argv


{-| A List containing only the additional command line arguments.
-}
args : List String
args =
    List.drop 2 Native.Node.Process.argv


{-| The absolute pathname of the executable that started the process.
-}
execPath : String
execPath =
    Native.Node.Process.execPath


{-| The set of node-specific command line options from the executable that started the process.
-}
execArgv : List String
execArgv =
    Native.Node.Process.execArgv


{-| Run a command in a shell.
-}
exec : String -> Task String String
exec command =
    Native.Node.Process.exec command


{-| Ends the process with the specified code.
-}
exit : Int -> Task x ()
exit code =
    Native.Node.Process.exit code


{-| The PID of the process.
-}
pid : Int
pid =
    Native.Node.Process.pid


{-| A compiled-in property that exposes NODE_VERSION.
-}
version : String
version =
    Native.Node.Process.version


{-| Returns the current working directory of the process.
-}
cwd : String
cwd =
    Native.Node.Process.cwd
