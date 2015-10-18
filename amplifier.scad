ibox = [41,41,21];
gbox = [3,3,3];
obox = ibox + gbox * 2;
dbox = [41,50,40];
r=8;
bottom_gap = 3;

//volume 7mm upa and 11mm along
//rear plugs 11.5 up and 12 for power plug
//sound jack (apposit volume) 9mm in
//electrolytic 17 high 16 in from fround  16.12 diam AND 2MM IN
//hole 3.1 (1/8) .9 + 3.1/2 = 2.45mm in
hin = 3.1/2 +.9 +3;

//2.81 + 3.1 / 2 from front   and 26.8 + 3.1/2 from front
//volume control 13 mm high

difference(){
    cube(obox);
    translate(gbox) cube(dbox);
    translate([11,10,7+bottom_gap])
        rotate([90,0,0])
            cylinder(r=2.5,h=20);
    for (i = [  [hin,hin,0],
                [obox[1]-hin,hin,0],
                [obox[1]-hin,obox[1]-hin,0],
                [r,obox[1]-hin,0]])
                    translate(i) cylinder(r=1.5,h=10);
    //slot from back 8mm deep
    translate([-5,obox[1]-8,13]) cube([obox[0]+10,obox[1]/3+1,obox[2]+1]);

}
    