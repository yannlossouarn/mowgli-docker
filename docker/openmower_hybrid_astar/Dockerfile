# Hybrid A* deploy wrapper: CI base image + rosserial_server + start scripts.
# The start scripts map OM_* config vars to the upstream env var names the
# launch files expect (MOWER, ESC_TYPE, HARDWARE_PLATFORM, PARAMS_PATH) and
# enable OM_LEGACY_CONFIG_MODE — required by the migrate/to-clemens-main base.
FROM ghcr.io/yannlossouarn/open_mower_ros_mowgli:feat-hybrid-astar-transition-planner

USER root

# Timezone
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# rosserial_server (tongtybj fork with rosservice server support)
RUN mkdir -p /home/ubuntu/rosserial/src && cd /home/ubuntu/rosserial/src \
    && git clone https://github.com/tongtybj/rosserial \
    && cd rosserial && git checkout rosservice_server
RUN bash -c 'source /opt/ros/noetic/setup.bash && cd /home/ubuntu/rosserial \
    && catkin_make -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic install --only-pkg-with-deps rosserial_server'

# Startup scripts (map OM_* -> upstream env vars; set HARDWARE_PLATFORM)
ADD scripts /home/ubuntu/scripts
RUN chmod +x /home/ubuntu/scripts/*.sh

CMD [ "/home/ubuntu/scripts/start_mowgli.sh" ]
