module Days.Day15 exposing (getPuzzleAnswer, getPuzzleAnswer2)

import Array exposing (..)
import Common exposing (..)


getPuzzleInput : ( Int, Int )
getPuzzleInput =
    ( 699, 124 )


getCommonProduct : Int
getCommonProduct =
    2147483647


getGeneratorFactorA : Int
getGeneratorFactorA =
    16807


getGeneratorFactorB : Int
getGeneratorFactorB =
    48271



{--
    --Gen. A--  --Gen. B--
    1092455     430625591
    1181022009  1233683848
    245556042   1431495498
    1744312007  137874439
    1352636452  285222916
--}


updateBinaryResults : Int -> Array String -> Array String
updateBinaryResults newValue results =
    Array.push (String.slice 0 16 <| String.reverse <| convertToBinary "" newValue) results



-- getUpdatedValues : Int -> ( Int, Int ) -> ( Array String, Array String ) -> ( Int, ( Int, Int ), ( Array String, Array String ) )


getUpdatedValues index ( prevA, prevB ) ( prevResultsA, prevResultsB ) =
    let
        factorA =
            16807

        factorB =
            48271

        updatedIndex =
            index + 1

        ( productA, productB ) =
            ( prevA * factorA
            , prevB * factorB
            )

        ( updatedA, updatedB ) =
            ( rem productA getCommonProduct
            , rem productB getCommonProduct
            )

        updatedResults =
            -- ( updateBinaryResults updatedA prevResultsA
            -- , updateBinaryResults updatedB prevResultsB
            -- )
            ( Array.push updatedA prevResultsA
            , Array.push updatedB prevResultsB
            )

        -- Array.push updatedValue results
    in
    ( updatedIndex, ( updatedA, updatedB ), updatedResults )



-- getGeneratorValues : Int -> ( Int, Int ) -> ( Array String, Array String ) -> ( Array String, Array String )


getGeneratorValues index ( prevA, prevB ) results =
    let
        -- updatedIndex =
        -- index + 1
        -- generatorProduct =
        -- previousValue * factor
        -- updatedValue =
        -- rem generatorProduct getCommonProduct
        -- updatedResults =
        -- Array.push (convertToBinary "" updatedValue) results
        -- updateBinaryResults updatedValue results
        ( updatedIndex, ( updatedA, updatedB ), ( resultsA, resultsB ) ) =
            getUpdatedValues index ( prevA, prevB ) results
    in
    if index == 40000000 then
        results
    else
        getGeneratorValues updatedIndex ( updatedA, updatedB ) ( resultsA, resultsB )


countCorrectPairs : Array String -> Array String -> Int
countCorrectPairs outputA outputB =
    -- List.length <|
    --     List.filter identity <|
    --         List.map2
    --             (\a b ->
    --                 let
    --                     lsbA =
    --                         String.slice 0 16 <|
    --                             String.reverse a
    --
    --                     lsbB =
    --                         String.slice 0 16 <|
    --                             String.reverse b
    --                 in
    --                 if lsbA == lsbB then
    --                     True
    --                 else
    --                     False
    --             )
    --             -- (Array.toList exampleGeneratorAValues)
    --             -- (Array.toList exampleGeneratorBValues)
    --             (Array.toList outputA)
    --             (Array.toList outputB)
    List.length <|
        List.filter identity <|
            List.map2
                (\a b ->
                    a == b
                )
                (Array.toList outputA)
                (Array.toList outputB)



-- getPuzzleAnswer : String
-- getPuzzleAnswer =
--     let
--         ( startA, startB ) =
--             getPuzzleInput
--
--         ( resultsA, resultsB ) =
--             -- Array.map (convertToBinary "") <|
--             getGeneratorValues 0 ( startA, startB ) ( Array.fromList [], Array.fromList [] )
--
--         -- ( [], [] )
--         -- generatorBValues =
--         -- Array.map (convertToBinary "") <|
--         -- getGeneratorValues 0 generatorBFactor startingValueB (Array.fromList [])
--         -- Array.foldl
--         --     (\_ r ->
--         --         getGeneratorValues 4000 generatorBFactor startingValueB r
--         --     )
--         --     (Array.fromList [])
--         --     (Array.repeat 0 10000)
--         -- exampleGeneratorAValues =
--         --     Array.map (convertToBinary "") <|
--         --         getGeneratorValues 5 generatorAFactor 65 (Array.fromList [])
--         --
--         -- exampleGeneratorBValues =
--         --     Array.map (convertToBinary "") <|
--         --         getGeneratorValues 5 generatorBFactor 8921 (Array.fromList [])
--         -- correctPairs =
--         --     List.length <|
--         --         List.filter identity <|
--         --             List.map2
--         --                 (\a b ->
--         --                     let
--         --                         lsbA =
--         --                             String.slice 0 16 <|
--         --                                 String.reverse a
--         --
--         --                         lsbB =
--         --                             String.slice 0 16 <|
--         --                                 String.reverse b
--         --                     in
--         --                     if lsbA == lsbB then
--         --                         True
--         --                     else
--         --                         False
--         --                 )
--         --                 -- (Array.toList exampleGeneratorAValues)
--         --                 -- (Array.toList exampleGeneratorBValues)
--         --                 (Array.toList generatorAValues)
--         --                 (Array.toList generatorBValues)
--         correctPairs =
--             -- countCorrectPairs generatorAValues generatorBValues
--             -- countCorrectPairs resultsA resultsB
--             0
--
--         _ =
--             Debug.log "resultsA" <| resultsA
--     in
--     -- toString exampleGeneratorAValues ++ " /////////// " ++ toString exampleGeneratorBValues
--     -- toString <| Array.length generatorAValues
--     toString correctPairs


getPuzzleAnswer : String
getPuzzleAnswer =
    ""


getPuzzleAnswer2 : String
getPuzzleAnswer2 =
    ""
