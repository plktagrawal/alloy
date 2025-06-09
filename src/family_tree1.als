abstract sig Person {
//	, spouse: lone Person - this
//	, child: set Person - this
}

some sig Man extends Person{}
some sig Woman extends Person{}

sig Couple {
	husband: disj one Man,
	wife: disj one Woman,
	child: disj set Person	
}

fact marriage {
	//reciprocity
	all c: Couple | c.husband.wife = c.wife and c.wife.husband = c.husband

	//incest not allowed
	no p: Person | p.spouse in p.child //help me write this line better
}

fact ancestry {
	//can't be child of future generations
	no p: Person | p in p.^child
}
//
//fun ancestor[p: Person]: set Person {
//	^child.p
//}
//
//fun progeny[p: Person]: set Person {
//	p.^child
//}
//
//fact incest {
//	// cannot marry an ancestor
//	no p: Person | p.spouse in ancestor[p] | p.spouse in progeny[p]
//
//	//cannot father an ancestor
//	no p: Person | progeny[p] in ancestor[p]
//}
//
//pred a {
//	all p: Person | p.father = p.mother.spouse and p.mother = p.father.spouse
//}

run {} for 5
