

translate([5,0,0])rotate([90,0,0,])cylinder(r=3, h= 10);
translate([-10,5,0])rotate([0,90,0,])cylinder(r=3, h= 10);
intersection(){translate([0,0,-20])cube(40);
    rotate_extrude()translate([5,0,0])circle(3);
}


