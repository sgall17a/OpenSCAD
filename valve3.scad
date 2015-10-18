g=2;
mi = 16/2 + g;
mo = 16/2 + g + g;
ho = 13/2;
hi = 13/2 -g;
lv = 25 +ho +ho;
$fn=40;


module bowl() {
 difference(){
  union() {
      translate([0,0,ho])rotate([0,90,0])cylinder(r=ho,h=lv);
     translate([-lv,0,3*ho-g])rotate([0,90,0])cylinder(r=ho,h=lv);
        cylinder(r=mo,h=4 *ho);
      translate([0,0,4*ho-g-g])  cylinder(r=mo+5,h=g+g);
       //cylinder(r= ho, h = lv);
       translate([0,0,ho+ho-g])cylinder(r= mo, h = g);
      translate([-5,-mo-14/2,0])cube([10,mo+mo+14,g+g]);
  }   
 translate([0,0,g])cylinder(r=mi,h=ho+ho-g-g);
 translate([0,0,ho+ho-.01])cylinder(r=mi,h=ho+ho+ho);
 translate([0,0,g])cylinder(r=3,h=lv);
translate([0,0,g-0.1])cylinder(r=4.5,h=ho+ho-g-0.2);
 translate([0,0,ho])rotate([0,90,0])cylinder(r=hi,h=lv+g);
 translate([-lv-g,0,3*ho-g])rotate([0,90,0])cylinder(r=hi,h=lv+g);

 }
    
}

difference(){
    bowl();
    rotate([0,0,45])translate([mo+2.5,0,ho]) cylinder(r=1.5,h=lv);
    rotate([0,0,45+90])translate([mo+2.5,0,ho]) cylinder(r=1.5,h=lv);
    rotate([0,0,45+180])translate([mo+2.5,0,ho]) cylinder(r=1.5,h=lv);
    rotate([0,0,45+270])translate([mo+2.5,0,ho]) cylinder(r=1.5,h=lv);
    
    translate([0,-mo-3,-lv/2]) cylinder(r=1.5,h=lv);
    translate([0,mo+3,-lv/2]) cylinder(r=1.5,h=lv);
}