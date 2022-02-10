functor
import
	Porta at 'gates.ozf'
export
	fullSub:FullSub
	andOr:AndOr
	latchNand:LatchNand
	nonName:NonName

define
	
	proc {AndOr X Y Z ?C}
		C={Porta.andG X {Porta.orG Y Z}}
	end


   	proc {FullSub X Y Z ?C ?S}
		K L M
	in
		K={Porta.andG {Porta.notG X} Y}
		L={Porta.andG Y Z}
		M={Porta.andG {Porta.notG X} Z}
		C={Porta.orG K {Porta.orG L M}}
		S={Porta.xorG Z {Porta.xorG X Y}}
	end


	proc {LatchNand S R ?Q ?K}
		Q={Porta.nandG S {Porta.nandG S R}}
		K={Porta.nandG R {Porta.nandG S R}}
	end


	proc {NonName A B C ?X}
		K L M
	in
		K = {Porta.xorG A B}
		L = {Porta.andG {Porta.notG C} B}
		M = {Porta.notG A}
		X = {Porta.orG K {Porta.orG L M}}
	end
end
