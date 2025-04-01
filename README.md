# Docker image for Yujin Robot's iClebo Kobuki on ROS 1 Melodic

[<img src="https://img.shields.io/badge/dockerhub-image-important.svg?logo=docker">](https://hub.docker.com/r/j3soon/ros-melodic-kobuki/tags)

> Although this repo should still function as intended, future updates for ROS 2 will be maintained at [j3soon/ros2-essentials](https://github.com/j3soon/ros2-essentials/tree/main/kobuki_ws).

## Prerequisites

Hardware:

- Kobuki base
- Power supply cable (for recharging)
- USB cable

More information such as User Guide and Manual Installation steps can be found in [this post](https://j3soon.com/cheatsheets/iclebo-kobuki/).

## Installation

Clone the repo:

```sh
git clone https://github.com/j3soon/docker-ros-kobuki.git
cd docker-ros-kobuki
```

Installation of udev rules must be done on the host machine:

```sh
./setup_udev_rules.sh
```

You should see `done` if everything works correctly.

## Teleoperation

```sh
sudo apt-get update && sudo apt-get install -y docker.io docker-compose
# Connect and power on kobuki
./docker-compose.sh up -d
./docker-exec-bringup.sh
# Open a new terminal
./docker-exec-teleop.sh
# Control kobuki with keyboard
# Press Ctrl+C to exit
./docker-compose.sh shutdown
```

The [pre-built docker images](https://hub.docker.com/r/j3soon/ros-melodic-kobuki/tags) will be pulled automatically.

Although the docker container support hot plugging, if Kobuki is re-plugged or re-booted, you still need to re-run the following commands:

```sh
./docker-exec-bringup.sh
./docker-exec-teleop.sh
```

## Build Docker Images Locally

- On amd64 machine:

  ```sh
  docker build -f Dockerfile -t j3soon/ros-melodic-kobuki:latest .
  ```

- On arm64 machine:

  ```sh
  docker build -f Dockerfile.jetson -t j3soon/ros-melodic-kobuki:latest .
  ```

If you want to build an image that supports multiple architectures, please refer to the [build workflow](./.github/workflows/build.yaml).

## Third Party Scripts

- `thirdparty/install_basic.sh` is copied from: <https://github.com/gaunthan/Turtlebot2-On-Melodic/blob/master/install_basic.sh> (commit a98834a)
- `thirdparty/60-kobuki.rules` is copied from: <https://github.com/kobuki-base/kobuki_core/blob/devel/60-kobuki.rules> (commit e2f0fea)

## Tests

Last tested manually on 2023/05/24:

- Ubuntu 18.04.6 LTS (amd64) on Intel CPU
- Ubuntu 20.04.5 LTS (arm64) on Jetson AGX Xavier (Jetpack 5.1.1)

Last tested manually on 2023/05/19:

- Ubuntu 22.04.2 LTS (amd64) on AMD CPU

## Troubleshooting

- Most command failures can be resolved by simply re-running the command or rebooting Kobuki.
