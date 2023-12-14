include <../assets/container.scad>
include <../assets/dividers.scad>

/* Variables from command line */
width = 60;
height = 30;
depth = 20;
thickness = 3;
container_wall_thickness = 5;
hole_width = 10;
hole_height = 15;
holes_spacing = 50;
wall_thickness = 3;
dividers = 5;

/* Draw container */
hanging_compartment_container(
    width, 
    height, 
    depth, 
    container_wall_thickness, 
    hole_width, 
    hole_height, 
    holes_spacing, 
    wall_thickness,
    dividers
);
