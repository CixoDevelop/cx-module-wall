include <../assets/hanger.scad>
include <../assets/wall.scad>

$fn = 100;

/* Variables from command line */
width = 200;
height = 200;
hole_width = 10;
hole_height = 20;
holes_spacing = 50;

/* Draw wall */
wall(
    width,
    height,
    hole_width,
    hole_height,
    holes_spacing
);
