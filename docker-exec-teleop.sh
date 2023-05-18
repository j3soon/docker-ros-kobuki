#!/bin/bash -e

docker exec -it ros-melodic-kobuki /ros_entrypoint.sh \
    bash -c "source ./devel/setup.bash && roslaunch turtlebot_teleop keyboard_teleop.launch"
