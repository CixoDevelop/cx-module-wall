#!/bin/bash

for count in $(seq 10 5 60); do
    openscad \
        hook.scad \
        -o hook_$count.stl \
        -D width=$count
done
