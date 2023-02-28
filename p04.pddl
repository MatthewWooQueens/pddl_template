(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-1-2 loc-1-3 loc-2-2 loc-3-1 loc-3-2 loc-4-2 loc-4-4 loc-5-2 loc-5-3 - location
    c1213 c1222 c1322 c2231 c2232 c3132 c3142 c3242 c4252 c4253 c5253 c5344 - corridor
    key1 key2 key3 key4 key5 key6 key7 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-2)
    (arm-free)
    ; Locationg <> Corridor Connections
    (location-con-cor c1213 loc-1-2)
    (location-con-cor c1213 loc-1-3)

    (location-con-cor c1222 loc-1-2)
    (location-con-cor c1222 loc-2-2)

    (location-con-cor c1322 loc-1-3)
    (location-con-cor c1322 loc-2-2)

    (location-con-cor c2231 loc-2-2)
    (location-con-cor c2231 loc-3-1)

    (location-con-cor c2232 loc-2-2)
    (location-con-cor c2232 loc-3-2)

    (location-con-cor c3132 loc-3-1)
    (location-con-cor c3132 loc-3-2)

    (location-con-cor c3142 loc-3-1)
    (location-con-cor c3142 loc-4-2)

    (location-con-cor c3242 loc-3-2)
    (location-con-cor c3242 loc-4-2)

    (location-con-cor c4252 loc-4-2)
    (location-con-cor c4252 loc-5-2)

    (location-con-cor c4253 loc-4-2)
    (location-con-cor c4253 loc-5-3)

    (location-con-cor c5253 loc-5-2)
    (location-con-cor c5253 loc-5-3)

    (location-con-cor c5344 loc-5-3)
    (location-con-cor c5344 loc-4-4)
    ; Key locations
    (key-at key1 loc-1-2)
    (key-at key2 loc-1-3)
    (key-at key3 loc-3-1)
    (key-at key4 loc-3-2)
    (key-at key5 loc-4-2)
    (key-at key6 loc-5-2)
    (key-at key7 loc-5-3)
    ; Locked corridors
    (lockCor c1213)
    (lockCor c1222)
    (lockCor c1322)
    (lockCor c2231)
    (lockCor c2232)
    (lockCor c3132)
    (lockCor c3142)
    (lockCor c3242)
    (lockCor c4253)
    (lockCor c5253)
    (lockCor c5344)

    (lockCorCol c1213 yellow)
    (lockCorCol c1222 green)
    (lockCorCol c1322 red)
    (lockCorCol c2231 yellow)
    (lockCorCol c2232 yellow)
    (lockCorCol c3132 purple)
    (lockCorCol c3142 purple)
    (lockCorCol c3242 green)
    (lockCorCol c4253 red)
    (lockCorCol c5253 red)
    (lockCorCol c5344 rainbow)
    ; Risky corridors
    (riskyCor c1322)
    (riskyCor c5253)
    (riskyCor c4253)
    ; Key colours
    (keyCol key1 yellow)
    (keyCol key2 red)
    (keyCol key3 purple)
    (keyCol key4 green)
    (keyCol key5 rainbow)
    (keyCol key6 purple)
    (keyCol key7 red)
    ; Key usage properties (one use, two use, etc)
    (twoUse key1)
    (multiUse key2)
    (oneUse key3)
    (oneUse key4)
    (oneUse key5)
    (oneUse key6)
    (multiUse key7)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-4)
    )
  )

)
