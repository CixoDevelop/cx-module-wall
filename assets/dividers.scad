include <../assets/container.scad>

/** \module partitions
 * This module draw partition which split container or other space into two 
 * parts.
 * @param height Height of the partition
 * @param depth Depth of the partition
 * @param thickness Thickness of the partition
 */
module partitions(height, depth, thickness) {
    cube([thickness, height, depth]);
}

/** \module dividers
 * This draw dividers to split space in the container into specified count of
 * parts.
 * @param width Width of the space
 * @param height Height of the space
 * @param depth Depth of the space
 * @param thickness Thickness of the partitions
 * @param divider_count Into how many parts split space
 */
module dividers(width, height, depth, thickness, divider_count) {
    divider_width = width / divider_count;
    divider_start = divider_width - thickness / 2;

    for (count = [divider_start : divider_width : width - divider_width]) {
        translate([count, 0, 0]) {
            partitions(height, depth, thickness);
        }
    }
}

/** \module compartment_container
 * This draw container witch dividers which can be used as organiser, it not 
 * use a lot of space, like a lot of small containers, but it has a specified 
 * count of compartment to use it like such boxes.
 * @param width Width of the container
 * @param height Height of the container
 * @param depth Depth of the container
 * @param thickness Thickness of the container walls
 * @param divider_count Count of dividers in the container
 */
module compartment_container(width, height, depth, thickness, divider_count) {
    container(width, height, depth, thickness);
    
    full_width = width + thickness;
    full_height = height + thickness * 2;

    translate([thickness / 2, 0, 0]) {
        dividers(full_width, full_height, depth, thickness, divider_count);
    }
}

/** \module hanging_compartment_container
 * This draw hanging containeri with dividers, like combination of 
 * hanging_container and compartment_container. 
 * @param container_width Width of the container
 * @param container_height Height of the container 
 * @param container_depth Depth of the container
 * @param container_wall_thickness Thickness of the walls in the container
 * @param hole_width Width of the hole in performated wall
 * @param hole_height Height of the hole in performated wall
 * @param holes_spacing Space between holes
 * @param wall_thickness Thickness of the perforated wall
 * @param divider_count How many dividers contain container
 */
module hanging_compartment_container(
    container_width, 
    container_height, 
    container_depth, 
    container_wall_thickness,
    hole_width,
    hole_height,
    holes_spacing,
    wall_thickness, 
    divider_count,
) {
    compartment_container(
        container_width, 
        container_height, 
        container_depth,
        container_wall_thickness,
        divider_count
    );

    container_full_width = container_width + container_wall_thickness * 2;

    hanging_for_modules(
        container_full_width,
        hole_width,
        hole_height,
        holes_spacing,
        wall_thickness
    );
}
