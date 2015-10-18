l=58;
w=65;
bh=26;
sd =51;
d=5;
h=5;

box = [l+4,w+4,bh+5];
ibox = box - [4,4,-20];

scrw = [
    [(l+6-sd)/2,d],
    [(l+6-sd)/2+sd,d],
    [(l+6-sd)/2,d+25],
    [(l+6-sd)/2+sd,d+15],
    [(l+6-sd)/2+l/2,d+31],
    [(l+6-sd)/2+l/2,d+38],
    [(l+6-sd)/2+sd,d+31],
    [(l+6-sd)/2+sd,d+38],
    ];

difference(){
    union(){
    difference(){
        cube(box);
            translate([2,2,2])cube(ibox);
    };
     for (i = scrw){
        translate(i) cylinder(r=3,h=h);
        };
    translate([-12,box[1]/2-6,0])cube([box[0]+24,12,2]);   
    }

    translate([30,60,12])cube([25,10,40]);
    translate(scrw[0])cylinder(r=1.5,h=20,center=true);
    translate(scrw[1])cylinder(r=1.5,h=20,center=true);
    translate([-6,box[1]/2,0])cylinder(r=1.5,h=20,center=true);
    translate([6+box[0],box[1]/2,0])cylinder(r=1.5,h=20,center=true);
    
}



