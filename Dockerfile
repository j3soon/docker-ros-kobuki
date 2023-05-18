FROM osrf/ros:melodic-desktop-full
# Use osrf/ros instead of ros:melodic for pre-installed development packages
# Ref: https://github.com/osrf/docker_images#osrf-profile

# Install kobuki
COPY thirdparty/install_basic.sh /root/catkin_ws/install_basic.sh
RUN . /opt/ros/melodic/setup.sh && \
    mkdir -p ~/catkin_ws/src && \
    cd ~/catkin_ws && \
    apt-get update && \
    bash install_basic.sh && \
    catkin_make && \
    rm -rf /var/lib/apt/lists/*
