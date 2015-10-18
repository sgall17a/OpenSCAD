l = 250;
u=10;


/*
Mini-kossel

Vertical 600
horizontal 240 + some makes 300
GT2 timing belt x 4m and 3 x GT2-20T timing pulleys

max radius = cos(theta) * arm with typical theta of 20degrees min

     Zero backlash.
    Type: Delta printer
    Speed: 320 mm/s in all 3 directions.
    Resolution: 100 steps/mm in all 3 directions.
    Repeatability: better than 0.03 mm (30 micron)
    Build volume: cylindrical, 170mm diameter, 240mm height.
    Footprint: triangle, 300 mm width (240mm OpenBeam + printed corners).
    Frame height: 600 mm.
    Print surface: unheated round glass, doesn't move.
    Mass of end effector with hotend: less than 50 grams.
    Simplicity: fewer than 200 parts.
    Hardware cost: less than $600 USD.
    Fully automatic print surface level calibration (autoleveling). 

    carbon tube 180 + traxxas bearings

Optionally scale down to a Traveling RepRap that fits within IATA hand luggage size limit (see transportation):

    Frame height: 550 mm.
    Footprint: triangle, 270 mm width, 250 mm across (210mm 15 x 15 mm aluminum extrusion like OpenBeam + printed corners). 

*/

module bar() {
    difference(){
    translate([l/2,0,0])cube([l+u+u,12,3],center=true);
    translate([0,0,0]) cylinder(d=3,h=50,center=true);
    translate([l,0,0]) cylinder(d=3,h=50,center=true);
    }
}

bar();

for (i=[0:60:359]){
    rotate([0,0,i])bar();
}

for(i=[0:60:359]){
    rotate([0,0,i])translate([l,0,0])
       rotate([0,0,120])bar();
}

square(sqrt(3)*(l),center=true);