# Rockets and Arduinos

An [Arduino](http://www.arduino.cc/) is an easy to use microcrontroller. They are made for hobbyists and artists. You can program them to do things like [control your garage door](http://www.instructables.com/id/Garage-Door-Opener-with-iphone-Arduino-project/), [control a robot](http://makezine.com/projects/build-your-own-arduino-controlled-robot/), or make an [LED cube](http://www.instructables.com/id/Led-Cube-8x8x8/).

In this tutorial, I am going to show you how to [launch a rocket with an Arduino](https://vimeo.com/89754340). We will write a countdown timer using Node.js and use the Arduino to programmatically send the electrical signal to launch the rocket.
  
# Pre-requisites 

You will need the following materials:

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-5.jpg)

[Arduino Mega 2560 Board](http://www.amazon.com/Arduino-MEGA-2560-Board-R3/dp/B006UTBDGA/ref=sr_1_2?srs=2582406011&ie=UTF8&qid=1395423966&sr=8-2&keywords=arduino+mega). You could use a different Arduino board, but I recommend the Mega.

[NodeJS](http://nodejs.org) installed on your computer. It is relatively easy to install. You can [go here to install it](http://nodejs.org).

[9 Volt Battery](http://www.amazon.com/Duracell-Alkaline-Batteries-Coppertop-Pack/dp/B004DE54AA/ref=sr_1_2?ie=UTF8&qid=1395426261&sr=8-2&keywords=9+volt+battery) and a [9 Volt Battery clip](http://www.amazon.com/Gino-Battery-Connectors-Buckle-Cable/dp/B00E0KG9DI/ref=sr_1_2?s=electronics&ie=UTF8&qid=1395426586&sr=1-2&keywords=9+volt+wire).

[Breadboard and Jumper Wires](http://www.amazon.com/microtivity-IB401-400-point-Experiment-Breadboard/dp/B004RXKWDQ/ref=sr_1_1?ie=UTF8&qid=1395426281&sr=8-1&keywords=bread+board)

A 5 Volt Relay. I purchased mine at [Electronics Warehouse](http://4sq.com/bIWGYa) in my hometown, but you could purchase one like [this](http://www.amazon.com/Amico-Coil-Power-Relays-HHC66A-1Z-12VDC/dp/B008MU206C/ref=sr_1_1?ie=UTF8&qid=1395426328&sr=8-1&keywords=5+volt+relay) or [this](http://www.amazon.com/RobotGeek-RG-RELAY-Relay/dp/B00IS9I49Y/ref=sr_1_5?ie=UTF8&qid=1395426336&sr=8-5&keywords=5+volt+relay+arduino).

[Rocket Engines](http://www.amazon.com/Estes-B4-4-Engine-Pack-3-Each/dp/B000QUXP3S/ref=sr_1_1?ie=UTF8&qid=1395426643&sr=8-1&keywords=rocket+engine) with [starters/electronic-matches](http://www.amazon.com/Estes-B4-4-Engine-Pack-3-Each/dp/B000QUXP3S/ref=sr_1_1?ie=UTF8&qid=1395426643&sr=8-1&keywords=rocket+engine), and [start plugs](http://www.amazon.com/Estes-B4-4-Engine-Pack-3-Each/dp/B000QUXP3S/ref=sr_1_1?ie=UTF8&qid=1395426643&sr=8-1&keywords=rocket+engine). 

## Software Setup

First, [install Node.js](http://nodejs.org/).

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-2.jpg)

Next, [install the Arduino software](http://arduino.cc/en/main/software#.UyyMs61dVIs).

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-1.jpg)

Plug your Arduino into your computer, and open up the Arduino software you just installed. 

Open up the StandardFirmata software, and press the 'Upload' button.

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-3.jpg)

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-4.jpg)

This will install [StandardFirmata](http://firmata.org/wiki/Main_Page) onto the Arduino.

Create the countdown timer program. Open up terminal and type the following.

```
mkdir rocket
cd rocket
npm init   # hit enter multiple times to accept all the defaults
npm install johnny-five --save
vim launch.js
```

Paste the following in launch.js.

```
// timer countdown
var countDown = function(callback){
  var count = 10;
  var counter = setInterval(function() {
    console.log(count);

    count = count - 1;
    if (count < 0) {
      clearInterval(counter);
      callback("LIFT OFF!");
    }
  }, 1000);
}

//// board control
var five    = require("johnny-five");
var board   = new five.Board({
  debug: true,
  repl: false
});

board.on("ready", function() {
  var launchSignal = new five.Led({
    pin: 10
  });
  launchSignal.off();

  countDown(function(resp) {
    console.log(resp);
    launchSignal.on();
  });
});
```

This program communicates with pin 10 to send an electronic 5 volt signal. We will use the 5 volt signal as a communication protocal. It will tell the 9 volt battery to send electricity to the rocket engine's electronic starter - igniting the engine. 

## Wire it up


1. Place the relay on the board. We are going to use the relay to control the 9V battery power. 
2. Wire ground (black wires) to the battery, to the GND pin on the Arduino, and to one of the switch pins on the relay. 
3. Wire the positive (red wires) to the battery, to pin 10 on the Arduino, and to the other switch pin on the relay. 

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-6.jpg)

Wiring can be tricky - even with a basic circuit like this. Try to mimic the picture above. 

To test it out, connect the outgoing positive and negative to a multimeter. Set the multimeter to DC voltage, and run the launch.js node program.

```
node launch.js
```

If you did it right, the multimeter will read approximately 9 volts.

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-7.jpg)

## Prepare the Engine

Next, prepare the rocket engine. 

1. Place the electronic match in the engine
2. Insert the plug to hold it in place 
3. Bend the electronic match wires to the side

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-8.jpg)

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-9.jpg)

## Connect everything for launch

**Caution with this step. If you accidentally send the 9 Volts down the wire before running your program, the rocket will ignite in your hands.**

1. Place the engine somewhere safe. I've placed mine in a vise. You could also put it inside your rocket. 
2. Connect a longer wire to the ends of the electronic match. Make sure they do not touch each other.
3. Connect the ends of the longer wire to the positives and negatives coming off the previously built Arduino circuit.

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-10.jpg)

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-11.jpg)

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-12.jpg)

![](https://raw.githubusercontent.com/scottmotte/writings/master/images/rockets-arduinos-13.jpg)

## Launch

Run the program and your launch your rocket!

```
node launch.js
```
 
[Watch it on Vimeo](https://vimeo.com/89754340).


