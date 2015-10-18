box = [68+10,20,15];
$fn=20;
difference(){
    minkowski(){
    sphere(d=3);
    cube (box);
    }
    minkowski(){
        sphere(d=1.5);
        cube(box);
        }
    translate([box[0]/4,box[1]/2+5,4]) cube([box[0]/2,box[1]/2,100]);
    translate([0,0,box[2]/2])cube(box);
    translate([0,-box[1]/2,8])cube(box);

} 