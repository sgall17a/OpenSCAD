module actual_plus_inner(){
difference(){

    translate([19/2,19/2,4/2]){
        cube([17.6,17.96,2.5],center = true);
        %cube([19,19,4],center=true);
        

    difference(){
        translate([0,0,1.8])cylinder(r=2.42/2,h=12);
        cylinder(r=2/2,h=20);
        }
    }
 }
}
 
difference() {   
    union() {
    cube([23,23,6]);
     translate([23/2,23/2,6-0.1])               
        translate([0,0,.1])cylinder(r=4.53 /2,h=12);
    }

    translate([23/2,23/2,6-0.1])
           translate([0,0,-10])cylinder(r=2/2,h=30);
    translate([2,2,-0.1]) cube([19,19,4.1]);
}
    

