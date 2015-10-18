module tube(h,d,t){
    translate([0,0,h/2])
    difference(){
    cylinder(d=d+t,h=h,center=true);
    cylinder(d=d,h=h+t,center=true);
    }
}

module filled(h,d,t){
    difference(){
       union(){
            tube(h,d,t);
            cylinder(d=d+t,h=2);
       }
    cylinder(r=.5,h=t+t,center=true);
    }
}

module connect(h,d,t){
    difference(){
    tube(h,d,t); 
   // translate([44/2+t,-d/2,d/2])cube([t,d,d]);
    }
}

connect(8,11,2);

module bat(h,d,t,l){
    translate([-l/2,0,0])
    rotate([0,90,0])
translate([-d/2,0,0])
    {
filled(h,d,t);
translate([0,0,l-h])connect(h+h/2,d,t);
translate([d/2,-d/2,0])cube([t,d,l+h/2]);
}
}




module pad(h,pd,t){
    translate([0,0,-t])
       cylinder(d=pd,h=h);
}


module drill(h,t){
  nutDiam=8;
  boltDiam = 3;
  translate([0,0,h-t-t])cylinder(d=nutDiam,h=t*1.1,$fn=6);
  translate([0,0,-1.1*t])cylinder(d=boltDiam,h=1.1*h, $fn=6);  

}


module bracket(h,m3,t,bh,pd){
h = 5;
m3=3;
t=2;
bh=30;
pd=12;
rotate([0,0,90])
translate([-bh/2,0,0])
difference(){
  union(){
    translate([0,-pd/2,-t])cube([bh,pd,t]);
    for(i=[0,bh])translate([i,0,0])pad(h,pd,t);
}
for (i=[0,bh])
    translate([i,0,0]) drill(h,t);
}
}

bat(8,11,2,44);
bracket(8,3,30,44);

