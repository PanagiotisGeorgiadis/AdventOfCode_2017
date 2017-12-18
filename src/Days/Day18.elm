module Days.Day18 exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (..)


type alias Register =
    { name : Char
    , value : Int
    }


type InstructionType
    = PlaySound
    | SetRegisterValue
    | AddToRegisterValue
    | MultiplyRegisterValue
    | Modulus
    | RecoverSound
    | Jump
    | NoAction


type alias Instruction =
    { type_ : InstructionType
    , register : Char
    , sourceRegister : Maybe Char
    , value : Int
    }


nonValidInstruction : Instruction
nonValidInstruction =
    Instruction NoAction '-' Nothing 0


nonValidRegister : Register
nonValidRegister =
    Register '-' 0


getInitialRegisters : List Register
getInitialRegisters =
    [ Register 'a' 0
    , Register 'b' 0
    , Register 'c' 0
    , Register 'd' 0
    , Register 'e' 0
    , Register 'f' 0
    , Register 'g' 0
    , Register 'h' 0
    , Register 'i' 0
    , Register 'j' 0
    , Register 'k' 0
    , Register 'l' 0
    , Register 'm' 0
    , Register 'n' 0
    , Register 'o' 0
    , Register 'p' 0
    , Register 'q' 0
    , Register 'r' 0
    , Register 's' 0
    , Register 't' 0
    , Register 'u' 0
    , Register 'v' 0
    , Register 'w' 0
    , Register 'x' 0
    , Register 'y' 0
    , Register 'z' 0
    ]


getInstructionTypeFromString : String -> InstructionType
getInstructionTypeFromString string =
    case string of
        "snd" ->
            PlaySound

        "set" ->
            SetRegisterValue

        "add" ->
            AddToRegisterValue

        "mul" ->
            MultiplyRegisterValue

        "mod" ->
            Modulus

        "rcv" ->
            RecoverSound

        "jgz" ->
            Jump

        _ ->
            NoAction


transformToInstruction : String -> Instruction
transformToInstruction instructionString =
    let
        type_ =
            getInstructionTypeFromString <|
                Maybe.withDefault "" <|
                    List.head <|
                        String.split " " instructionString

        register =
            Tuple.first <|
                Maybe.withDefault ( '-', "" ) <|
                    String.uncons <|
                        Maybe.withDefault "" <|
                            List.head <|
                                List.drop 1 <|
                                    String.split " " instructionString

        value =
            Result.withDefault -10000 <|
                String.toInt <|
                    Maybe.withDefault "0" <|
                        List.head <|
                            List.reverse <|
                                String.split " " instructionString

        sourceRegister =
            if value == -10000 then
                Just <|
                    Tuple.first <|
                        Maybe.withDefault ( '-', "" ) <|
                            String.uncons <|
                                Maybe.withDefault "" <|
                                    List.head <|
                                        List.reverse <|
                                            String.split " " instructionString
            else
                Nothing
    in
    Instruction type_ register sourceRegister value


getPuzzleInput : String
getPuzzleInput =
    "set i 31\n    set a 1\n    mul p 17\n    jgz p p\n    mul a 2\n    add i -1\n    jgz i -2\n    add a -1\n    set i 127\n    set p 735\n    mul p 8505\n    mod p a\n    mul p 129749\n    add p 12345\n    mod p a\n    set b p\n    mod b 10000\n    snd b\n    add i -1\n    jgz i -9\n    jgz a 3\n    rcv b\n    jgz b -1\n    set f 0\n    set i 126\n    rcv a\n    rcv b\n    set p a\n    mul p -1\n    add p b\n    jgz p 4\n    snd a\n    set a b\n    jgz 1 3\n    snd b\n    set f 1\n    add i -1\n    jgz i -11\n    snd a\n    jgz f -16\n    jgz a -19"


getRegister : Char -> List Register -> Register
getRegister name registers =
    let
        updatedRegisters =
            List.drop 1 registers

        register =
            Maybe.withDefault nonValidRegister <|
                List.head registers
    in
    if register.name == name then
        register
    else if List.isEmpty registers then
        nonValidRegister
    else
        getRegister name updatedRegisters


executeSetInstruction : Int -> Char -> List Register -> List Register
executeSetInstruction newValue name registers =
    List.map
        (\register ->
            if register.name == name then
                { register | value = newValue }
            else
                register
        )
        registers


