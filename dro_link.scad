dro=[63+4,34+2,116];
bat =[65+5,19+3,25];
shrink=[1.5,1.5,0];


module box(d,b,sh=[0,0,0]){
b1 = [d[0],d[2],1]-sh;
b2 = [b[0],b[2],1]-sh;
echo(b1,b2);
serial_hull(){
    translate([0,0,0])cube(b1);
    translate([0,0,20])cube(b2);
    translate([0,0,40])cube(b2);
    }
}

module top(){
   translate([0,bat[1]/2,bat[2]/2]){
    difference(){
        union(){
            cube(bat,center=true);
             cube([bat[0],bat[1],1],center=true);
        }
      translate([0,0,1.5]) cube(bat-[3,3,0],center=true);
      for(i=[-1:1]){
      translate([bat[0]/3*i,0,-bat[2]/2]) cylinder(d=12,h=10,center=true);
        }
    }
}
}

//top();
module bs(d,h){
b1= [d[0],d[1],1];
translate([0,b1[1]/2,h])
    {
        cube(b1,center=true);
    }
}  

difference(){
    union(){
        top();
    difference(){
        hull(){
            bs(dro,h=-20);
            bs(bat,h=0);
        }
       translate([0,-1.5,.5]){
        hull(){
            bs(dro-[3,0,-3],h=-21);
            bs(bat-[3,0,-3],h=1);
            }
        }
    }
    }
    for(i=[-1,1]){
   translate([20*i,15,12])
    rotate([90,0,0])
    {
        cylinder(r=1.5,h=50,center=true);
        cylinder(r=5,h=20,center=true);
    }
}
}

  




    
