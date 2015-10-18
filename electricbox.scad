//Box for PIR light
// Model: Big box - electrical part - two other clearings - 2 drill holes.

bx       = [86,86,20];     // Big box
electric = [48,66,30];     //electrical part
wt             = 3 ;       // wall thickness
screwthickness = 10;
drilldisp      = 60/2;     // drill holes are 60mm apart 
w  = bx[1] / 2 - screwthickness/2 -wt;   //Width of clearing
td = w/2 + screwthickness/2 ;    //How much to displace box clearing

echo(td);
echo (w);

difference(){

    cube(bx,center=true);  //main box
    //--- Difference
    cube(electric, center= true); //electrical part
    translate([0,td,wt]) cube([bx[0]-wt*2,w,bx[2]],center=true); //top internal clear
    translate([0,-td,wt]) cube([bx[0]-wt*2,w,bx[2]],center=true); //bottom internal clearing
  // drill holes 60mm apart
   translate([drilldisp,0,0])cylinder(r =2,h=60,center =true); //drill hole
   translate([-drilldisp,0,0])cylinder(r =2,h=60,center =true); //drill hole
}

      



