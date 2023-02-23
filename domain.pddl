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
        ;this predicate is going to be replaced with location-con-cor
        (corridor-at ?cor - corridor ?from ?to - location)

        ;location connected to corridor
        (location-con-cor ?cor - corridor ?loc - location)
        
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

        ;key has no uses
        (no-use-key ?key)
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
            (corridor-at ?cor ?from ?to)
            (location-con-cor ?cor ?from)
            (location-con-cor ?cor ?to)
            (not (lockCor ?cor))

        )

        :effect (and
            (hero-at ?to)
            (not (hero-at ?from))
            (not (hero-move-to ?to))
            (when (riskyCor ?cor) (and
                (not (corridor-at ?cor ?from ?to))
                (messy-at ?to)))

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
            (key-at ?k ?loc)
            (arm-free)
            (not (messy-at ?loc))
        )

        :effect (and

            (not (arm-free))
            (holding-key ?k)
            (not (key-at ?k ?loc))

        )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and

            (holding-key ?k)
            (hero-at ?loc)

        )

        :effect (and

            (not (holding-key ?k))
            (key-at ?k ?loc)
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
            (holding-key ?k)
            (not (no-use-key ?k))
            (lockCor ?cor)
            (lockCorCol ?cor ?col)
            (keyCol ?k ?col)
            (hero-at ?loc)
            (location-con-cor ?cor ?loc)
        )

        :effect (and
            (when (oneUse ?k) (and (not (oneUse ?k)) (no-use-key ?k)))
            (when (twoUse ?k) (and (not (twoUse ?k)) (oneUse ?k)))
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
