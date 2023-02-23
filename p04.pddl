(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-1-1 loc-1-2 loc-1-3 loc-1-4 loc-1-5 - location
    c1112 c1213 c1314 c1415 - corridor
    key1 key2 - key
  )

  (:init

    ; Hero location and carrying status

    ; Locationg <> Corridor Connections

    ; Key locations

    ; Locked corridors

    ; Risky corridors

    ; Key colours

    ; Key usage properties (one use, two use, etc)

    (hero-at loc-1-1)
    (corridor-at c1112 loc-1-1 loc-1-2)
    (corridor-at c1112 loc-1-2 loc-1-1)
    (corridor-at c1213 loc-1-3 loc-1-2)
    (corridor-at c1213 loc-1-2 loc-1-3)
    (corridor-at c1314 loc-1-3 loc-1-4)
    (corridor-at c1314 loc-1-4 loc-1-3)
    (corridor-at c1415 loc-1-5 loc-1-4)
    (corridor-at c1415 loc-1-4 loc-1-5)
    (location-con-cor c1112 loc-1-1)
    (location-con-cor c1112 loc-1-2)
    (location-con-cor c1213 loc-1-2)
    (location-con-cor c1213 loc-1-3)
    (location-con-cor c1314 loc-1-3)
    (location-con-cor c1314 loc-1-4)
    (location-con-cor c1415 loc-1-5)
    (location-con-cor c1415 loc-1-4)
    (key-at key1 loc-1-2)
    (key-at key2 loc-1-3)
    (keyCol key1 red)
    (keyCol key2 green)
    (twoUse key1)
    (oneUse key2)
    (lockCor c1213)
    (lockCor c1314)
    (lockCor c1415)
    (lockCorCol c1213 red)
    (lockCorCol c1314 red)
    (lockCorCol c1415 green)
    (arm-free)
  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-1-5)
    )
  )

)
