#!/bin/bash
echo "Starting OpenMower (upstream)"
source /config/mower_config.sh

# Map OM_* variables to upstream env var names expected by launch files
export MOWER="${OM_MOWER:-CUSTOM}"
export ESC_TYPE="${OM_MOWER_ESC_TYPE:-xesc_mini}"
export HARDWARE_PLATFORM="${OM_HARDWARE_VERSION:-1}"
export PARAMS_PATH="${OM_PARAMS_PATH:-/config}"
export OM_DEVELOPMENT_PREVENT_NODE_RESPAWN="${OM_DEVELOPMENT_PREVENT_NODE_RESPAWN:-false}"
echo "OM_DEVELOPMENT_PREVENT_NODE_RESPAWN: ${OM_DEVELOPMENT_PREVENT_NODE_RESPAWN}"

# Use legacy config mode: parameters are read from OM_* env vars (set in mower_config.sh)
# rather than from yaml files
export OM_LEGACY_CONFIG_MODE="True"

roslaunch --wait -v open_mower open_mower.launch
