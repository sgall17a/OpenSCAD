

module holes() {
union(){
    //entry pipe
    translate([-25,0,0])rotate([0,90,0]) cylinder(r=5,h=40);
    translate([14,0,0]) sphere(r=5,center = true);
    //below marble
    translate([15,0,0])cylinder(r=3,h=10);
    //above marble
    translate([15,0,8])cylinder(r=10,h=20);
    //save plastic
     translate([23,-20,-8])cube([15,40,10]);
  
    //exit pipe
    translate([  10,0,18])rotate([0,90,0]) cylinder(r=5,h=47);
   
     //drill holes
      dr = 10;
       translate([15,0,0])
       rotate([0,0,0])
       {
        translate([-dr,dr,12])cylinder(r=1.5,h=40);
        translate([-dr,-dr,12])cylinder(r=1.5,h=40);
        translate([dr,dr,12])cylinder(r=1.5,h=40);
        translate([dr,-dr,12])cylinder(r=1.5,h=40);
        }
    }
};


//holes();

module solid() {
union() {
    //entry pipe
   translate([-20,0,0])rotate([0,90,0]) cylinder(r=7,h=30);
   //exit pipe
    translate([  10,0,18])rotate([0,90,0]) cylinder(r=7,h=45);
   //main body
    translate([15,0,-8])cylinder(r=13,h=32);
    //main body top bit
   translate([15,0,19])cylinder(r=18,h=6);
   // top hat
  //  translate([15,0,30])cylinder(r=18,h=6);
   //screw base
        translate([15,0,-6]) cube([10,50,4],center=true);
   
    }
}

difference() {
    solid();
    holes();
}







