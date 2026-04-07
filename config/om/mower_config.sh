# Set default GPS antenna offset
export OM_ANTENNA_OFFSET_X="0.35"
export OM_ANTENNA_OFFSET_Y="0.0"

# True to start mowing automatically. If this is false, you need to start manually by pressing the start button
export OM_AUTOMATIC_MODE=0

# Voltages for battery to be considered full or empty
export OM_BATTERY_CRITICAL_VOLTAGE=22.0


export OM_BATTERY_EMPTY_VOLTAGE=23.0

export OM_BATTERY_FULL_VOLTAGE=27.8

export OM_DATUM_LAT="48.72838862472293"
export OM_DATUM_LONG="-3.4520804829769336"

export OM_DFP_IS_5V="False"

export OM_DOCKING_DISTANCE=0.35
export OM_DOCKING_EXTRA_TIME=0

# True to enable mowing motor
export OM_ENABLE_MOWER="True"
export OM_ENABLE_RECORDING_ALL="False"

export OM_GPS_BAUDRATE="460800"
export OM_GPS_PORT="/dev/gps"
export OM_GPS_PROTOCOL="UBX"
export OM_GPS_TIMEOUT_SEC=15
export OM_GPS_WAIT_TIME_SEC=15

export OM_HARDWARE_VERSION=""

# Heatmap UNSET or om_gps_accuracy
export OM_HEATMAP_SENSOR_IDS=om_gps_accuracy

export OM_LANGUAGE="en"

export OM_MOWER="CUSTOM"
export OM_MOWER_ESC_TYPE="xesc_mini"
export OM_MOWER_GAMEPAD="ps3"

export OM_MOWING_ANGLE_INCREMENT=0
export OM_MOWING_ANGLE_OFFSET=0
export OM_MOWING_ANGLE_OFFSET_IS_ABSOLUTE="False"

# Mower motor temperatures to stop and start mowing
export OM_MOWING_MOTOR_TEMP_HIGH=80.0

export OM_MOWING_MOTOR_TEMP_LOW=40.0


################################
##    External MQTT Broker    ##
################################
# Set thes in order to publish status data to your external MQTT broker.
# This is for use with smart home.

# export OM_MQTT_ENABLE=False
# export OM_MQTT_HOSTNAME="your_mqtt_broker"
# export OM_MQTT_PASSWORD=""
# export OM_MQTT_PORT="1883"
# export OM_MQTT_TOPIC_PREFIX="openmower"
# export OM_MQTT_USER=""



################################
##   Obstacle Recovery Settings   ##
################################

# Robot physical geometry used to build the costmap footprint polygon.
# base_link is at the wheel axis centre.
# FRONT: metres from wheel axis to the nose of the robot  (default 0.473 for 573mm body, axis 100mm from rear)
# REAR:  metres from wheel axis to the rear of the robot  (default 0.100)
# HALF_WIDTH: half the robot width in metres              (default 0.212 for 424mm wide robot)
export OM_ROBOT_FRONT=0.473
export OM_ROBOT_REAR=0.100
export OM_ROBOT_HALF_WIDTH=0.212

# IMU-based shock/collision detection (handled by FTCPlanner; disabled by default)
# Enable to trigger BackwardForwardRecovery on hard impacts.
export OM_SHOCK_DETECTION_ENABLED="True"
# Base frontal and lateral acceleration thresholds (m/s^2).
# Effective threshold = base + shock_speed_factor * current_speed
export OM_SHOCK_FRONTAL_BASE=3.0
export OM_SHOCK_LATERAL_BASE=3.0
export OM_SHOCK_SPEED_FACTOR=5.0
# Minimum commanded speed (m/s) before shock detection activates (avoids false positives when stationary)
export OM_SHOCK_MIN_SPEED=0.05

# Wheel-slip detection: compares wheel odometry vs GPS displacement (disabled by default)
# Enable to trigger recovery when wheels spin without actual movement.
export OM_SLIP_DETECTION_ENABLED="True"
# Minimum wheel-integrated distance (m) before evaluating slip in each window
export OM_SLIP_MIN_WHEEL_DISTANCE=0.2
# GPS/wheel ratio below which slip is detected (0.0 = complete slip, 1.0 = no slip)
export OM_SLIP_RATIO_THRESHOLD=0.3
# Time window (s) over which wheel and GPS distances are accumulated
export OM_SLIP_DETECTION_WINDOW=3.0

# Number of mow-path poses to skip forward after an obstacle recovery (mower_logic)
# Increase if the robot keeps hitting the same obstacle; decrease if you want tighter coverage.
export OM_OBSTACLE_SKIP_COUNT=10



export OM_NO_COMMS="True"

export OM_NTRIP_ENDPOINT="LTC1"
export OM_NTRIP_HOSTNAME="caster.centipede.fr"
export OM_NTRIP_PASSWORD="centipede"
export OM_NTRIP_PORT=2101
export OM_NTRIP_USER="centipede"

export OM_OUTLINE_COUNT=4
export OM_OUTLINE_OFFSET=0.08
export OM_OUTLINE_OVERLAP_COUNT=1

# The width of mowing paths.
# Choose it smaller than your actual mowing tool in order to have some overlap.
# 0.13 works well for the Classic 500.
export OM_TOOL_WIDTH=0.16

#export OM_TOF_DEVICE="/dev/ttyUSB0"
#export OM_TOF_X=0.3
#export OM_TOF_Y=0.0
#export OM_TOF_YAW=0.0
#export OM_TOF_Z=0.15

export OM_UNDOCK_DISTANCE=0.35

export OM_USE_F9R_SENSOR_FUSION="False"
export OM_USE_NTRIP="True"
export OM_USE_RELATIVE_POSITION="False"

export OM_VOLUME=-1

# Set distance between wheels in m
export OM_WHEEL_DISTANCE_M=0.325


# Set default ticks/m
export OM_WHEEL_TICKS_PER_M=1600.0