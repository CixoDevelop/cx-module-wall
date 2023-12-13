#!/bin/bash

for count_x in $(seq 50 50 500); do
    for count_y in $(seq 50 50 500); do
        openscad \
            perforated_wall.scad \
            -o perforated_wall_$count_x-$count_y.dxf \
            -D width=$count_x \
            -D height=$count_y 
    done
done
