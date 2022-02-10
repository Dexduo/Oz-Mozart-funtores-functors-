functor
export 
   notG:NotGate
   andG:AndG
   orG:OrG
   nandG:NandG
   norG:NorG
   xorG:XorG

define
   fun {GateMaker F}
      fun {$ Xs Ys}
         fun {GateLoop Xs Ys}
            case Xs#Ys 
            of (X|Xr)#(Y|Yr) then
               {F X Y}|{GateLoop Xr Yr}
            else nil
            end
         end
      in
         thread {GateLoop Xs Ys} end
      end
   end


   fun {NotGate Xs}
        fun {NotLoop Xs}
            case Xs of X|Xr then (1-X)|{NotLoop Xr} end
        end
   in
        thread {NotLoop Xs} end
   end


   AndG = {GateMaker fun {$ Xs Ys} Xs * Ys end}
   OrG = {GateMaker fun {$ Xs Ys} Xs + Ys - Xs * Ys end}
   NandG = {GateMaker fun {$ Xs Ys} 1 - Xs * Ys end}
   NorG = {GateMaker fun {$ Xs Ys} 1 - Xs + Ys - Xs * Ys end}
   XorG = {GateMaker fun {$ Xs Ys} Xs + Ys - 2 * Xs * Ys end}

end
