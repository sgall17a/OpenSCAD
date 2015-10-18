aa = [5,50]; //radius and length of battery
aaa =[3,35];
bat =aa;
g = 2;  // gap
r  =bat[0];
l = bat[1];
bw = r+r+g;

bn=4; //battery number
$fn=20;
//module onebattery(){

module halfBattery(){
    difference(){
        union(){
            translate([0,r+g+g,l/3])cylinder(r=r+g,h=l/6);  //round bit
            translate([-r-g/2,0,l/3])cube([r+r+g,g+g,l/6]);  //glue for round bit
            translate([-r,0,0])cube([r+r,g,l/2]); //long back bit
            rotate([4,0,0])translate([-r,0,0])cube([r+r,r+r+g,g]); //  contact pad
            translate([0,+g+g,l/5])rotate([90,0,0])cylinder(r= 3*r/4,h = g); //screw pad
            }
        translate([-r-r,r+g+g,l/4]) cube([r+r+r+r,r+r+r,l/2]); // open up round part
        translate([0,r+g+g,l/3-g]) cylinder(r=r,h=l/2); // open up actual battery
        translate([0,g*2,l/5])rotate([90,0,0])cylinder(r= 2,h = g*5); // drill screw
        translate([0,g,l/5])rotate([-90,0,0])cylinder(r1= 2, r2= 3,h = g+1); //drill screw countersick
        translate([0,r+ g,0])cylinder(r=0.5,10,center = true);
        }
}


module batteryPack() {
for (i=[0:bn-1])
    translate([bw * i,0,0]) 
        union(){
            halfBattery(); 
            translate([0,0,l])mirror([0,0,1]) halfBattery();
            }
        }

batteryPack();