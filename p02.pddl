(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-2)
    (arm-free)

    ; Locationg <> Corridor Connections
    (location-con-cor c2122 loc-2-1)
    (location-con-cor c2122 loc-2-2)

    (location-con-cor c1222 loc-1-2)
    (location-con-cor c1222 loc-2-2)

    (location-con-cor c2232 loc-3-2)
    (location-con-cor c2232 loc-2-2)

    (location-con-cor c3242 loc-3-2)
    (location-con-cor c3242 loc-4-2)

    (location-con-cor c2223 loc-2-3)
    (location-con-cor c2223 loc-2-2)
    ; Key locations
    (key-at key1 loc-2-1)
    (key-at key2 loc-1-2)
    (key-at key3 loc-2-2)
    (key-at key4 loc-2-3)
    ; Locked corridors
    (lockCor c2122) 
    (lockCor c1222)
    (lockCor c2232)
    (lockCor c3242)
    (lockCor c2223)

    (lockCorCol c2122 purple)
    (lockCorCol c1222 yellow)
    (lockCorCol c2232 yellow)
    (lockCorCol c3242 rainbow)
    (lockCorCol c2223 green)
    ; Risky corridors
    ;NO RISKY CORRIDORS EXIST

    ; Key colours
    (keyCol key1 green)
    (keyCol key2 rainbow)
    (keyCol key3 purple)
    (keyCol key4 yellow)
    ; Key usage properties (one use, two use, etc)
    (oneUse key1)
    (oneUse key2)
    (oneUse key3)
    (twoUse key4)
  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-2)
    )
  )

)
