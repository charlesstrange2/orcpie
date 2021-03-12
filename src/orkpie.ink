VAR too_long = true

-> InFrontOfTheDoor

=== InFrontOfTheDoor
You are standing outside a door.
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

There is a fierce, musclular green creature here who appears to be armed witha misshapen blade.
Between his boot is a wonderful, steaming fruit pie.

-> RoomChoices

=== RoomChoices
+ [what's behind me?] -> RoomTurnAround
* [the creature?] -> TheCreature
* [a pie?] -> ThePie
+ [run!] -> FleeRoom
+ [attack] -> AttackOrk


=== AttackOrk
{ too_long:
    ->ReadyOrc
else:
    ->SupriseOrc
}

=== ReadyOrc
Your battlecry enrages the creature - it appears to be prepared for your foolish and feeble strikes.

It cuts you down swiftly, making sure not to spill too much of your insides over the pie.

->fin

=== SupriseOrc
Your battlecry suprises the creature - it appears unprepared for your ferocius fists and goes down to a swift left hook!

The pie is yours to savour!

->fin

=== ThePie
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
It appears that your pursuer is an honourless cad, as he strinks you squarly in the spine with his weapon

You are dead. 
->fin

=== TheCreature
~ too_long = true
The creature is an exemplar of the genus `ORC ORCUS`.
They are generally regarded as fierce, green, muscluar, well armed (this one has a "choppa") and have a reputation for gleeful violence.

It's eyes narrow... It appears unamused.

-> RoomChoices

=== TheCorridor
You turn and face the corridor, it's long and dark

+ [turn back to the door] ->InFrontOfTheDoor
+ [walk down the corridor] ->DownTheCorridor

=== DownTheCorridor
You take a few steps into the darkness, your footsteps echoing until you come to a door.
->DoorChoices

=== fin
-> END