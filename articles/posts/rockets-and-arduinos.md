# Rockets and Arduinos

An arduino is an over the counter affordable microcrontroller. You can do all kinds of things with them like control your garage door, build robots, and even launch rockets.

In this tutorial, I am going to show you how to build a countdown timer using an Arduino and NodeJS to launch a rocket. 

Let's get to it.

# Pre-requisites 

You will need the following materials:

[Arduino Mega 2560 Board](http://www.amazon.com/Arduino-MEGA-2560-Board-R3/dp/B006UTBDGA/ref=sr_1_2?srs=2582406011&ie=UTF8&qid=1395423966&sr=8-2&keywords=arduino+mega). You could use a different Arduino board, but I recommend the Mega.

[NodeJS](http://nodejs.org) installed on your computer. It is relatively easy to install. You can [go here to install it](http://nodejs.org).

[9 Volt Battery](http://www.amazon.com/Duracell-Alkaline-Batteries-Coppertop-Pack/dp/B004DE54AA/ref=sr_1_2?ie=UTF8&qid=1395426261&sr=8-2&keywords=9+volt+battery) and a [9 Volt Battery clip](http://www.amazon.com/Gino-Battery-Connectors-Buckle-Cable/dp/B00E0KG9DI/ref=sr_1_2?s=electronics&ie=UTF8&qid=1395426586&sr=1-2&keywords=9+volt+wire).

[Breadboard and Jumper Wires](http://www.amazon.com/microtivity-IB401-400-point-Experiment-Breadboard/dp/B004RXKWDQ/ref=sr_1_1?ie=UTF8&qid=1395426281&sr=8-1&keywords=bread+board)

A 5 Volt Relay. I purchased mine at [Electronics Warehouse](http://4sq.com/bIWGYa) in my hometown, but you could purchase one like [this](http://www.amazon.com/Amico-Coil-Power-Relays-HHC66A-1Z-12VDC/dp/B008MU206C/ref=sr_1_1?ie=UTF8&qid=1395426328&sr=8-1&keywords=5+volt+relay) or [this](http://www.amazon.com/RobotGeek-RG-RELAY-Relay/dp/B00IS9I49Y/ref=sr_1_5?ie=UTF8&qid=1395426336&sr=8-5&keywords=5+volt+relay+arduino).

[Rocket Engines](http://www.amazon.com/Estes-B4-4-Engine-Pack-3-Each/dp/B000QUXP3S/ref=sr_1_1?ie=UTF8&qid=1395426643&sr=8-1&keywords=rocket+engine) with [starters/electronic-matches](http://www.amazon.com/Estes-B4-4-Engine-Pack-3-Each/dp/B000QUXP3S/ref=sr_1_1?ie=UTF8&qid=1395426643&sr=8-1&keywords=rocket+engine), and [start plugs](http://www.amazon.com/Estes-B4-4-Engine-Pack-3-Each/dp/B000QUXP3S/ref=sr_1_1?ie=UTF8&qid=1395426643&sr=8-1&keywords=rocket+engine). 

## Software Setup

First, [install Node.js](http://nodejs.org/).

Next, [install the Arduino software](http://arduino.cc/en/main/software#.UyyMs61dVIs).

Plug your Arduino into your computer, and open up the Arduino software you just installed. 

Open up the StandardFirmata software, and press the 'Upload' button.

This will install StandardFirmata onto the Arduino.

Now, let's create our countdown timer script.

```
mkdir rocket
cd rocket
npm init   # hit enter to just accept all the defaults
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

Ok, that will communicate with pin 10 to send an electronic 5 volt signal. We will use that signal to send the 9 volt electronic pulse to the rocket's electronic starter. Let's do some wiring.

## Hardware Setup

First place, the relay on the board. We are going to use the relay to control the 9V battery power. Next, wire ground (black wires) to the battery, to the ground on Arduino, and to the ground on the relay. Next, wire the positive (red wires) to the battery, to pin 10 on the Arduino, and to the positive on the relay. 

Wiring can be tricky - even with a basic circuit like this. To test it out, connect the final positive and negative to a multimeter. Set the multimeter to DC voltage, and run our node script.

```
node launch.js
```

On launch, the multimeter should show approximately 9 volts. This is simulating the voltage we will send to the rocket engine. 

## Prepare the Engine

Next, let's prepare our rocket engine. Place the electronic match in the engine, and then place the plug over it. Bend the electronic match slightly to the side. 

Now, for the final step. 

## Prepare for Launch

Be careful with this step. If you accidentally send the 9 Volts down the wire before running your script, the rocket will ignite in your hands.

First, put the engine in a rocket or something safe. I've placed mine in a vise.

Connect longer wires to the ends of the electronic match. Make sure they do not touch each other.

Then connect the ends of the longer wire to the positives and negatives coming off the Arduino circuit.

## Launch

Run the script and your launch your rocket!

```
node launch.js
```

INSERT VIDEO HERE


 


