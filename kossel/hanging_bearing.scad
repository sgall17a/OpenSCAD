d2=22;
d1=8;
w=7;
t=1.5;
$fn=30;

module bearing(){
difference(){
cylinder(d=d2,h=w,center=true);
cylinder(d=d1,h=w+w,center=true);
}
}

//bearing();

module flange(){

    translate([0,0,-w/2-t-.5])
    difference(){
    union(){
    cylinder(d=d2+6,h=t);
    cylinder(d=d1-0.2,h=w+t);
    translate([0,0,t])cylinder(d=d1+3,h=0.5);
    }
    cylinder(d=d1-2-.5,h=w+w+w+w,center=true);
    //translate([0,0,w/2+t+.5])rotate([90,0,0])cylinder(d=5,h=w+w+w,center=true);
    }
}

module flange2(){
    translate([0,0,w/2+.5])
    difference(){
    union(){
    cylinder(d=d2+6,h=t+t);
    translate([0,0,-w-t-.5])cylinder(d=d1-2-0.7,h=w+t);
    translate([0,0,-.5])cylinder(d=d1+3,h=0.5);    
    }
    cylinder(d=3,h=w+w+w+w,center=true);
   // translate([0,0,w/2+t+.5])rotate([90,0,0])cylinder(d=5,h=w+w+w,center=true);
    } 
}


module bracket(){
   z = w+0.5+0.5+3;
   x=6/2+d2/2+10;
   difference(){
        union(){
           translate([x/2,0,z/2])cube([x,10,3],center=true); 
           translate([x-3,0,0])cube([6,10,z],center=true);
        }
    translate([x-5,0,0])cube([6,6,z-4],center=true);
    rotate([0,90,0],center=true) cylinder(d=3,h=100,center=true);
    }
    
}

module hanger(){
    flange2();
    bracket();
}

//bearing();
translate([0,0,w/2+1.5+0.5+1.5] )rotate([0,180,0])hanger();
translate([d2+3+4,0,w/2+1.5+.5])flange();



