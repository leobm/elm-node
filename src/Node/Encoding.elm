module Node.Encoding
    exposing
        ( Encoding(..)
        , toString
        )


type Encoding
    = ASCII
    | UTF8
    | UTF16LE
    | UCS2
    | Base64
    | Binary
    | Hex


toString : Encoding -> String
toString enc =
    case enc of
        ASCII ->
            "ascii"

        UTF8 ->
            "utf8"

        UTF16LE ->
            "utf16le"

        UCS2 ->
            "ucs2"

        Base64 ->
            "base64"

        Binary ->
            "binary"

        Hex ->
            "hex"
