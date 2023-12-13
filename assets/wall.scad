include <hanger.scad>

/** \module plate
 * This module draw 2D flat plate with rounded corners.
 * @param width Full width of the plate
 * @param height Full height of the plate
 */
module plate(width, height) {
    rounding = 10;

    translate([rounding, rounding]) minkowski() {
        square([width - rounding * 2, height - rounding * 2]);
        circle(r = rounding);
    }
} 

/** \module performation
 * This module draw 2D flat performation to make difference between it and 
 * plate, then in result obtain wall with mounting holes for wall modules.
 * @param width Full width of the plate to draw performation on
 * @param height Full height of the plate to draw performation on
 * @param hole_width Width of the hole
 * @param hole_height Height of the hole
 * @param holes_spacing Spacing between holes in X and Y
 */
module performation(width, height, hole_width, hole_height, holes_spacing) {
    start_x = ((width - hole_width) % holes_spacing) / 2;
    start_y = ((height - hole_height) % holes_spacing) / 2;

    for (count_x = [start_x : holes_spacing : width - hole_width]) {
        for (count_y = [start_y : holes_spacing : height - hole_height]) {
            translate([count_x, count_y]) hanger_hole(hole_width, hole_height);
        }
    }
}

/** \module wall
 * This module draw 2D wall with mounting performation to mount wall modules 
 * on it. It add also holes to screw wall in place.
 * @param width Full width of the wall
 * @param height Full height of the wall
 * @param hole_width Width inside the hole
 * @param hole_height Height inside the hole
 * @param holes_spacing Spacing between the holes in X and Y
 */
module wall(width, height, hole_width, hole_height, holes_spacing) {
    difference() {
        plate(width, height);
        performation(width, height, hole_width, hole_height, holes_spacing);

        translate([10, 10]) circle(r = 1.5);
        translate([width - 10, 10]) circle(r = 1.5);
        translate([width - 10, height - 10]) circle(r = 1.5);
        translate([10, height - 10]) circle(r = 1.5);
    }
}
