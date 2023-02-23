(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 loc-3-3 loc-2-4 loc-3-4 loc-4-4 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-2)
    ; Locationg <> Corridor Connections
    (corridor-at c3132 loc-3-1 loc-3-2)
    (corridor-at c3132 loc-3-2 loc-3-1)
    (corridor-at c1222 loc-1-2 loc-2-2)
    (corridor-at c1222 loc-2-2 loc-1-2)
    (corridor-at c2232 loc-2-2 loc-3-2)
    (corridor-at c2232 loc-3-2 loc-2-2)
    (corridor-at c3242 loc-3-2 loc-4-2)
    (corridor-at c3242 loc-4-2 loc-3-2)
    (corridor-at c2223 loc-2-2 loc-2-3)
    (corridor-at c2223 loc-2-3 loc-2-2)
    (corridor-at c3233 loc-3-2 loc-3-3)
    (corridor-at c3233 loc-3-3 loc-3-2)
    (corridor-at c2333 loc-2-3 loc-3-3)
    (corridor-at c2333 loc-3-3 loc-2-3)
    (corridor-at c2324 loc-2-3 loc-2-4)
    (corridor-at c2324 loc-2-4 loc-2-3)
    (corridor-at c3334 loc-3-3 loc-3-4)
    (corridor-at c3334 loc-3-4 loc-3-3)
    (corridor-at c2434 loc-2-4 loc-3-4)
    (corridor-at c2434 loc-3-4 loc-2-4)
    (corridor-at c3444 loc-3-4 loc-4-4)
    (corridor-at c3444 loc-4-4 loc-3-4)
    ;location connected to corridor
    (location-con-cor c3132 loc-3-1)
    (location-con-cor c3132 loc-3-2)
    (location-con-cor c1222 loc-1-2)
    (location-con-cor c1222 loc-2-2)
    (location-con-cor c2232 loc-2-2)
    (location-con-cor c2232 loc-3-2)
    (location-con-cor c3242 loc-3-2)
    (location-con-cor c3242 loc-4-2)
    (location-con-cor c2223 loc-2-2)
    (location-con-cor c2223 loc-2-3)
    (location-con-cor c3233 loc-3-2)
    (location-con-cor c3233 loc-3-3)
    (location-con-cor c2333 loc-2-3)
    (location-con-cor c2333 loc-3-3)
    (location-con-cor c2324 loc-2-3)
    (location-con-cor c2324 loc-2-4)
    (location-con-cor c3334 loc-3-3)
    (location-con-cor c3334 loc-3-4)
    (location-con-cor c2434 loc-2-4)
    (location-con-cor c2434 loc-3-4)
    (location-con-cor c3444 loc-4-4)
    (location-con-cor c3444 loc-3-4)
    ; Key locations
    (key-at key1 loc-2-2)
    (key-at key2 loc-2-4)
    (key-at key3 loc-4-2)
    (key-at key4 loc-4-4)
    ; Locked corridors
    (lockCor c2324)
    (lockCor c2434)
    (lockCor c3444)
    (lockCor c3132)
    (lockCor c3242)
    ; lock colour
    (lockCorCol c2324 red)
    (lockCorCol c2434 red)
    (lockCorCol c3444 yellow)
    (lockCorCol c3132 rainbow)
    (lockCorCol c3242 purple)
    ; Risky corridors
    (riskyCor c2324)
    (riskyCor c2434)
    ; Key colours
    (keyCol key1 red)
    (keyCol key2 yellow)
    (keyCol key3 rainbow)
    (keyCol key4 purple)
    
    ; Key usage properties (one use, two use, etc)
    (oneUse key1)
    (twoUse key2)
    (multiUse key3)
    (oneUse key4)
    ;hero arm is free at start
    (arm-free)
  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-3-1)
    )
  )

)
