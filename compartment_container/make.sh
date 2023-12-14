#!/bin/bash

for width in $(seq 20 10 160); do
    for height in $(seq 20 10 80); do
        for depth in $(seq 20 5 30); do
            for dividers in $(seq 1 1 10); do
                if (( $width / $dividers < 10)); then
                    continue
                fi
                
                openscad \
                    hanging_compartment_container.scad \
                    -o compartment_container_$width-$height-$depth-$dividers.stl \
                    -D width=$width \
                    -D height=$height \
                    -D depth=$depth \
                    -D dividers=$dividers
            done
        done
    done
done
