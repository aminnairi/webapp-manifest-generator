module Main exposing (main)

import Browser
import Html exposing (Html, a, br, button, code, h1, input, label, main_, option, pre, select, table, tbody, td, text, tr)
import Html.Attributes exposing (autofocus, class, for, href, id, target, value)
import Html.Events exposing (onClick, onInput)
import Json.Encode exposing (Value, encode, object, string)
import List
import String


type alias Model =
    { backgroundColor : String
    , description : String
    , textDirection : String
    , displayMode : String
    , language : String
    , name : String
    , orientation : String
    , applicationScope : String
    , shortName : String
    , applicationStartUrl : String
    , themeColor : String
    }


init : Model
init =
    Model "" "" "" "" "" "" "" "" "" "" ""


noChildren : List nothing
noChildren =
    []


noAttributes : List nothing
noAttributes =
    []


type Message
    = UpdateName String
    | UpdateShortName String
    | UpdateBackgroundColor String
    | UpdateDescription String
    | UpdateTextDirection String
    | UpdateLanguage String
    | UpdateDisplayMode String
    | UpdateOrientation String
    | UpdateApplicationScope String
    | UpdateApplicationStartUrl String
    | UpdateThemeColor String
    | Reset


update : Message -> Model -> Model
update message model =
    case message of
        UpdateName name ->
            { model | name = name }

        UpdateShortName shortName ->
            { model | shortName = shortName }

        UpdateBackgroundColor backgroundColor ->
            { model | backgroundColor = backgroundColor }

        UpdateDescription description ->
            { model | description = description }

        UpdateTextDirection textDirection ->
            { model | textDirection = textDirection }

        UpdateLanguage language ->
            { model | language = language }

        UpdateDisplayMode displayMode ->
            { model | displayMode = displayMode }

        UpdateOrientation orientation ->
            { model | orientation = orientation }

        UpdateApplicationScope applicationScope ->
            { model | applicationScope = applicationScope }

        UpdateApplicationStartUrl applicationStartUrl ->
            { model | applicationStartUrl = applicationStartUrl }

        UpdateThemeColor themeColor ->
            { model | themeColor = themeColor }

        Reset ->
            Model "" "" "" "" "" "" "" "" "" "" ""


jsonStringOrNothing : String -> String -> Maybe ( String, Value )
jsonStringOrNothing property value =
    case String.isEmpty value of
        True ->
            Nothing

        False ->
            Just ( property, string value )


encodeModel : Model -> Value
encodeModel model =
    object <|
        List.filterMap identity
            [ jsonStringOrNothing "name" model.name
            , jsonStringOrNothing "short_name" model.shortName
            , jsonStringOrNothing "background_color" model.backgroundColor
            , jsonStringOrNothing "description" model.description
            , jsonStringOrNothing "dir" model.textDirection
            , jsonStringOrNothing "lang" model.language
            , jsonStringOrNothing "display" model.displayMode
            , jsonStringOrNothing "orientation" model.orientation
            , jsonStringOrNothing "scope" model.applicationScope
            , jsonStringOrNothing "start_url" model.applicationStartUrl
            , jsonStringOrNothing "theme_color" model.themeColor
            ]


modelToJson : Model -> String
modelToJson model =
    encode 2 <| encodeModel model


