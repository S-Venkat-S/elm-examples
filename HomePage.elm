module Counter exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- Model


type alias Model =
    { start : Int
    , offset : Int
    }


initialModel : Model
initialModel =
    { start = 0, offset = 0 }



-- View
--view : Model -> Html Msg


view model =
    div [ class "hai" ]
        [ button [ onClick Decrement ] [ text "-" ]
        , h1 [] [ text (toString model.start) ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Reset ] [ text "R" ]
        , input [ value (toString model.offset), onInput Change ] []
        ]



-- Update


type Msg
    = Increment
    | Decrement
    | Reset
    | Change String



--update : Msg -> Model -> Model


update msg model =
    case msg of
        Increment ->
            { model | start = model.start + 1 }

        Decrement ->
            { model | start = model.start - 1 }

        Reset ->
            { model | start = model.offset }

        Change cnt ->
            { model | offset = Result.withDefault 0 (String.toInt cnt) }



-- Entry point
--main : Program Never Model Msg


main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
