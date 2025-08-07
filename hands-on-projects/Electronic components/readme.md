* [Detailed Doc](https://projects.raspberrypi.org/en/projects/rpi-python-line-following/0)

# Build a Line-Following Robot

Make sure you have a working buggy, like the one in the Build a buggy project.

## Materials Needed

You will also need:

*   8 socket-to-socket or socket-to-pin jumper leads
*   2 line following sensors
*   Soldering iron and solder
*   Insulating tape

## Prepare the Connectors

Connect the line sensors to your buggy.

Normally, the type of line sensor used in this project needs to be connected to a `3V3` pin, but you’re going to run two sensors via the same power pin, so you’ll attach both of them to a `5V` pin.

## Connect the Line Sensors

Each line sensor has three pins: `VCC` for power, `GND` for ground, and `DO` for digital out.

## Simple Line Follower

**Note:** In this example, the motor controller board is connected so that the left motor is on pins `GPIO 7` and `GPIO 8`, and the right motor is on pins `GPIO 9` and `GPIO 10`. The left line sensor is on pin `GPIO 17`, and the right line sensor is on pin `GPIO 27`.
