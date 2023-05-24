# Minimal Docker Scripts for Yujin Robot's iClebo Kobuki

## Prerequisites

Hardware:

- Kobuki base
- Power supply cable (for recharging)
- USB cable

More information such as User Guide and Manual Installation steps can be found in [this post](https://j3soon.com/cheatsheets/iclebo-kobuki/).

## Installation

Clone the repo:

```sh
git clone https://github.com/j3soon/ros-kobuki-docker.git
cd ros-kobuki-docker
```

Installation of udev rules must be done on the host machine:

```sh
./setup_udev_rules.sh
```

You should see `done` if everything works correctly.

## Teleoperation

- On amd64 machine:

  ```sh
  sudo apt-get update && sudo apt-get install -y docker.io docker-compose
  # Connect and power on kobuki
  ./docker-compose.sh up -d
  ./docker-exec-teleop.sh
  # Control kobuki with keyboard
  # Press Ctrl+C to exit
  ./docker-compose.sh shutdown
  ```

- On arm64 machine:

  ```sh
  sudo apt-get update && sudo apt-get install -y docker.io docker-compose
  # Connect and power on kobuki
  ./docker-compose.jetson.sh up -d
  ./docker-exec-teleop.sh
  # Control kobuki with keyboard
  # Press Ctrl+C to exit
  ./docker-compose.jetson.sh shutdown
  ```

## Third Party Scripts

- `thirdparty/install_basic.sh` is copied from: <https://github.com/gaunthan/Turtlebot2-On-Melodic/blob/master/install_basic.sh> (commit a98834a)
- `thirdparty/60-kobuki.rules` is copied from: <https://github.com/kobuki-base/kobuki_core/blob/devel/60-kobuki.rules> (commit e2f0fea)

## Tests

Last tested manually on 2023/05/19:

- Ubuntu 18.04.6 LTS (amd64) on Intel CPU
- Ubuntu 22.04.2 LTS (amd64) on AMD CPU
- Ubuntu 20.04.5 LTS (arm64) on Jetson AGX Xavier (Jetpack 5.1.1)

## Troubleshooting

- Most command failures can be resolved by simply re-running the command.