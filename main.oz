declare [Circuito] = {Module.link ['circuito.ozf']}
% declare [Portas] = {Module.link ['gates.ozf']}

declare A=1|_
declare B=0|_
declare C=1|_
declare K
{Browse 'Teste'}
{Circuito.andOr A B C K}
{Browse K}

declare A=1|0|1|1|_
declare B=1|0|0|1|_
declare C=1|1|0|1|_
declare T W
{Browse 'Subtracao'}
{Circuito.fullSub A B C T W}
{Browse T}

declare A=1|_
declare B=1|_
declare Q K
{Browse 'Latch Test'}
{Circuito.latchNand A B Q K}
{Browse Q}
{Browse K}

declare A=1|0|1|1|_
declare B=1|0|0|1|_
declare C=1|1|0|1|_
declare X
{Browse 'Forgotten Name'}
{Circuito.nonName A B C X}
{Browse X}