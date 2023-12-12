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

