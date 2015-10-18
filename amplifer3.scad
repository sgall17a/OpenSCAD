$fn=15;
t = 3;
r = 25.5/16;
d = t+r;
g=1; //gap
ec = 18 + t+t;
sg =10;  //screwgap from side of board
z = [  [0.92,2.52],[36.04,2.94],[35.77,23.55],[0.78,26.56] ];
echo(h,sg);
 h= [ for ( j = z) j+[r,r]  ];
echo("z ",z);
 


board = [41,41,2];
extra = [(sg+t+r)*2,-board[1]+ec,1];
vc =[11,0,6.86+6];
led = [32.6,0,4.5+t+t];
front = board +extra;
echo("front",front);
strut = [d*2,t+t,t];
fh = front[1];
st = board[1] * 0.8; 
 side = [[0,0],[0,fh],[st,fh],[st,0]];

module  bar(d1 =[0,0],d2=[10,30]){

echo(d1,d2);
difference(){
 union(){
        linear_extrude(t)
            hull(){translate(d1) circle(d);
            translate(d2)circle(d);    
         }
  
        translate(d1)cylinder(r=d,h=t+t);
        translate(d2) cylinder(r=d,h=t+t);
  }; 
  translate(d1) cylinder(r=r, h= 100, center=true);
  translate(d2) cylinder(r=r, h= 100, center=true);
  }
}
 
difference(){
    union() {
        bar(h[0],h[3]); 
        bar(h[1],h[2]); 
        bar([-10,17],[board[0]+8,17]);
        translate([h[0][0],0,t/2])cube(strut,center=true);
        translate([h[1][0],0,t/2])cube(strut,center=true);

        //translate([0,0,3+3])cube(board);
        translate([-extra[0]/2,0,0])rotate([90,0,0])cube(front);
        translate([-10-d,0,0])rotate([90,0,90])linear_extrude(3)polygon(side);
        translate([board[1]+d-4,0,0])rotate([90,0,90])linear_extrude(3)polygon(side);
    }
    translate(vc)rotate([90,0,0]) cylinder(r = 7/2,h = 100, center=true);
    translate(led)rotate([90,0,0]) cylinder(r = 3/2,h = 100, center=true);
    translate([-4,0,vc[2]])rotate([90,0,0]) cylinder(r = 7/2,h = 100, center=true);
}