executeIncreaseInstruction : Int -> Char -> List Register -> List Register
executeIncreaseInstruction newValue name registers =
    List.map
        (\register ->
            if register.name == name then
                let
                    prevValue =
                        register.value
                in
                { register | value = prevValue + newValue }
            else
                register
        )
        registers


executeMultiplyInstruction : Int -> Char -> List Register -> List Register
executeMultiplyInstruction newValue name registers =
    List.map
        (\register ->
            if register.name == name then
                let
                    prevValue =
                        register.value
                in
                { register | value = prevValue * newValue }
            else
                register
        )
        registers


executeModulusInstruction : Int -> Char -> List Register -> List Register
executeModulusInstruction newValue name registers =
    if newValue == 0 then
        registers
    else
        List.map
            (\register ->
                if register.name == name then
                    let
                        prevValue =
                            register.value
                    in
                    { register | value = prevValue % newValue }
                else
                    register
            )
            registers


shouldRecoverSound : Int -> Char -> List Register -> Bool
shouldRecoverSound newValue name registers =
    List.foldl
        (\register r ->
            if register.name == name && register.value > 0 then
                True
            else
                r
        )
        False
        registers


executeJumpInstruction : Int -> Char -> List Register -> Int
executeJumpInstruction newValue name registers =
    List.foldl
        (\register r ->
            if register.name == name && register.value > 0 && newValue /= 0 then
                newValue
            else
                1
        )
        1
        registers


executeInstuctions : Int -> List Register -> Array Instruction -> Int -> Int
executeInstuctions index registers instructions soundPlayed =
    let
        instruction =
            Maybe.withDefault nonValidInstruction <|
                Array.get index instructions

        { type_, value, register, sourceRegister } =
            instruction

        targetValue =
            case sourceRegister of
                Just reg ->
                    .value <| getRegister reg registers

                Nothing ->
                    value

        ( updatedRegisters, updatedIndex, updatedSoundPlayed, didRecoverSound ) =
            case type_ of
                PlaySound ->
                    ( registers
                    , index + 1
                    , .value <| getRegister register registers
                    , False
                    )

                SetRegisterValue ->
                    ( executeSetInstruction targetValue register registers
                    , index + 1
                    , soundPlayed
                    , False
                    )

                AddToRegisterValue ->
                    ( executeIncreaseInstruction targetValue register registers
                    , index + 1
                    , soundPlayed
                    , False
                    )

                MultiplyRegisterValue ->
                    ( executeMultiplyInstruction targetValue register registers
                    , index + 1
                    , soundPlayed
                    , False
                    )

                Modulus ->
                    ( executeModulusInstruction targetValue register registers
                    , index + 1
                    , soundPlayed
                    , False
                    )

                RecoverSound ->
                    ( registers
                    , index + 1
                    , soundPlayed
                    , shouldRecoverSound targetValue register registers
                    )

                Jump ->
                    let
                        jumpBy =
                            executeJumpInstruction targetValue register registers
                    in
                    ( registers
                    , index + jumpBy
                    , soundPlayed
                    , False
                    )

                NoAction ->
                    ( registers
                    , index + 1
                    , soundPlayed
                    , True
                    )

        _ =
            Debug.log "soundPlayed" soundPlayed

        _ =
            Debug.log "updatedRegisters" updatedRegisters
    in
    if didRecoverSound then
        soundPlayed
    else
        executeInstuctions updatedIndex updatedRegisters instructions updatedSoundPlayed


getPuzzleAnswer : String
getPuzzleAnswer =
    let
        exampleInput =
            "set a 1\nadd a 2\nmul a a\nmod a 5\nsnd a\nset a 0\nrcv a\njgz a -1\nset a 1\njgz a -2"

        instructions =
            Array.fromList <|
                List.map (transformToInstruction << String.trim) <|
                    -- String.lines exampleInput
                    String.lines getPuzzleInput

        registers =
            getInitialRegisters

        _ =
            Debug.log "instructions Length" <| Array.length instructions

        _ =
            Debug.log "instructions" instructions

        _ =
            Debug.log "registers" registers
    in
    toString <| executeInstuctions 0 registers instructions 0


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    ""
