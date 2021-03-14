VAR orcAwareness = 0
LIST creatureName = (creature), orc

LIST playerAwareness = (asleep), liminal, lucid, trancendant

-> InFrontOfTheDoor

=== InFrontOfTheDoor
You find yourself are standing in front of a door.

->DoorChoices

=== DoorChoices
+ [a door?] ->DescribeDoor
+ [what's behind me?] ->TheCorridor

=== DescribeDoor
The door is old, gnarled wood, banded in rusted iron. 

It appears to be unlocked.

+ [open it.] ->EnterTheRoom
+ [what's behind me?] ->TheCorridor


=== EnterTheRoom
The door swings open.

The room is 10ftx10ft and dimly lit.

There is a fierce, muscular green {creatureName} here who appears to be armed with a misshapen blade.
Between his boots is a wonderful, steaming fruit pie.

-> RoomChoices

=== RoomChoices
+ [what's behind me?] -> RoomTurnAround
* [the creature?] -> TheCreature
* [a pie?] -> ThePie
+ [run!] -> FleeRoom
+ [attack!] -> AttackOrk


=== AttackOrk
{ orcAwareness > 1:
    ->ReadyOrc
- else:
    ->SupriseOrc
}

=== ReadyOrc
Your battlecry enrages the {creatureName} - it appears to be prepared for your foolish and feeble strikes.

It cuts you down swiftly, making sure not to spill too much of your insides over the pie.

->fin

=== SupriseOrc
Your battlecry suprises the {creatureName} - it appears unprepared for your ferocius fists and goes down to a swift left hook!

The pie is yours to savour!

->fin

=== ThePie
~ orcAwareness++
The pie is clearly a work of culinary art.
It's about 1' in diameter, puffed crust beutifully glazed and cracked and you can smell blueberries.

->RoomChoices

=== FleeRoom
You turn and flee the room!

->OrcChase

=== RoomTurnAround
You turn to examine the corridor. 

->OrcChase

=== OrcChase
Alas, as you do so, you hear a roar from behind you.

It appears that your pursuer is an honourless cad, as the {creatureName} strikes you squarly in the spine with his blade, 

You are dead. 

->fin

=== TheCreature
~ orcAwareness++ 
~ creatureName++
The creature is an exemplar of the genus `ORC ORCUS`.
They are generally regarded as fierce, green, muscluar, well armed (this one has a "choppa") and have a reputation for gleeful violence.

It's beady red eyes narrow... It appears unamused.

-> RoomChoices

=== TheCorridor
You turn and face the corridor, it's long and dark

+ [turn back to the door] ->InFrontOfTheDoor
+ [walk down the corridor] ->DownTheCorridor

=== DownTheCorridor
You take a few steps into the darkness, your footsteps echoing down the passageway, in time until you come to a door blocking your passage.

->DoorChoices

=== fin
For you the tale has ended.

{ playerAwareness > asleep:
    + [or has it?] -> LetsGoAgain
- else :
    -> END
}

=== LetsGoAgain
~ creatureName = creature
~ orcAwareness = 0
~ playerAwareness++

... there is a ushing sense of velocity and then ...
-> InFrontOfTheDoor


