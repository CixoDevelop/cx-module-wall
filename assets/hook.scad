include <hanger.scad>


/** \module hook_polygon
 * This module draw 2D hook polygon for glued it to hanger polygon and make
 * simple hook module.
 * @param width Width of the hook
 * @param height Height of the hook
 * @param thickness Thickness of the hook
 */
module hook_polygon(width, height, thickness) {
    polygon([
        [0, height],
        [0, height - thickness],
        [width - thickness,  height - thickness],
        [width - thickness, 0],
        [width, 0],
        [width, height],
    ]);
}

/** \module
 * This module draw 3D solid of the hook with the hanger to mount it on the
 * performated wall.
 * @param width Width of the hook (without hanger)
 * @param height Height of the hook block (without hanger)
 * @param thickness Thickness of the hook
 * @param hole_width Width of the hole in wall
 * @param hole_height Height of the hole in wall
 */
module hook_solid(width, height, thickness, hole_width, hole_height) {
    linear_extrude(hole_width - 0.5) {
        hanger_polygon(hole_height, thickness);
    
        translate([thickness * 3, hole_height - height]) {
            hook_polygon(width, height, thickness);
        }
    }
}
