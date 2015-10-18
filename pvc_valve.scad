h = 25; //radius of pipe
t=3; //thickness of build plastic
mg = 9; // magnet gap
fg= 8;  //floating gap
alt= 3; //aluminium thickness
alr= (h+2)/2;  //Al outer radius
ali = 10/2 ;  //Al inner radius

module temp(){
cylinder(r=h,h= 5);
cylinder(r=1,h=100);
translate([h+2,0,0])cylinder(r=h,10);
translate([-h-2,0,0])cylinder(r=h/2,10);
}

module magnet_holder(){
for(i= [0,120,240])
rotate([0,0,i])
    union(){
    translate([h/4,0,0,])cube([h/2,t,t], center = true);
    translate([h/2-t/2,0,mg/2])cube([t,t,mg],center=true);
    }
difference(){
cylinder(r=8/2+1,h=3+t/2);
translate([0,0,t/2])cylinder(r=8/2,h=3+t/2);
}
};

module ring() {
    difference(){
        union(){
        cylinder(r=h/2,h=t+alt);
        cylinder(r=h/2+0.5,h= 1);
        }
        cylinder(r=ali,h=20,center=true);
        translate([0,0,h/2])cylinder(r=alr,h=20,center=true);
    }
};

module float_limit(){
for(i= [0,120,240])
rotate([0,0,i])
    union(){
    translate([h/4,0,0,])cube([h/2,t,t], center = true);
    translate([h/2-t/2,0,-fg/2])cube([t,t,fg],center=true);
   
     };
    
     difference(){
        cylinder(r=h/3,h=t,center=true);
        cylinder(r=h/3-t/2,h=20,center=true);
    }

};

magnet_holder();
%translate([0,0,mg])ring();
translate([0,0,mg+fg+alt-1]) float_limit();
