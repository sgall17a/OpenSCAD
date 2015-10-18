//The side of Kossel mini is (say) 300mm.  What would our reference length be?
function kosselSide2Ref(side) = side / (2 * sqrt(3));

echo (kosselSide2Ref(300));

function workDiam2ref(ref) = 2*ref/sqrt(3);

function ref2WorkDiam(ref) = sqrt(3) * ref /2; 

echo (workDiam2ref(200));

function ref2mdf(ref,gap=40,clear=20) =  [ref2WorkDiam(ref+gap+clear),2*(ref+gap+clear)];

echo (ref2mdf(208));

function armLength(ref,offset) = (workDiam2ref(ref)-offset) / cos(20);

echo("arm length", armLength(208,20));

echo(acos(1/3)); 