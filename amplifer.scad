t = 3; //plastic thickness
g= 1; // gap or clearance
w= 41; //widht and height
sb = 10;
bh = 21;  //box height
hr= 3.12/2; // hole radius
hf = hr + 2.1; //hole from front
hin = hr + 0.9;  //hole from side
hb = hr + 26.8; //bback hole from front
soh = t+3;  //standoff height
sor = hr+3;

base =[sor+sor, //board gaps t screwbase
    t+g+hb,  //thickness,gap,dist from front, holediam, t
    t];
base_t =[-sb-3,0,0];
    
 hholes = [[hin,hf+g],[w-hin,hf+g],[w-hin,hb+g],[hin+g,hb+g]];

difference(){
   union() { 
cube(base);
translate([-12,-t,0])cube([w+12+g+t,t,bh]);  //front
translate([w+g,0,0])cube([t,w-9,bh]);  //right side
translate([-12,0,0])cube([t,w-9,bh]);  //left side
translate([w-hin-sor,0,0]) cube(base);
translate([-12,base[1]/2-sb/2,0]) cube([w+12,sb,t]); //base strut
//translate([-12+t,0,bh-3])cube([5,w-9,t]);  //left bracket
//translate([w+g+t,(w-9)/2,bh-3])cube([5,(w-9)/2,t]);  //left bracket
       
 for (i =hholes) translate(i)cylinder(r=sor,h=soh);
 }
    for (i = hholes)
        translate(i) cylinder(r=1.5,h=100,center = true);
    translate([11,0,7+3+3])rotate([90,0,0])cylinder(r=3,h=50,center=true);
    translate([-3,0,7+3+3])rotate([90,0,0])cylinder(r=3,h=50,center=true);

}
