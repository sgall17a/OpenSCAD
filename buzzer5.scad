
h=4;  //!no real dimensional significance 
bh=30; //distance between buzzer holes
l=44+2; //length of battery + drawing pins
dp=1.5;
g=1.5; //thickness of plastic
d= 10.5+0.5; //diam of battery + gap
t=3;
rotate([0,-90,0])buzzer(l,d,h,bh,g);
module buzzer(l,d,h,bh,g){
difference(){
union(){
rotate([90,0,0])mirror([1,0,0])bracket(l,d,bh);
bat(l,d,g);
}
translate([d/2,0,0])cylinder(d=d,h=l,center=true); //remake battery hole
translate([t-1,0,0])rotate([90,0,0])bolt(l,d,bh);
}
}

module bat(l,d,g){
    translate([d/2,0,0]) //to line up with bracket
    difference(){
   minkowski(){//outer shell
        sphere(d=g); //rounding
        cylinder(d=d,h=l+2*1.5+2*3,center=true); 
    }
    cylinder(d=d,h=l+1.5*2,center=true);  //battery hole
    cylinder(d=1,h=l+l,center=true);  //drawing pin holes
    translate([d/2,0,0]) cube([d,d+d,l],center=true); //insertion space
    
}
}

module br_bolts(bh){
    for (i=[-1,1])
    for (j = [0:$children-1])
        translate([-1,bh/2*i,0])rotate([0,90,0])children(j);
}

module bracket(l,d,bh){
    hull()
    br_bolts(l) cylinder(r=4,h=5);
    br_bolts(bh) cylinder(r=5,h=4.9);
}

module bolt(l,d,bh){
      br_bolts(bh){
        cylinder(r=1.5,h=20,center=true,$fn=20);  //drill holes
        translate([0,0,0])cylinder(r=4,h=5,center =true,$fn=6);
    }  
}

