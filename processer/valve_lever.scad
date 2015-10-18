hose = 6;
g=2;
ax=10;
hh = hose * 1.5;  //hingeheight
s2a = 15; //spring to axle
barlength = s2a * 2;
sl = 15;   //springlength
sd = 4; //spring diameter
ss = 6;  // spring sprog
w = hose + g + g + g/2;
baselength =  s2a + g+ g;  // length of base

module bar() {
   translate([0,g/4,hh-g-g]){  //move it up to the hinge
        cube ([barlength,hose,g+g]); // main bar
        translate([g,hose/2,g+g])cylinder(r=g/2,h=ss);  //spring sprog
        translate([2,0,0]) rotate([-90,0,0])cylinder(r=g,h=hose); // compression bar
        translate([ax,-g*1.25,g]) rotate([-90,0,0])cylinder(r=g-.01,h=w,$fn=30); //axle
   };    
}

module base(){     //hose holder at bottom
difference() {
    union(){     
        translate([-w/2,-g,-g]) //move back(x) to fit housing and down for thickness
            cube([baselength, w,hh+g]); // base block
        translate([0,w/2-g,hh]) //up to top of block and into middle of hose
            cylinder(r1=w/2, r2= sd/2 +g, h=sl + g);//spring housing cylinder
        }
        translate([-g-w/2,0,0])
            cube([baselength+g+g,w-g-g,hh+ss]);//cut out above hose
        translate([ax,-w-w,hh-g]) 
            rotate([-90,0,0])cylinder(r=g,h=hose+w+w+w+w,$fn=30);//drill out axle
        translate([ax-g,-hose,hh-g])
            cube([g+g,3*w,10]); //cut out bit above axle
         translate([0,w/2-g,hh])
            cylinder(r=w/2-g/2,r2= sd/2 ,h=sl-g);//drill out spring housing
        translate([ax,w/2-g,-g*1.1])
            cylinder(r1= 2,r2=3, h=g*1.2);
        translate([ax,w/2-g,-g*1.1])
            cylinder(r1= 1.5,r2=3, h=g*1.2);
        translate([-w/2  + 3+.1,w/2-g,-g*1.1])
            cylinder(r1= 1.5,r2=3, h=g*1.2);
    }
}

bar();
base();
