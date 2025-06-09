abstract sig Object {}

sig Dir extends Object {
	entries : set Entry
}
sig File extends Object {}

one sig Root extends Dir {}

sig Name {}
sig Entry {
	name	: one Name,
	object	: one Object
}

sig Subfile in File {} 


fact RootHasNoParent {
  no e: Entry | e.object = Root
}


run example {}

run example2 {} for 4

run abc {} for 4 but 2 Entry, exactly 3 Name
