# Beginner's Guide to Leap Motion with Node.js

In this article I show you how to get started with Leap Motion in Node.js.

## Installation

Install the leap motion software [here](https://www.leapmotion.com/setup).

## Node App Setup
```bash
mkdir leap-app
cd leap-app
touch package.json
```

In package.json, paste the following code:
```javascript
{
  "name": "leap-app",
  "version": "0.0.1",
  "engines": {
    "node": "0.10.x",
    "npm": "1.2.x"
  },
  "main": "app.js",
  "description": "leap-app",
  "dependencies": {
    "leapjs": "0.2.1"
  }
}
```

Install the leapjs dependency.
```bash
npm install
```

## Basic Events

Next, we are going to create a task.js script to catch some basic Leap Motion events.
```bash
touch task.js
```

Paste the following into task.js.
```javascript
#!/usr/bin/env node

var leapjs      = require('leapjs');

var controller  = new leapjs.Controller();

controller.on('connect', function() {
  console.log("Successfully connected.");
});

controller.on('deviceConnected', function() {
  console.log("A Leap device has been connected.");
});

controller.on('deviceDisconnected', function() {
  console.log("A Leap device has been disconnected.");
});

controller.connect();
```

Let's run it.
```bash
node ./task.js
```

Now, connect, and disconnect your Leap motion. You'll see those events logged to your screen. Neat.

## Count Your Fingers

Let's move beyond that and log our finger count.

Add the following to task.js.
```javascript
controller.on('deviceFrame', function(frame) {
  var numberOfFingers = frame.fingers.length;
  console.log(numberOfFingers);
});
```

Run `node ./task.js`. Now when you put your fingers out, you will see the number of fingers you stick out displayed in the console log. 

Try with 2 fingers and then with 5. Pretty amazing huh!

## Gestures

Now let's try some gestures.

Gestures are not enabled by default. Begin by enabling them.
```javascript
...
var controller  = new leapjs.Controller({enableGestures: true});
...
```

And add a bit of code to capture those gestures so that the final script looks like the following.
```javascript
#!/usr/bin/env node

var leapjs      = require('leapjs');
var controller  = new leapjs.Controller({enableGestures: true});

controller.on('deviceFrame', function(frame) {
  // loop through available gestures
  for(var i = 0; i < frame.gestures.length; i++){
    var gesture = frame.gestures[i];
    var type    = gesture.type;          

    switch( type ){

      case "circle":
        if (gesture.state == "stop") {
          console.log('circle');
        }
        break;

      case "swipe":
        if (gesture.state == "stop") {
          console.log('swipe');
        }
        break;

      case "screenTap":
        if (gesture.state == "stop") {
          console.log('screenTap');
        }
        break;

      case "keyTap":
        if (gesture.state == "stop") {
          console.log('keyTap');
        }
        break;

      }
    }
});

controller.connect();
```

## Conclusion

As you can see, getting started with the Leap Motion is reasonably straightforward and most definitely fun. 

It's up to you now to decide what you want to build with it. Check out [js.leapmotion.com](http://js.leapmotion.com) for more tutorials, examples, and the API documentation.
