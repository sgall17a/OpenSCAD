r3 = sqrt(3)/2*17;  // face of hexagon is 17mm

module nut() {
    linear_extrude(h=10)
    polygon(points=[[2,0],[1,r3],[-1,r3],[-2,0],[-1,-r3],[1,-r3]]);
    
}

linear_extrude(height=6)
scale([2.5,2.5,2.5])
difference(){
nut();
scale(.95)nut();
}

difference(){
    union() {    
    translate([0,0,9]) cylinder(r=5,h=2);
    translate([0,0,9]) cylinder(r=2,h=5);
    }
    cylinder(r=1.5,h=20);
}
translate([-3,2,0])cube([4,4,6]);