module Main exposing (..)

import Browser exposing (Document)
import Css.Global
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Json.Decode as De
import Tailwind.Utilities exposing (..)

type Msg
    = NoOp


type alias Model =
    { mesg : String
    }


main : Program De.Value Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : De.Value -> ( Model, Cmd Msg )
init flags =
    ( { mesg = "hello, world" }
    , Cmd.none
    )

view : Model -> Document Msg
view model =
    { title = model.mesg
    , body =
        [ toUnstyled <|
            div
                [ css
                    [ h_full
                    ]
                ]
                [ -- This will give us the standard tailwind style-reset as well as the fonts
                  Css.Global.global globalStyles
                , div
                    [ css
                        [ h_full
                        , w_full
                        , p_8
                        ]
                    ]
                    [ text "wassup diggity"
                    ]
                ]
        ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch <|
        []