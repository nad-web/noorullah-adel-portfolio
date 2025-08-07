[Detailed Doc](https://projects.raspberrypi.org/en/projects/ultrasonic-theremin/0) <br>
<img width="410" height="234" alt="image" src="https://github.com/user-attachments/assets/6401f5e4-1765-4790-9327-54f8ac6addfc" />


# Ultrasonic Theremin

In this resource, you are going to make your very own theremin using an ultrasonic distance sensor and a little bit of Python and Sonic Pi code.

A theremin is a unique musical instrument: it produces sound without being touched by the performer. The circuitry for a theremin is fairly complicated, but you can use ultrasonic distance sensors to fake it.

## Set Up the Distance Sensor

An ultrasonic distance sensor is a device that sends out pulses of ultrasonic sound, and measures the time they take to bounce off nearby objects and be reflected back. They can measure distances fairly accurately (up to about a metre).

**Important:** Make sure that the distance sensor you are using for this project can be used with a `3.3V` power supply.

An ultrasonic distance sensor has four pins:
*   `Ground (Gnd)`
*   `Trigger (Trig)`
*   `Echo (Echo)`
*   `Power (Vcc)`

To use an ultrasonic distance sensor, you need to connect:
*   The `Gnd` pin to the ground pin on the Raspberry Pi.
*   The `Trig` and `Echo` pins to GPIO pins on the Raspberry Pi.
*   The `Vcc` pin to the `3V3` pin on the Raspberry Pi.

## How to Detect Distance

You can easily detect how far away an object is from the distance sensor. If you’ve wired up the sensor as shown in the diagram (not provided here, but implied), then your `echo` pin is `17` and your `trigger` pin is `4`.

## Add a Buzzer

Now that you can tell how far away your hand is from the distance sensor, it is time to add a buzzer.

## Map Distances to MIDI Notes

You want the distance of your hand from the ultrasonic sensor to alter the MIDI note that is played.

The distance sensor produces values between `0` and `1`, whereas the buzzer can play MIDI notes between `33` and `105`.
