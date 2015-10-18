//Weather monitor and pump switch esp8266 
//simple bracket
// ?more complicated base with screws
r=6;  //2.5mm socket  ?8mm hole

b = [r+r+6,r+r+6,2]; //base
s = b + [0,0,0]; //side - same as base but a big higher


sh = [[10,10], [10,40], [50,50]];  //screw holes


module simple_bracket(){
difference(){
    union() {
        cube(b);  //base
        rotate([90,0,0]) cube(s); //side
    }
    translate([s[0]/2,0, s[1]-r-2])rotate([90,0,0])cylinder(r=r,h=20,center=true); //socket hle
    
    translate(b/2)cylinder(r=1.5,h=20,center=true); // bolt hole for base
    
}
}

module relay_holder(){
b = 1.5;
t = 2;
l = 42+3;
w = 30.5+3;
h = 5;

relay = [[0,0,h/2],[l,0,h/2],[l,w,h/2],[0,w,h/2]];

difference(){
    union(){
        for (i = relay) translate(i)cylinder(r=b+t,h=h,center=true);      
translate([0,-b-t,0])cube([l,b+b+t+t,t]);
translate([0,w-b-t,0])cube([l,b+b+t+t,t]);
translate([-b-t,0,0])cube([b+b+t+t,w,t]);
translate([l-b-t,0,0])cube([b+b+t+t,w,t]);
    }
    for (i = relay) translate(i)cylinder(r=b,h=2*h,center=true);    
    }  
}

//relay_holder();
rotate([0,-90,0])simple_bracket();