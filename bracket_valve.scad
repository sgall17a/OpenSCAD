
m = 10;
g=2;
h=13;
l = 15;
w = 3;
inch=25;
b = m+(g+w)*2;
echo(b);


difference() {
union(){
//sphere(r=g+m/2);
translate([0,0,-3])
mirror([0,0,1]){
    cylinder(r=h/2,h = m+g+l);
    cylinder(r = inch/2, h = w);
};
%translate([-50,-25/2,-3])cube([100,25,3]);
%translate([-50,25/2-w,-25])cube([100,3,25]);
}

translate([0,0,-50])cylinder(r=(h/2)-g,h=100);

translate([b/2-3,0,0])cylinder(r=3/2,h=l/2,center=true);
}



