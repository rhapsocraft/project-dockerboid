#!/bin/bash

# Create a symlink
# RV Interior Map
RV_INTERIOR_MAP_SOURCE="./links/maps"
RV_INTERIOR_MAP_MAP_NAME="map_distanciado"
RV_INTERIOR_MAP_TARGET="./workshop-mods/content/108600/3543229299/mods/modPROJECTRVInterior/common/media/maps/$RV_INTERIOR_MAP_MAP_NAME/"

if ! [ -d "$RV_INTERIOR_MAP_SOURCE/$RV_INTERIOR_MAP_MAP_NAME" ]; then
    # Create link if map doesn't not exist
    ln -s "$TARGET" "$SOURCE"
fi

