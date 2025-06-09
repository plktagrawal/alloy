abstract sig Person {
	, father: lone Man - this
	, mother: lone Woman - this
	, spouse: lone Person - this
}

some sig Man extends Person{}
some sig Woman extends Person{}

fact heterosexuality {
	no w: Woman | w.spouse in Woman
	no m: Man | m.spouse in Man
}

fact mariage_reciprocity {
	all p: Person | p.spouse.spouse = p
}

fun ancestor[p: Person]: set Person {
	p.^(father + mother)
}

fun progeny[p: Person]: set Person {
	^(father + mother).p
}
//
//fact no_incest {
//	// cannot marry an ancestor
//	no p: Person | p.spouse in ancestor[p]
//
//	//cannot father an ancestor
//	no p: Person | progeny[p] in ancestor[p]
//}

//pred a {
//	all p: Person | p.father = p.mother.spouse and p.mother = p.father.spouse
//}

run {} for 5
