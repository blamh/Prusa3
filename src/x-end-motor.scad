// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org
// Camera: -12,5,30,250,0,239,243

use <../inc/x-end.scad>

module x_end_motor_holes()
{
  x_end_holes();

  // Position to place
  translate([-1,32,30.25]) {
    // Belt hole
    translate([-14,-11.5,0]) cube(size=[10,20,22], center=true);

    // Motor mounting holes
    for (i=[-1,1]) for (j=[-1,1]) {
      hull() for (k=[13,15.5]) translate([20,i*k,j*k]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=70, r=1.8, $fn=30);
      hull() for (k=[13,15.5]) translate([1,i*k,j*k]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=9, r=3.1, $fn=30);
    }

    // Material saving cutout
    translate([-10,14,12]) cube(size=[60,42,42], center=true);

    // Material saving cutout
    translate([-10,40,-30]) rotate([45,0,0])  cube(size=[60,42,42], center=true);
    // Motor shaft cutout
    translate([0,0,0]) rotate([0,-90,0]) rotate([0,0,90]) cylinder(h=70, r=14, $fn=6);
  }
}

// Final part
module x_end_motor()
{
  difference() {
    union() {
      x_end_base();
      translate([-15,31,26.5]) cube(size=[17,44,53], center=true);
    }
    x_end_motor_holes();
  }

  // % translate([-23.57,32,30.25]) rotate([0,90,0]) import("../inc/nema14.stl", convexity=3);
  % translate([-40.3,32,30.25]) rotate([0,90,0]) import("../inc/nema17.stl", convexity=3);
}

x_end_motor();
