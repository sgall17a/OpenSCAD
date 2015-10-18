
module fred(){
difference(){
cube([50,20,10]);
translate([5,5,-1])cube([12,12,50]);
translate([22,5,-1])cube([12,12,50]);
}
}


cylinder(d=8,h=40,center=true);
for (i=[-1,1]){
translate([0,i*6,0])rotate([0,90,0])cylinder(d=3,h=50,center=true);
}
translate([-4-1.5,0,])cube([3,20,10],center=true);
translate([4+1.5,0,])cube([3,20,10],center=true);