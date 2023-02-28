(define (problem p3-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-4 loc-4-5 loc-1-2 loc-2-2 loc-3-2 loc-3-3 loc-2-5 loc-1-3 loc-2-1 loc-1-4 loc-3-5 loc-2-4 loc-4-4 loc-2-3 loc-4-3 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-1)
    (arm-free)

    ; Locationg <> Corridor Connections
    (location-con-cor c2122 loc-2-1)
    (location-con-cor c2122 loc-2-2)

    (location-con-cor c1222 loc-1-2)
    (location-con-cor c1222 loc-2-2)

    (location-con-cor c2232 loc-3-2)
    (location-con-cor c2232 loc-2-2)

    (location-con-cor c1213 loc-1-2)
    (location-con-cor c1213 loc-1-3)

    (location-con-cor c1223 loc-1-2)
    (location-con-cor c1223 loc-2-3)

    (location-con-cor c2223 loc-2-2)
    (location-con-cor c2223 loc-2-3)

    (location-con-cor c3223 loc-3-2)
    (location-con-cor c3223 loc-2-3)

    (location-con-cor c3233 loc-3-2)
    (location-con-cor c3233 loc-3-3)

    (location-con-cor c1323 loc-1-3)
    (location-con-cor c1323 loc-2-3)

    (location-con-cor c2333 loc-2-3)
    (location-con-cor c2333 loc-3-3)

    (location-con-cor c1314 loc-1-3)
    (location-con-cor c1314 loc-1-4)

    (location-con-cor c2314 loc-2-3)
    (location-con-cor c2314 loc-1-4)

    (location-con-cor c2324 loc-2-3)
    (location-con-cor c2324 loc-2-4)

    (location-con-cor c2334 loc-2-3)
    (location-con-cor c2334 loc-3-4)

    (location-con-cor c3334 loc-3-3)
    (location-con-cor c3334 loc-3-4)

    (location-con-cor c1424 loc-1-4)
    (location-con-cor c1424 loc-2-4)

    (location-con-cor c2434 loc-2-4)
    (location-con-cor c2434 loc-3-4)
    
    (location-con-cor c2425 loc-2-4)
    (location-con-cor c2425 loc-2-5)

    (location-con-cor c2535 loc-2-5)
    (location-con-cor c2535 loc-3-5)

    (location-con-cor c3545 loc-3-5)
    (location-con-cor c3545 loc-4-5)
    
    (location-con-cor c4544 loc-4-5)
    (location-con-cor c4544 loc-4-4)

    (location-con-cor c4443 loc-4-4)
    (location-con-cor c4443 loc-4-3)

    ; Key locations
    (key-at key1 loc-2-1)
    (key-at key2 loc-2-3)
    (key-at key3 loc-2-3)
    (key-at key4 loc-2-3)
    (key-at key5 loc-2-3)
    (key-at key6 loc-4-4)

    ; Locked corridors
    (lockCor c1223)
    (lockCor c2223)
    (lockCor c3223)
    (lockCor c1323)
    (lockCor c2333)
    (lockCor c2314)
    (lockCor c2324)
    (lockCor c2334)
    (lockCor c2425)
    (lockCor c2535)
    (lockCor c3545)
    (lockCor c4544)
    (lockCor c4443)

    (lockCorCol c1223 red)
    (lockCorCol c2223 red)
    (lockCorCol c3223 red)
    (lockCorCol c1323 red)
    (lockCorCol c2333 red)
    (lockCorCol c2314 red)
    (lockCorCol c2324 red)
    (lockCorCol c2334 red)
    (lockCorCol c2425 purple)
    (lockCorCol c2535 green)
    (lockCorCol c3545 purple)
    (lockCorCol c4544 green)
    (lockCorCol c4443 rainbow)

    ; Risky corridors
    (riskyCor c1223)
    (riskyCor c2223)
    (riskyCor c3223)
    (riskyCor c1323)
    (riskyCor c2333)
    (riskyCor c2314)
    (riskyCor c2324)
    (riskyCor c2334)

    ; Key colours
    (keyCol key1 red)
    (keyCol key2 green)
    (keyCol key3 green)
    (keyCol key4 purple)
    (keyCol key5 purple)
    (keyCol key6 rainbow)

    ; Key usage properties (one use, two use, etc)
    (multiUse key1)
    (oneUse key2)
    (oneUse key3)
    (oneUse key4)
    (oneUse key5)
    (oneUse key6)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-3)
    )
  )

)
