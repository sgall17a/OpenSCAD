l=69;
w=62;
t=2;
g=2.5;
cube([l,w,t]);
translate([l/2-8,g,0]) cube([16,t+1,12]);
translate([l/2-8,w-g-t-1,0]) cube([16,t+1,12]);