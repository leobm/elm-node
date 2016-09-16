module Node.Path
    exposing
        ( FilePath
        , normalize
        , join
        , resolve
        , isAbsolute
        , relative
        , basename
        , extname
        , sep
        , delimiter
        )

{-| This module contains utilities for handling and transforming file paths.
The file system is not consulted to check whether paths are valid.

@docs normalize, join, resolve, isAbsolute, relative
@docs basename, extname, sep, delimiter

-}

import Native.Node.Path


{-| FilePath
-}
type alias FilePath =
    String


{-| Normalize a string path, taking care of '..' and '.' parts.

    normalize "/foo/bar//baz/asdf/quux/.." == "/foo/bar/baz/asdf"
-}
normalize : FilePath -> FilePath
normalize path =
    Native.Node.Path.normalize path


{-| Join a list of paths together and normalize the resulting path.

    join ["/foo", "bar", "baz/asdf", "quux", ".."] == "/foo/bar/baz/asdf"
-}
join : List FilePath -> FilePath
join paths =
    Native.Node.Path.join paths


{-| Resolves a list of paths to an absolute path.

  resolve ["foo/bar", "/tmp/file/", "..", "a/../subfile"] == "/tmp/subfile"

which is similar to

  cd foo/bar
  cd /tmp/file/
  cd ..
  cd a/../subfile
  pwd
-}
resolve : List FilePath -> FilePath
resolve paths =
    Native.Node.Path.resolve paths


{-| Determines whether a path will always resolve to the same location,
regardless of the working directory.

  isAbsolute "/foo/bar" == true
  isAbsolute "/baz/.." == true
  isAbsolute "qux/" == false
  isAbsolute "." == false
-}
isAbsolute : FilePath -> Bool
isAbsolute path =
    Native.Node.Path.isAbsolute path


{-| Solve the relative path between two paths.

  relative "/data/orandea/test/aaa" "/data/orandea/impl/bbb" == "../../impl/bbb"
-}
relative : FilePath -> FilePath -> FilePath
relative from to =
    Native.Node.Path.relative from to


{-| Determine the directory name of a path.

  dirname "/foo/bar/baz/asdf/quux" == "/foo/bar/baz/asdf"
-}
dirname : FilePath -> FilePath
dirname path =
    Native.Node.Path.dirname path


{-| Determine the last portion of a path.

  basename "/foo/bar/baz/asdf/quux.html" "" == "quux.html"
  basename "/foo/bar/baz/asdf/quux.html" ".html" == "quux"
-}
basename : FilePath -> String -> FilePath
basename path ext =
    Native.Node.Path.basename path ext


{-| Determine the extension of the path.

  extname "index.html" == ".html"
  extname "index.coffee.md" == ".md"
  extname "index." == "."
  extname "index" == ""
-}
extname : FilePath -> String
extname path =
    Native.Node.Path.extname path


{-| The platform-specific file separator, '\\' or '/'.
-}
sep : String
sep =
    Native.Node.Path.sep


{-| The platform-specific path delimiter, ; or ':'.
-}
delimiter : String
delimiter =
    Native.Node.Path.delimiter
