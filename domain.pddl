(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates

        ; One predicate given for free!
        (hero-at ?loc - location)

        ; IMPLEMENT ME
        ; hero arm is free
        (arm-free)

        ; hero move to location
        (hero-move-to ?loc - location)

        ;corridor between locations
        (corridor-at ?cor - corridor ?from ?to - location)

        ;location connected to corridor
        (loc-con-cor ?cor - corridor ?loc - location)
        
        ;key location
        (key-at ?key - key ?loc - location)

        ;locked corridor
        (lockCor ?cor - corridor)

        ;locked corridor colour
        (lockCorCol ?cor - corridor ?col - colour)

        ;risky corridor
        (riskyCor ?cor - corridor)

        ;key color
        (keyCol ?key - key ?col - colour)

        ;messy
        (messy-at ?loc - location)

        ;key tyepe
        (keyunlocks ?key - key ?cor - corridor)

        ;key oneUse
        (oneUse ?key - key)

        (twoUse ?key - key)

        (multiUse ?key - key)

        ;holding key
        (holding-key ?key - key)
    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - hero will move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky" (also causing a mess in the ?to location)
    (:action move

        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and

            (hero-at ?from)
            (hero-move-to ?to)
            (corridor-at ?cor ?from ?to)
            (not (lockCor ?cor))

        )

        :effect (and
            (hero-at ?to)
            (not (hero-at ?from))
            (not (hero-move-to ?to))
            (when (riskyCor ?cor)
                (not (corridor-at ?cor ?from ?to))
                (messy-at ?to))

        )
    )

    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;    - the location is not messy
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and

            (hero-at ?loc)
            (key-at ?key ?loc)
            (arm-free)
            (messy-at ?loc)
        )

        :effect (and

            (not (arm-free))
            (holding-key ?key)

        )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and

            (holding-key ?key)
            (hero-at ?loc)

        )

        :effect (and

            (not (holding-key ?key))
            (arm-free)

        )
    )


    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left,
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and
            (holding-key ?key)
            (or (oneUse ?key) (twoUse ?key) (multiUse ?key))
            (lockCor ?cor)
            (lockCorCol ?cor ?col)
            (keyCol ?key ?col)
            (hero-at ?loc)
            (loc-con-cor ?cor ?loc)
        )

        :effect (and
            (when (oneUse ?key)
                (not 
                    (oneUse ?key)))
            (when (twoUse ?key)
                (not 
                    (twoUse ?key)
                    (oneUse ?key)))
            (not (lockCor ?cor))
            
        )
    )

    ;Hero can clean a location if
    ;    - the hero is at location ?loc,
    ;    - the location is messy
    ;Effect will be that the location is no longer messy
    (:action clean

        :parameters (?loc - location)

        :precondition (and
            (hero-at ?loc)
            (messy-at ?loc)
        )

        :effect (and
            (not (messy-at ?loc))
        )
    )

)
