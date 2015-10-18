module shape(d){
translate([-d/2,0])circle(d/2);
translate([d/2,0])circle(d/2);
square(d,center=true);
}


module shell_shape(d,t){
    difference() {
       union(){
            translate([-d/2,0])circle(d/2+t);
            translate([d/2,0])circle(d/2+t);
            square([d,d+t+t],center=true);
       }
    translate([-d/2,0])circle(d/2);
    translate([d/2,0])circle(d/2);
    square(d,center=true);
    }
}


module batt_end(d,t,h){
    difference(){
    union(){
    translate([0,0,h-t])linear_extrude(t) shape(d+t);
    linear_extrude(h) shell_shape(d,t);
    }   
          
   //battery connector holes
   translate([-d/2,0,h])cylinder(r=1,h= h, center=true);     
   translate([d/2,0,h])cylinder(r=1,h= h,center=true);  
    }
}

//batt_end(11,2);

module screw_end(d,t,h){
    difference(){
        union(){
        linear_extrude(t+t)
            difference(){
                square([d+d+t+t+h+h,d+t+t],center=true);
                shape(d); //cut out shape
            }
     linear_extrude(8) shell_shape(d,t);
    }
   //drill holes 
   // assume m3 with bolt diam of 5
   translate([d+h-t,0,0])cylinder(r=1.5,h= h+h,center=true); 
   translate([d+h-t,0,t+t])cylinder(r=2.5,h= t+t,center=true,$NA=6); 
   
   translate([-(d+h-t),0,0])cylinder(r=1.5,h= h+h,center=true);     
  translate([-(d+h-t),0,t+t])cylinder(r=2.5,h= t+t,center=true);     
   }
}

module screw_cap(d,t,h){
    difference(){
       union(){
            cube([d+d+t+t+h+h,d+t+t,t],center=true);
            translate([0,0,d/2])cube([d+d+t+t,d+t+t,10],center=true);
       }

   translate([0,t,d/2-t/2])cube([d+h+t+t,d+t+t,8],center=true);
   //drill holes 
   // assume m3 with bolt diam of 5
   translate([d+h-t,0,0])cylinder(r=1.5,h= h+h,center=true); 
   translate([d+h-t,0,t+t])cylinder(r=2.5,h= t+t,center=true,$NA=6); 
   
   translate([-(d+h-t),0,0])cylinder(r=1.5,h= h+h,center=true);     
   translate([-(d+h-t),0,t+t])cylinder(r=2.5,h= t+t,center=true);     
  
   //battery connector holes
   translate([-d/2,0,0])cylinder(r=1,h= t+t, center=true);     
   translate([+d/2,0,0])cylinder(r=1,h= t+t,center=true);     

     
    }
}


module  batt_join(d,t,h,l,sd){
    screw_end(d,t,h);
    translate([0,0,l-h]) batt_end(d,t,h);
    translate([0,d/2+t/2,l/2])cube([d+d,t,l],center=true);
}

module buzzer(d,t,h,l,sd) {
    
difference(){
    batt_join(d,t,h,l);
    translate([0,h,l/2+sd/2])rotate([90,0,0])cylinder(r=2,h=6,center=true);
    translate([0,h,l/2-sd/2])rotate([90,0,0])cylinder(r=2,h=6,center=true);
}
}

rotate([-90,0,0])buzzer(12,2,8,42,30);
translate([0,-12,0])rotate([90,0,0])screw_cap(12,2,8,42,30);



