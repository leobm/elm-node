module Node.Stats
    exposing
        ( Stats
        , isFile
        , isDirectory
        , isBlockDevice
        , isCharacterDevice
        , isSymbolicLink
        , isFIFO
        , isSocket
        )

import Native.Node.Stats


{-| Stats
-}
type alias Stats =
    {}


{-| isFile
-}
isFile : Stats -> Bool
isFile stats =
    Native.Node.Stats.isFile stats


{-| isDirectory
-}
isDirectory : Stats -> Bool
isDirectory stats =
    Native.Node.Stats.isDirectory stats


{-| isBlockDevice
-}
isBlockDevice : Stats -> Bool
isBlockDevice stats =
    Native.Node.Stats.isBlockDevice stats


{-| isCharacterDevice
-}
isCharacterDevice : Stats -> Bool
isCharacterDevice stats =
    Native.Node.Stats.isCharacterDevice stats


{-| isSymbolicLink
-}
isSymbolicLink : Stats -> Bool
isSymbolicLink stats =
    Native.Node.Stats.isSymbolicLink stats


{-| isFIFO
-}
isFIFO : Stats -> Bool
isFIFO stats =
    Native.Node.Stats.isFIFO stats


{-| isSocket
-}
isSocket : Stats -> Bool
isSocket stats =
    Native.Node.Stats.isSocket stats
