w = 35/2;  //screw distance
rl=17.5; // rod length
t =2;
module screws(){
for (i=[[-w,-w],[w,-w],[w,w],[-w,w]]){
    translate(concat(i,5))
    cylinder(d=5,h=10,center=true);
}
}


module rod(){
translate([0,0,rl/2+4]){
%cylinder(d=6,h=rl,center=true,$fn=30); //rod
translate([0,0,rl/2])cylinder(d=8,h=3);  //magnet
translate([0,0,-rl/2-4])cylinder(d=4.8,h=4,$fn=20); //silicone plug
}
}

rod();

difference(){
union(){
cube([w+t+t,w+t+t,4],true);
 //translate([0,0,-8])sphere(r=w);
    translate([0,0,(rl+4)/2])cylinder(d=14,h=rl+4,center=true);
    translate([0,0,(rl+4)/2])cylinder(d=14,h=rl+4,center=true);
}

for(e=[0:90:359]){
    rotate([0,0,e])
        translate([w+w,0,0]*1.25)
            cube(4*w,center=true);
}
//translate([0,0,-w])cube(2*w,true);
}