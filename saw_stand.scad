box = [400,600,500];
fb2 = [50,100];
ply = 12;
pp = [ply,ply,];
b2 = concat((box - 2*fb2 -2*pp),b2[2]);
echo(b2);
//cube(box,center=true);

leg = concat(fb2,box[2]);
xd = box[0]/2-leg[0]/2;
yd = box[1]/2-leg[1]/2;
for (i= [-1,1]){
    translate([i*xd,0,0])cube([ply,b2[1],b2[2]],center=true);
    for (j = [-1,1]){
       % translate([i*xd,j*yd,0]) cube(leg,center=true);
        
        echo([i*xd,j*yd,0]);
    }
}