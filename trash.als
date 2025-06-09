var sig File {}
var sig Trash in File {}

fact init {
  no Trash
}

pred empty {
  some Trash and       // guard
  after no Trash' and   // effect on Trash
  File' = File - Trash // effect on File
}

pred delete [f : File] {
  not (f in Trash)   // guard
  Trash' = Trash + f // effect on Trash
  File' = File       // frame condition on File
}

/* If nothing is specified about a particular mutable set or relation, 
then there will be no constraints restricting how that set or relation can evolve, 
meaning that it can change freely when the event occurs. 

If the intention was for that set or relation to remain unchanged when the event occurs, 
then an explicit formula stating that the value in the next state is the same as the present 
value must be added. Such “no change” effect conditions are usually called FRAME CONDITIONS.*/

pred restore [f : File] {
  f in Trash         // guard
  Trash' = Trash - f // effect on Trash
  File' = File       // frame condition on File
}

fact trans {
  always (empty or (some f : File | delete[f] or restore[f]))
}

run example {}