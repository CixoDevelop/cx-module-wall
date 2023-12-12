include <hanger.scad>

/** \module container
 * This draw 3D container with definied walls thickness, inside width, height
 * and depth. You must know that general width, height and depth is larger by
 * walls thickness.
 * @param width Width of the box inside it (X)
 * @param height Height of the box inside it (Z)
 * @param depth Depth of the box inside it (Y)
 * @param thickness Thickness of the walls
 */
module container(width, height, depth, thickness) {
    difference() {
        cube([
            width + thickness * 2, 
            height + thickness * 2, 
            depth + thickness
        ]);
        
        translate([thickness, thickness]) {
            cube([width, height, depth]);
        }
    }
}

/** \module hanging_container 
 * This module draw solid hanging container, that mean container with hanging 
 * module to place it on performed wall. 
 * @param container_width Width of container inside
 * @param container_height Height of container inside
 * @param container_depth Depth of container inside
 * @param container_wall_thickness Thickness of container walls
 * @param hole_width Width of hole in wall
 * @param hole_height Height of hole in wall
 * @param holes_spacing Space between holes in wall
 * @param wall_thickness Thickness of wall to place container on it
 */
module hanging_container(
    container_width, 
    container_height, 
    container_depth, 
    container_wall_thickness,
    hole_width,
    hole_height,
    holes_spacing,
    wall_thickness, 
) {
    container(
        container_width, 
        container_height, 
        container_depth, 
        container_wall_thickness
    );
    

    container_outside_width = container_width + container_wall_thickness * 2;
    container_width_fix_hanger = container_outside_width - (hole_width - 0.5);
    start_position = container_width_fix_hanger % holes_spacing / 2;
    
    for (count = [start_position : holes_spacing : container_outside_width]) {
        rotate([90, 0, 90]) translate([0 - wall_thickness * 3, 0, count]) {
            hanger_solid(hole_width, hole_height, wall_thickness);
        }
    }
}


