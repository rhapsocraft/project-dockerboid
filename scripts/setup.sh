#!/bin/bash

# Parse `setup.yml` file

# Configuration
YAML_FILE="/server/setup.yml"
MOD_IDS_PATH=".enabled_mods[]"
MAPS_PATH=".enabled_maps[]"
WORKSHOP_IDS_PATH=".workshop_ids[]"

PREFIX='\\\\'
SEPARATOR=";"

# Parse mod ids
export MOD_IDS=$(yq -r "$MOD_IDS_PATH" "$YAML_FILE" | sed "s|^|$PREFIX|" | paste -sd "$SEPARATOR" -)

# Parse workshop ids
export WORKSHOP_IDS=$(yq -r "$WORKSHOP_IDS_PATH" "$YAML_FILE" | paste -sd "$SEPARATOR" -)

# Parse maps
export MAPS=$(yq -r "$MAPS_PATH" "$YAML_FILE" | paste -sd "$SEPARATOR" -)

echo Completed server setup