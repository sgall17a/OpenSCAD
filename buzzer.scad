
//AAA battery is 44mm long and 10.5mm diam.
//buzzer - screw holes 30mm apart, buzzer itself is 21mm diam
//distance between battery 6mm to accommodate 3mm bolt.
bl=44;
bd=11; //say battery is 11 diam
db = 1;
t=2;

module shell(){
translate([-(bd+db)/2,0,bl/2])
difference(){
union() {
    cylinder(r=bd/2+2,h=bl,center=true);
    translate([bd+db,0,0])cylinder(r=bd/2+2,h=bl,center=true);
    translate([(bd+db)/2,0,0])cube([bd+db,bd+4,bl],center=true);
}   
    translate([0,0,0]){
    cylinder(r=bd/2,h=bl+2,center=true);
    translate([bd+db,0,0])cylinder(r=bd/2,h=bl+2,center=true);
    translate([(bd+db)/2,0,0])cube([bd+db,bd,bl+2],center=true);
    }
  }
}

shell();
cube([bd+db+4,bd+4,t],center=true);