view : Model -> Html Message
view model =
    main_
        noAttributes
        [ h1 noAttributes [ text "Manifest Generator" ]
        , table
            noAttributes
            [ tbody
                noAttributes
                [ tr
                    noAttributes
                    [ td
                        noAttributes
                        [ label
                            [ for "name" ]
                            [ text "Name " ]
                        ]
                    , td
                        noAttributes
                        [ input
                            [ autofocus True
                            , onInput UpdateName
                            , value model.name
                            , id "name"
                            ]
                            noAttributes
                        ]
                    ]
                , tr noAttributes
                    [ td
                        noAttributes
                        [ label
                            [ for "short-name" ]
                            [ text "Short Name " ]
                        ]
                    , td
                        noAttributes
                        [ input
                            [ onInput UpdateShortName
                            , value model.shortName
                            , id "short-name"
                            ]
                            noChildren
                        ]
                    ]
                , tr noAttributes
                    [ td
                        noAttributes
                        [ label
                            [ for "background-color" ]
                            [ text "Background Color " ]
                        ]
                    , td
                        noAttributes
                        [ input
                            [ onInput UpdateBackgroundColor
                            , value model.backgroundColor
                            , id "background-color"
                            ]
                            noChildren
                        ]
                    ]
                , tr noAttributes
                    [ td
                        noAttributes
                        [ label
                            [ for "description" ]
                            [ text "Description " ]
                        ]
                    , td
                        noAttributes
                        [ input
                            [ onInput UpdateDescription
                            , value model.description
                            , id "description"
                            ]
                            noChildren
                        ]
                    ]
                , tr noAttributes
                    [ td
                        noAttributes
                        [ label
                            [ for "text-direction" ]
                            [ text "Text Direction " ]
                        ]
                    , td
                        noAttributes
                        [ select
                            [ onInput UpdateTextDirection
                            , value model.textDirection
                            , id "text-direction"
                            ]
                            [ option [ value "" ] [ text "" ]
                            , option [ value "ltr" ] [ text "Left to right" ]
                            , option [ value "rtl" ] [ text "Right to left" ]
                            , option [ value "auto" ] [ text "Automatic" ]
                            ]
                        ]
                    ]
                , tr noAttributes
                    [ td
                        noAttributes
                        [ label
                            [ for "language" ]
                            [ text "Language " ]
                        ]
                    , td
                        noAttributes
                        [ input
                            [ onInput UpdateLanguage
                            , value model.language
                            , id "language"
                            ]
                            noChildren
                        ]
                    ]
                , tr noAttributes
                    [ td
                        noAttributes
                        [ label
                            [ for "display-mode" ]
                            [ text "Display Mode " ]
                        ]
                    , td
                        noAttributes
                        [ select
                            [ onInput UpdateDisplayMode
                            , value model.displayMode
                            , id "display-mode"
                            ]
                            [ option [ value "" ] [ text "" ]
                            , option [ value "fullscreen" ] [ text "Fullscreen" ]
                            , option [ value "standalone" ] [ text "Standalone" ]
                            , option [ value "minimal-ui" ] [ text "Minimal" ]
                            , option [ value "browser" ] [ text "Browser" ]
                            ]
                        ]
                    ]
                , tr noAttributes
                    [ td
                        noAttributes
                        [ label
                            [ for "orientation" ]
                            [ text "Orientation " ]
                        ]
                    , td
                        noAttributes
                        [ select
                            [ onInput UpdateOrientation
                            , value model.orientation
                            , id "orientation"
                            ]
                            [ option [ value "" ] [ text "" ]
                            , option [ value "natural" ] [ text "Natural" ]
                            , option [ value "landscape" ] [ text "Landscape" ]
                            , option [ value "landscape-primary" ] [ text "Landscape Primary" ]
                            , option [ value "landscape-secondary" ] [ text "Landscape Secondary" ]
                            , option [ value "portrait" ] [ text "Portrait" ]
                            , option [ value "portrait-primary" ] [ text "Portrait Primary" ]
                            , option [ value "portrait-secondary" ] [ text "Portrait Secondary" ]
                            ]
                        ]
                    ]
                , tr noAttributes
                    [ td
                        noAttributes
                        [ label
                            [ for "scope" ]
                            [ text "Application Scope " ]
                        ]
                    , td
                        noAttributes
                        [ input
                            [ onInput UpdateApplicationScope
                            , value model.applicationScope
                            , id "scope"
                            ]
                            noChildren
                        ]
                    ]
                , tr noAttributes
                    [ td
                        noAttributes
                        [ label
                            [ for "start-url" ]
                            [ text "Application URL " ]
                        ]
                    , td
                        noAttributes
                        [ input
                            [ onInput UpdateApplicationStartUrl
                            , value model.applicationStartUrl
                            , id "start-url"
                            ]
                            noChildren
                        ]
                    ]
                , tr noAttributes
                    [ td
                        noAttributes
                        [ label
                            [ for "theme-color" ]
                            [ text "Theme Color " ]
                        ]
                    , td
                        noAttributes
                        [ input
                            [ onInput UpdateThemeColor
                            , value model.themeColor
                            , id "theme-color"
                            ]
                            noChildren
                        ]
                    ]
                , tr
                    noAttributes
                    [ td noAttributes noChildren
                    , td
                        noAttributes
                        [ button [ onClick Reset ] [ text "reset" ]
                        ]
                    ]
                ]
            ]
        , pre noAttributes
            [ code
                noAttributes
                [ text <| modelToJson model ]
            ]
        , pre noAttributes
            [ code
                noAttributes
                [ text "<link rel='manifest' href='manifest.webmanifest'>" ]
            ]
        , a
            [ href "https://developer.mozilla.org/en-US/docs/Web/Manifest", target "blank" ]
            [ text "Mozilla's Official Documentation" ]
        ]


main : Program () Model Message
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }
