module Days.Day13 exposing (getPuzzleAnswer, getPuzzleAnswer2)


type MovingDirection
    = Downwards
    | Upwards


type alias Layer =
    { depth : Int
    , range : Int
    , scannerPosition : Int
    , movingDirection : MovingDirection
    }


getPuzzleInput : String
getPuzzleInput =
    -- "0: 3\n1: 2\n4: 4\n6: 4"
    "0: 3\n1: 2\n2: 5\n4: 4\n6: 6\n8: 4\n10: 8\n12: 8\n14: 6\n16: 8\n18: 6\n20: 6\n22: 8\n24: 12\n26: 12\n28: 8\n30: 12\n32: 12\n34: 8\n36: 10\n38: 9\n40: 12\n42: 10\n44: 12\n46: 14\n48: 14\n50: 12\n52: 14\n56: 12\n58: 12\n60: 14\n62: 14\n64: 12\n66: 14\n68: 14\n70: 14\n74: 24\n76: 14\n80: 18\n82: 14\n84: 14\n90: 14\n94: 17"


getFirewallLayers : List Layer
getFirewallLayers =
    let
        puzzleLines =
            String.lines getPuzzleInput

        depths =
            List.map
                (\d ->
                    Result.withDefault -1 <|
                        String.toInt <|
                            Maybe.withDefault "" <|
                                List.head <|
                                    String.split ": " d
                )
                puzzleLines

        ranges =
            List.map
                (\d ->
                    Result.withDefault -1 <|
                        String.toInt <|
                            Maybe.withDefault "" <|
                                List.head <|
                                    List.reverse <|
                                        String.split ": " d
                )
                puzzleLines
    in
    List.map2
        (\depth range ->
            Layer depth range 0 Downwards
        )
        depths
        ranges


moveScanners : List Layer -> List Layer
moveScanners firewallLayers =
    List.map
        (\layer ->
            let
                position =
                    layer.scannerPosition

                updatedDirection =
                    if position == (layer.range - 1) then
                        Upwards
                    else if position == 0 then
                        Downwards
                    else
                        layer.movingDirection

                updatedPosition =
                    case updatedDirection of
                        Upwards ->
                            position - 1

                        Downwards ->
                            position + 1
            in
            { layer | scannerPosition = updatedPosition, movingDirection = updatedDirection }
        )
        firewallLayers


getSeverityFromIndex : Int -> List Layer -> ( Int, Bool )
getSeverityFromIndex index firewallLayers =
    List.foldl
        (\layer r ->
            if layer.depth == index && layer.scannerPosition == 0 then
                ( layer.depth * layer.range, True )
            else
                r
        )
        ( 0, False )
        firewallLayers


runTripAndGetSeverity : Int -> List Layer -> Int -> Int
runTripAndGetSeverity index firewallLayers severity =
    let
        updatedIndex =
            index + 1

        isLayerWithScanner =
            List.any (\layer -> layer.depth == index) firewallLayers

        updatedSeverity =
            severity
                + (if isLayerWithScanner then
                    Tuple.first <|
                        getSeverityFromIndex index firewallLayers
                   else
                    0
                  )

        remainingFirewallLayers =
            if isLayerWithScanner then
                List.drop 1 firewallLayers
            else
                firewallLayers

        updatedFirewallLayers =
            moveScanners remainingFirewallLayers
    in
    if List.isEmpty firewallLayers then
        severity
    else
        runTripAndGetSeverity updatedIndex updatedFirewallLayers updatedSeverity



-- getPuzzleAnswer : String
-- getPuzzleAnswer =
--     let
--         firewallLayers =
--             getFirewallLayers
--
--         severity =
--             runTripAndGetSeverity 0 firewallLayers 0
--     in
--     toString severity
--
--
-- checkIfTripWithDelayIsSafe : Int -> List Layer -> Int -> Bool
-- checkIfTripWithDelayIsSafe index firewallLayers delayTicks =
--     let
--         ( updatedIndex, updatedDelayTicks ) =
--             if delayTicks > 0 then
--                 ( index, delayTicks - 1 )
--             else
--                 ( index + 1, delayTicks )
--
--         isLayerWithScanner =
--             List.any (\layer -> layer.depth == index) firewallLayers
--
--         isCaught =
--             if isLayerWithScanner then
--                 Tuple.second <|
--                     getSeverityFromIndex index firewallLayers
--             else
--                 False
--
--         remainingFirewallLayers =
--             if isLayerWithScanner then
--                 List.drop 1 firewallLayers
--             else
--                 firewallLayers
--
--         updatedFirewallLayers =
--             moveScanners remainingFirewallLayers
--
--         -- _ =
--         --     Debug.log "index" index
--         --
--         -- _ =
--         --     Debug.log "delayTicks" delayTicks
--         --
--         -- _ =
--         --     Debug.log "firewallLayers" firewallLayers
--         --
--         -- _ =
--         --     Debug.log "isCaught" isCaught
--     in
--     if isCaught then
--         False
--     else if List.isEmpty firewallLayers then
--         True
--     else
--         checkIfTripWithDelayIsSafe updatedIndex updatedFirewallLayers updatedDelayTicks


fastForwardScanners : List Layer -> Int -> List Layer
fastForwardScanners firewallLayers numberOfTicks =
    let
        updatedFirewallLayers =
            moveScanners firewallLayers
    in
    if numberOfTicks == 0 then
        firewallLayers
    else
        fastForwardScanners updatedFirewallLayers (numberOfTicks - 1)


runTripAndCheckIfCaught : Int -> List Layer -> Bool
runTripAndCheckIfCaught index firewallLayers =
    let
        updatedIndex =
            index + 1

        isLayerWithScanner =
            List.any (\layer -> layer.depth == index) firewallLayers

        isCaught =
            if isLayerWithScanner then
                Tuple.second <|
                    getSeverityFromIndex index firewallLayers
            else
                False

        remainingFirewallLayers =
            if isLayerWithScanner then
                List.drop 1 firewallLayers
            else
                firewallLayers

        updatedFirewallLayers =
            moveScanners remainingFirewallLayers
    in
    if isCaught then
        False
    else if List.isEmpty firewallLayers then
        True
    else
        runTripAndCheckIfCaught updatedIndex updatedFirewallLayers


runTripWithoutGettingCaught : List Layer -> Int -> Int
runTripWithoutGettingCaught firewallLayers delayTicks =
    let
        updatedDelayTicks =
            delayTicks + 1

        updatedFirewallLayers =
            fastForwardScanners firewallLayers delayTicks

        isSafeTrip =
            runTripAndCheckIfCaught 0 updatedFirewallLayers
    in
    if isSafeTrip then
        delayTicks
    else
        runTripWithoutGettingCaught firewallLayers updatedDelayTicks


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    let
        firewallLayers =
            getFirewallLayers

        delayNeeded =
            runTripWithoutGettingCaught firewallLayers 0
    in
    toString delayNeeded


getPuzzleAnswer : String
getPuzzleAnswer =
    "1960"
