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

# move_base_flex planner_patience is a dynamic_reconfigure param. mbf_costmap_nav does
# NOT honor the static value from params/move_base_flex.yaml at boot (it comes up at the
# .cfg default of 5.0s), so we force it live via dynparam once the node is ready.
# Override the value from mower_config.sh with OM_PLANNER_PATIENCE if needed.
OM_PLANNER_PATIENCE="${OM_PLANNER_PATIENCE:-30.0}"
(
  # Wait for the move_base_flex reconfigure server (bounded so we never spin forever).
  for _ in $(seq 1 60); do
    rosservice list 2>/dev/null | grep -q '^/move_base_flex/set_parameters$' && break
    sleep 2
  done
  sleep 2  # let mbf finish initialising its reconfigure server
  echo "Setting /move_base_flex/planner_patience = ${OM_PLANNER_PATIENCE}"
  for _ in 1 2 3; do
    rosrun dynamic_reconfigure dynparam set /move_base_flex planner_patience "${OM_PLANNER_PATIENCE}" && break
    sleep 3
  done
) &

roslaunch --wait -v open_mower open_mower.launch
