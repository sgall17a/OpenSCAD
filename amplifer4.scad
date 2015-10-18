$fn=15;
r = 3/2;
hd = 25.5/16;
ec = 18 + r+r;
z = [  [0.92,2.52],[36.04,2.94],[35.77,23.55],[0.78,26.56] ];
echo(h);
 h= [ for ( j = z) j+[r,r]  ];
echo("z ",z);
 ht = 23;
 brd =41;
 g=1; //gap
 overhang=15;
 bot=[[-overhang,-r],[brd+r+g,-r]];
 echo(bot);
 side1 = [[-r-g,-r],[-r-g,brd+r]];
 side2 = [[brd+g+r,-r],[brd+g+r,brd+r]];
 screw = [12+r+g,12,r+r];
 screw1 =[-screw[0],(brd-10)/2,0];
 screw2 =[brd+g+r,(brd-10)/2,0];
 board = [brd,brd];
 
 
 vc =[11,0,6.86+6];
led = [32.6,0,4.5+r+r];
 
module dohull(x){
     hull(){
         union(){
             for (i=x) 
                translate(i)circle(r=r);
         }
    } 
}
 
 module walls(){
     linear_extrude( ht){
     dohull(bot);
     dohull(side1);
     dohull(side2);
     }
     
     linear_extrude(r){
        dohull([side1[0],side1[1],side2[0],side2[1]]);
     }
    translate(screw1)cube(screw);
    translate(screw2)cube(screw);
    
     translate([0,0,2.5])
     for (i= h) 
         translate(i)cylinder(r=r+r,h=5,center=true);

 }
 
 difference(){
    walls();
    for (i=h)
        translate(i) cylinder(r=1.5,h=100,center=true);
    translate(screw1+[6,6]) cylinder(r=2,h=100,center=true);
    translate(screw2+[6+g+r,6]) cylinder(r=2,h=100,center=true);
    
    translate(vc)rotate([90,0,0]) cylinder(r = 7/2,h = 100, center=true);
    translate(led)rotate([90,0,0]) cylinder(r = 3/2,h = 100, center=true);
    translate([-8,0,vc[2]])rotate([90,0,0]) cylinder(r = 7/2,h = 100, center=true);
    translate([0,12,12])rotate([0,90,0]) cylinder(r=4,h=20,center=true);
    
 }