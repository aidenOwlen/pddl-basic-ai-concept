
(define (problem problemm)
    (:domain domainn)

    (:objects
        captain navigator engineer1 engineer2 science-officer - Personnel
        Engineer
        Planet
        Probe lander - objects
        earth mercury venus saturn mars empty nebula asteroid belt - SpaceRegions
        scienceLab launchBay engineering bridge MAVsection - Section
        spacecraft - SpaceCraft
        
    )

    (:init
        (Personnel captain) (Personnel navigator) (Personnel engineer1) (Personnel science-officer)
        (Engineer engineer1) (Engineer engineer2)
        (Personnel engineer2)
        (Planet earth) (Planet mercury) (Planet venus) (Planet saturn) (Planet mars)
        (Section launchBay) (Section MAVsection) (Section scienceLab) (Section engineering) (Section bridge)
        (at-section engineering captain)
        (at-section launchBay navigator)
        (at-section launchBay science-officer)
        (at-section scienceLab engineer1)
        (at-section scienceLab engineer2)
        (at-location earth spacecraft)
        (section1-near-section2 engineering scienceLab)
        (section1-near-section2 engineering MAVsection)
        (section1-near-section2 MAVsection engineering)
        (section1-near-section2 MAVsection launchBay)
        (section1-near-section2 launchBay MAVsection)
        (section1-near-section2 launchBay bridge)
        (section1-near-section2 bridge launchBay)
        (section1-near-section2 scienceLab engineering)
        (planet_has_touchdown_location earth)
        (planet_has_touchdown_location mars)
        (Non-damaged probe)
        (Non-damaged lander)
        
        
        
    )


    (:goal
        (and
        
        (planet-scaned mercury)
        
        
            
                        
        )
    )
)

