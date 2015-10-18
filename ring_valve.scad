h = 19;
hr = h + 2;
ht = 6;
alu=2;
d=2.5;

difference() {
union(){
cylinder(r=h/2,h=ht);
translate([0,0,ht]) cylinder(r=h/2,h=alu);
translate([0,0,ht/2]) cylinder(r=hr/2,h=1);
}

translate([0,0,-20])cylinder(r=4,h=40);
translate([h/2-d,0,-20])cylinder(r=1.5,h=40);
translate([0,h/2-d,-20])cylinder(r=1.5,h=40);
translate([-h/2+d,0,-20])cylinder(r=1.5,h=40);
translate([0,-h/2+d,-20])cylinder(r=1.5,h=40);

}

translate([0,0,-10]) cylinder(r=3/2,h=20);

difference(){
union() {
    
translate([-h/2,-2.5,-2])cube([h,5,2]);
translate([0,0,-10])cylinder(r=3,h=3);
translate([-10/2,-3,-2-10])cube([10,6,2]);
}
translate([-(h-8)/2,-3,-3])cube([h-8,6,4]);
}