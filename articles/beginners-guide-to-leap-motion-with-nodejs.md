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
    "leapjs": "0.2.1",
  }
}
```

```bash
npm install
```

## Basic Events

Next, we are going to create a basic task.js script to catch some basic events.

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

Let's move beyond that and catch our finger count.

## Count Your Fingers

Add the following to task.js.

```javascript
controller.on('deviceFrame', function(frame) {
  var numberOfFingers = frame.fingers.length;
  console.log(numberOfFingers);
});
```

Run `node ./task.js`. Now when you put your fingers out, you will see the number count of fingers you are holding displayed in the console log. Pretty amazing huh!

Now let's try some gestures.

## Gestures

Change your controller to include gestures.

```javascript
...
var controller  = new leapjs.Controller({enableGestures: true});
...
```

And add a bit of code to capture those gestures so that the end script looks like the following.

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
        console.log('circle');
        break;
      
      case "swipe":
        console.log('swipe');
        break;

      case "screenTap":
        console.log('screenTap');
        break;

      case "keyTap":
        console.log('keyTap');
        break;

      }
    }
});

controller.connect();
```

## Conclusion

As you can see, getting started with the Leap Motion is reasonably straightforward and most definitely fun. 

It's up to you now to decide what you want to build with it. Check out [js.leapmotion.com](http://js.leapmotion.com) for more tutorials, examples, and the API documentation.
