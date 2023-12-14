/** \module hanger_solid
 * This module create 3D solid for hanger to mount it on performated wall,
 * it can be glued to objects that would be placed on that wall.
 * @param width Width of the hanger, it must be less or equal to hole width
 * @param height Height of the hanger, it must be less to hole height 
 * @param thickness Thickness of the wall
 */
module hanger_solid(width, height, thickness) {
    linear_extrude(width - 0.5) {
        hanger_polygon(height, thickness);
    }
}

/** \module hanger_polygon
 * This module create 2D polygon for hanger, to use in models, that is 2D to
 * glued it before extrude.
 * @param height Height of the hanger, it must be less to hole height 
 * @param thickness Thickness of the wall
 */
module hanger_polygon(height, thickness) {
    polygon([
        [0, height],
        [0, 0],
        [thickness * 3, 0],
        [thickness * 3, height],
        [thickness * 2, height],
        [thickness * 2, thickness],
        [thickness - 0.5, thickness],
        [thickness - 0.5, height],
    ]);
}

/** \module hanging_for_modules
 * This draw hanging part of the modules, like containers. It draw hangers on
 * all width of the module.
 * @param width Width of the module
 * @param hole_width Width of the hole in perforated wall
 * @param hole_height Height of the hole in perforated wall
 * @param holes_spacing Space between the holes
 * @param wall_thickness Thickness of the wall
 */
module hanging_for_modules(
    width, 
    hole_width, 
    hole_height, 
    holes_spacing, 
    wall_thickness
) {
    width_contain_holes = width - (hole_width - 0.5);
    start_position = width_contain_holes % holes_spacing / 2;

    for (count = [start_position: holes_spacing : width_contain_holes]) {
        rotate([90, 0, 90]) translate([0 - wall_thickness * 3, 0, count]) {
            hanger_solid(hole_width, hole_height, wall_thickness);
        }
    }
}

/** \module hanger_hole
 * This module draw hole for mount the hanger on wall. It require width and
 * height, and it must be same as in hanger, because when it is not the same, 
 * hanger would not suite to the hole.
 * @param width Width of the hole
 * @param height Height of the hole
 */
module hanger_hole(width, height) {
    square([width, height]);
}
