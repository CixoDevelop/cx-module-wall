#!/bin/bash

for width in $(seq 20 10 160); do
    for height in $(seq 20 10 80); do
        for depth in $(seq 20 5 30); do
            openscad \
                hanging_container.scad \
                -o container_$width-$height-$depth.stl \
                -D width=$width \
                -D height=$height \
                -D depth=$depth
        done
    done
done
