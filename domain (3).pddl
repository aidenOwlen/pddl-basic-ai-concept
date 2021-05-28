

(define (domain domainn)
 (:requirements :typing :equality :conditional-effects :fluents) 

    (:types
        Personnel
        spaceRegions
        SpaceCraft
        Section
        Engineer
        Planet
        objects
    )
   
       
    (:predicates
    
        (planet_has_touchdown_location ?s)
        (Planet ?pp)
        (encountred-nebula ?nebula)
        (Personnel ?p)
        (Section ?s)
        (Engineer ?k)
        (at-section ?place ?person)
        (at-location ?location ?spacecraft)
        (section1-near-section2 ?sec1 ?sec2)
        (Non-damaged ?object)
        (Travel ?Spacecraft)
        (Nav-recv-order ?navigator)
        (probes-to ?n)
        (collectPlasma ?ppp)
        (retrieve-probes ?n)
        (analysis-collected-plasma ?n)  
        (land-in-planet ?planet)
        (planet-scaned ?probe)
        (can-safely-land ?lander)
        (ship-crash ?planet)
        
    )



    (:action move
        :parameters 
            (?from - Section ?to - Section ?person)
        :precondition
        (and 
     
        (not (= ?from ?to))
        (Personnel ?person)
        (at-section ?from ?person) 
        (section1-near-section2 ?from ?to)
        
        )
        
		:effect
            (and
                (at-section ?to ?person)
                (not (at-section ?from ?person))
            )
    )
   
    (:action Repair-Ship-performing-EVA
        :parameters
        (?engineer1 ?engineer2)
        :precondition
        ( and
        (Engineer ?engineer1)
        (Engineer ?engineer2)
        (at-section MAVsection ?engineer1)
        (at-section engineering ?engineer2)
    )
        :effect
        (Non-damaged spacecraft)
)

    (:action Give-Order-To-Navigator
    :precondition 
    ( and 
    (Non-damaged spacecraft)
    (at-section bridge navigator)
    (at-section bridge captain)
    )
    :effect (Nav-recv-order navigator)
    
    
    )

    (:action Travel
    :precondition
    ( and
    (Nav-recv-order navigator)
    )
    :effect
    (and
    (Travel spacecraft)
    ( not (at-location earth spacecraft)))
)
    
 (:action deploy-probe-nebula
 :parameters
 (?eng)
 :precondition
 (and
 (not (at-location earth spacecraft))
 (Non-damaged spacecraft)
 (Engineer ?eng)
 (at-section launchBay ?eng)
 (at-section launchBay science-officer)
 )
 :effect
 (and
 (probes-to nebula)
 (retrieve-probes nebula)
 
 )
 )
 
 (:action study-collected-plasma

 :precondition
 (and 
 (retrieve-probes nebula)
 (at-section scienceLab science-officer)
 )
 :effect
 (analysis-collected-plasma nebula)
)
(:action ScanPlanet
:parameters(?planet ?eng)
:precondition
(and
(not (at-location earth spacecraft))
(Planet ?planet)
(Engineer ?eng)
(Non-damaged spacecraft)
(Non-damaged probe)
(Non-damaged lander)

(at-section launchBay ?eng)
)
:effect 

 (and (when (not (planet_has_touchdown_location ?planet)) (not(can-safely-land ?planet))) (when (planet_has_touchdown_location ?planet) (can-safely-land ?planet) )
 (planet-scaned ?planet))

)
(:action landInPlanet
:parameters(?planet ?eng)

:precondition
(and
(not (at-location earth spacecraft))
(Planet ?planet) (Engineer ?eng)
(Non-damaged spacecraft)
(Non-damaged probe)
(Non-damaged lander)
(at-section launchBay ?eng)
(planet-scaned ?planet)
(can-safely-land ?planet)

)
:effect
(and
(land-in-planet ?planet)
)
)
)









