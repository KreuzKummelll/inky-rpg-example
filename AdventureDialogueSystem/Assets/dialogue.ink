INCLUDE Functions
INCLUDE Locations
INCLUDE Global_Vars






// MARK: -
=== littleThursdayBoy ===
-   (top)
    <- interact(-> top)
    <- trip(-> top)
    <- getBerated(-> top)
    <- explainAeryc(-> top)
= interact(-> goback)
    {  
        -mineChopo.serveHotChocolate:
            You did what?! HOT CHOCOLATE!?!!
            -> getBerated(-> top)
    }
    {
      -ltb_location == chopo_location:
        <- explainAeryc(-> top)
    }
    Hey, my fucker.
    -> goback
= trip(-> goback)
    Fuck! You broke my toe.
    [You just tripped the only blue boy on the planet. Do you even know what's coming now?]
    -> goback
= getBerated(-> goback)
    You've got bugs on windshields for brains, chump.
    -> goback
= explainAeryc(-> goback)
    LTB: Have you ever heard of Angels?
       * Eerhmmm...yeeeass. Why?
            LTB: Alright what do they look like?
                ** Like...I'm sure——ummm, like in paintings?
                    
                    No. not really. 
                    <- disappointment(-> top)
                    
                    -> top
                
                **  Alients!
                    LTB: Are you trying to be disrespectful to BLUE BOY?!
                    <- mineChopo.advice(-> top)
                    
                    -> top
                    
    -> top
= disappointment(-> goback)
    ~   ltbDisapointment++
    {I've only just met you, but you disappoint me.|From an alient's perspective, you are saddening.|}
    -> goback
    
// MARK: -
=== mineChopo ===
= advice(-> to_forward)
    {    -player_location == ltb_location:
        {   
        -ltbDisapointment > 0:
            Chopo: You've got him right where you want him!
        -ltbDisapointment > 2 && browniePoints > 2:
            Chopo: I'd like to hire you. Can we talk? 
                * Sure
                    Chopo: This way...  -> introToTribe
                * No, actually.
                    ~ browniePoints--
                    Chopo: Alright. BLESSOFF!
                    -> blessOff(-> player.idle)
        }
        
    }
    -   ->->

= blessOff(-> goforward) 
    LEBLESSOFF!
    ~blessOffs++
-> goforward

= interact 
    { 
        -littleThursdayBoy.trip:
        Why didn't you give him a hot chocolate too? He's no different than me. 
            * i'm ... i... don't -> getInterrupted
    }
    Hi there. It's a blessed day.
        *Yes, it is -> taskTripLTB
        *No, it's not. -> getInterrupted
        *Here is some hot chocolate -> serveHotChocolate
        
= introToTribe
    {  
        -browniePoints > 2:
            Welcome to the Tribe, Ambassador
        - ltbDisapointment > browniePoints:
            That's how you get killed
        - else:
            Something else
    }
    -> DONE
        
= serveHotChocolate
    Thank you. 
    { littleThursdayBoy.trip:
         I am mightily impressed by your efforts, friend. Who are you?
        -> increaseBrowniePoints -> player.idle
    }
    
= increaseBrowniePoints
    {&mhmmmm|gosh|a brownie!|you said|'gluten free'?}
    ~browniePoints++
    -   ->->

= decreaseBrowniePoints
    {&ohhh sry|my bad|fudge|pardon me|shit|you'll have to pardon me}
    ~browniePoints--
    -   ->->
    
= taskTripLTB
    { not littleThursdayBoy.trip:
        I have a task for you. Go find Little Thursday Boy ...
        and trip him.
        -> player.idle
    - else:
        You've got real tallent. Would you like to help our friend get out of a hole? 
        * Ehhh, no. -> denyChopo
        * Sure, I guess. [Immediately serve him hot chocolate] -> serveHotChocolate
    }
= denyChopo 
    Thou hast denied mine?! 
    { browniePoints > 0 :
        Alright, no worries. You've got some brownie points.
        -> player.idle
    }
    
= taskPullOnDicke
    *Like how?
        That's it 
        
        -> player.idle
    
= getInterrupted
   I'm sorry to cut you off, but I have to.
   -> player.idle

= 



// MARK: - DICKE SPARGEL
=== dickeSpargel ===
= interact 
    { littleThursdayBoy.getBerated:
        I thought i raised him better. 
    }
    -> DONE
    
    
=== player ===
= idle
    You know...
    -> DONE
= happy
    It's a fine day and there is plent to do and I'll have a joyous time doing it
    ->  DONE