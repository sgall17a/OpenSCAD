module ring(r,h,w,t){
    translate([0,0,-t/2])
    difference(){
    linear_extrude(t)
    difference(){
        offset(r+t)square([w-r-r,h-r-r],center=true);
        offset(r)square([w-r-r,h-r-r],center=true);
    }
     translate([-h-w,-(h+w)/2,-(h+w)/2,])cube([h+w,h+w,h+w]);
}
}

module pocket(r,h,w,t){
union(){
    for (i=[0:30:90]){
        rotate([0,i,0])
            ring(r,h,w,t);
    }
    
    for (i=[0:30:60]){
        rotate([0,180-i,0])
            ring(r,h,(w-t)/sin(i)+ 2* t/tan(i)+t,t);
    }
 }
}   
 
minkowski() {pocket(3,19,8,2);
    sphere(d=4);
    };