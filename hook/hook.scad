include <../assets/hanger.scad>
include <../assets/hook.scad>

/* Variables from command line */
width = 10;
height = 8;
thickness = 3;
hole_width = 10;
hole_height = 15;

/* Draw hook */
hook_solid(width, height, thickness, hole_width, hole_height);

