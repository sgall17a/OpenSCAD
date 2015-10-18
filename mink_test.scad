difference() {
    minkowski(){
        sphere(r=3);
        shaft();
        }
    scale(f=1.1)shaft();
    translate([0,0,-10]) cylinder(r=3, h=50);
    translate([0,0,-10]) cylinder(r=10, h=15);
        
    }

module shaft() {
union() {
    cylinder(r=20,h=5);
    cylinder(r1=10,r2=5,h=10);
    cylinder(r=5,h=30);
    }
}

