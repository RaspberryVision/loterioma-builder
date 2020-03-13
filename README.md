# loterioma-builder
The repository used to build and implement the system is responsible for the appropriate download and configuration of the required components. Instructions for sequentially running systems should be found in the sh files.

## Goals
The casino infrastructure consists of many subsystems, the process of building and configuring them will be complicated, and we would like these operations to be configured and simply managed.
In order to build a casino infrastructure you should:
1. Download the `loterioma-builder` repository.
2. After moving to the project directory, call the script sh `run.sh` in the directory`/scripts`.
3. Based on the current configuration, this script will download the required subsystems, pre-configure them and, after completing the work, inform us about its status.

## Todo
1. Script `/scripts/run.sh` containing elementary boot instructions.
2. Script `/scripts/stop.sh` allowing the system to be stopped.
3. Script `/scripts/reload.sh` allowing to reboot the current system.
