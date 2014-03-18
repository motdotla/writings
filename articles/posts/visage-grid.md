# Remember people's names with an easily digestible daily email 

When you remember a person's name you pay them a subtle compliment. You add to their feeling of importance. Additionally, it benefits yourself to remember someone's name. They will more likely like you.

But many of us are bad at remembering people's names. I'm guilty of this. So let's change that to great effect. Let's build an app to improve our recollection of people's names.

I'm calling it [visage-grid](https://github.com/scottmotte/visage-grid). It will send me an email each morning. In that email will be the visage of a person I've met. At the bottom of the email will be her name.

That's it. Simple can be powerful. The small size of the email makes it easily digestible. The morning delivery makes it ritual. And the photo and name make it useful. 

An app I really like called [sunrise.im](http://sunrise.im) takes a similar approach for your calendar.

Alright, so let's build it.

There are 3 moving parts:

1. I need to maintain a list of people I've met
2. I need to deliver an email with a different person I know each day
3. I need a photo of each person I've met to embed in that email

I'm a big fan of the [80/20](http://en.wikipedia.org/wiki/Pareto_principle) rule. I'm going to approach each of these parts with it in mind.

## Maintaining a list of people I've met

Most of the people I meet give me their email address - whether that be from a business card or from conversing over email. So let's start building the app by making it possible for me to store email addresses.

We're going to build this app using node.js. I like how little code is required to build smallish apps in node.js.

```bash
mkdir visage-grid
cd visage-grid
touch package.json
```

Paste the following into package.json:

```javascript
{
  "name": "visage-grid",
  "version": "0.0.1",
  "engines": {
    "node": "0.10.x",
    "npm": "1.2.x"
  },
  "main": "app.js",
  "description": "Get an email each day of an acquaintance's visage. You memorize their name.",
  "dependencies": {
    "dotenv": "0.0.1",
    "hapi": "1.8.2",
    "redis": "0.8.4"
  }
}
```

Then run:
```bash
npm install 
```

Package.json sets up your app's dependencies and `npm install` installs them. It's similar to pip in Python or rubygems/bundler in Ruby.

You can see that we are using [hapi](http://hapijs.com). Hapi is currently my favorite nodejs framework for building APIs.

Next, let's write the code that will save the emails to a database. I've chosen redis as the database to power this small app.

(If you haven't installed Redis, I recommend this tutorial on [how to install and use redis](https://www.digitalocean.com/community/articles/how-to-install-and-use-redis) from [digital ocean](http://digitalocean.com/).)

```bash
touch app.js
```

Paste the following into app.js.

```javascript
var port        = parseInt(process.env.PORT) || 3000;
var hapi        = require('hapi');
var redis       = require('redis');

var server      = new hapi.Server(+port, '0.0.0.0', { cors: true });
var db          = redis.createClient();

var emails      = {
  create: {
    handler: function(request) {
      var payload = request.payload;

      db.sadd("emails", payload.email); 
      
      request.reply({
        success: true,
        email: payload.email 
      });
    }
  },
  index: {
    handler: function(request) {
      db.smembers("emails", function(err, data) {
        request.reply({
          success: true,
          emails: data
        });    
      });
    }
  }
};

server.route({
  method    : 'POST',
  path      : '/emails',
  config    : emails.create
});
server.route({
  method    : 'GET',
  path      : '/emails',
  config    : emails.index
});

server.start();
```

There is a fair amount going on here. Most of it is using logic built into hapi. I'll briefly walk you through it.

1. Hapi server and Redis database is initialized
2. Two routes are defined. A route to add an email to the database and a route to list all the emails currently in the database.
3. The two routes are added to the server by defining their url path and method.
4. The server is started and the POST /emails and GET /emails routes are made available over HTTP.

Let's run it:

```bash
node app.js
```

Let's poke at it:

```bash
curl -X POST http://locahost:3000/emails -d "email=your@email.com"
curl -X GET http://localhost:3000/emails
```

Excellent. We've solved our first moving part - "Maintaining a list of people I've met".

Let's move onto part #2. 

## Delivering an email with a different person each day

This is where I will use [SendGrid's API](http://sendgrid.com/docs/API_Reference/). I am going to write a script to send myself an email.

Add [sendgrid nodejs module](https://npmjs.org/package/sendgrid) to package.json:

```javascript
{
  ...
  "dependencies": {
    "dotenv": "0.0.1",
    "hapi": "1.8.2",
    "redis": "0.8.4",
    "sendgrid": "0.2.7"
  }
}
```

```bash
touch task.js
touch .env
```

Paste the following into task.js:

```javascript
#!/usr/bin/env node

var dotenv = require('dotenv');
dotenv().load();

var to                  = process.env.TO;
var sendgrid_username   = process.env.SENDGRID_USERNAME; 
var sendgrid_password   = process.env.SENDGRID_PASSWORD;

var SendGrid            = require('sendgrid').SendGrid;
var sendgrid            = new SendGrid(sendgrid_username, sendgrid_password);
var redis               = require('redis');
var db                  = redis.createClient();

db.smembers("emails", function(err, data) {
  var available_emails  = data;
  var random_number     = Math.floor(Math.random()*available_emails.length);
  var email             = available_emails[random_number];

  sendgrid.send({
    to          : to, 
    from        : to, 
    subject     : '[visage-grid] delivery',
    html        : "<ul><li>"+email+"</li></ul>" 
  }, function(success, message) {
    if (!success) {
      console.log(message);
    } else {
      console.log("Email sent with content: "+html);
    }

    process.exit();
  });
});
```

Paste the following into .env:

```
TO=your@email.com
SENDGRID_USERNAME=yourusername
SENDGRID_PASSWORD=yourpassword
```

There is even more going on here than the previous app.js code. I'll walk you through it.

1. I will run this script from the command line so I need to specify: `#!/usr/bin/env node`
2. dotenv loads up all environment variables in .env.
3. SendGrid and Redis are initialized.
4. I use redis to get a list of all the emails, and then I choose a random one.
5. I use the sendgrid module to deliver an email to myself. The content of the email is the randomly chosen email address.

Let's run it:

```bash
node ./task.js
```

Excellent. We've solved our second moving part - "Delivering an email with a different person each day".

Let's move onto part #3 - the last and final part.

## Embedding a photo of each person into the email

Where are we going to get photos from? We could take a photo of each person, but that would be super weird. Plus, uploading those photos would be tedious. Instead, let's rely on a 3rd party API called [FullContact](http://www.fullcontact.com/).

FullContact let's you make an API call with an email address, and it will return a photo matched to that email address. It isn't going to be 100% correct, but it is close enough for our 80/20 rule needs.

Let's add it in.

Edit package.json and add the [fullcontact-api](https://npmjs.org/package/fullcontact-api) node module:

```javascript
{
  ...
  "dependencies": {
    "dotenv": "0.0.1",
    "hapi": "1.8.2",
    "redis": "0.8.4",
    "sendgrid": "0.2.7",
    "fullcontact-api": "0.0.3"
  }
}
```

Add your FULLCONTACT_KEY to .env:

```
...
FULLCONTACT_KEY=yourfullcontactapikey
```

Edit task.js, adding bits of code to grab the photo from FullContact and add it to the delivered email:

```javascript
...
var fullcontact_key     = process.env.FULLCONTACT_KEY;
var fullcontact         = require('fullcontact-api')(fullcontact_key);

db.smembers("emails", function(err, data) {
  var available_emails  = data;
  var random_number     = Math.floor(Math.random()*available_emails.length);
  var email             = available_emails[random_number];
  
  fullcontact.person.findByEmail(email, function(err, json) {
    if (err) {
      console.log(err);
      process.exit();
    } else {
      var photo_url = json.photos[0].url; 
      var name      = json.contactInfo.fullName;

      var html      = "<p><img src='"+photo_url+"'/></p><ul><li>"+name+"</li></ul>";

      sendgrid.send({
        to          : to, 
        from        : to, 
        subject     : '[visage-grid] delivery',
        html        : html 
      }, function(success, message) {
        if (!success) {
          console.log(message);
        } else {
          console.log("Email sent with content: "+html);
        }

        process.exit();
      });
    }
  });
});
```

That's it. We added a handful of additional lines to use [FullContact's API](http://www.fullcontact.com/developer/docs/).

1. `var fullcontact         = require('fullcontact-api')(fullcontact_key);` initializes the module
2. `fullcontact.person.findByEmail` returns data about the person based on their email address
3. `json.photos[0].url` and `json.contactInfo.fullName` sets photo and name values to be added to the email.

Let's run it:

```
node ./task.js
```

We're done. In about ~100 lines split into 2 files we've built an app to improve our recollection of people's names. That's developers at their best!

The final step is to deploy onto your server and then setup a cron job to daily run the `node ./task.js` command. I'll leave that to you. Also, the [visage-grid repository](github.com/scottmotte/visage-grid) has instructions for deploying onto [Heroku](http://heroku.com).

## Resources

* [visage-grid repository](github.com/scottmotte/visage-grid)
* [SendGrid docs](http://sendgrid.com/docs/API_Reference/)
* [SendGrid node module](https://npmjs.org/package/sendgrid)
* [FullContact docs](http://www.fullcontact.com/developer/docs/)
* [FullContact node module](https://npmjs.org/package/fullcontact-api)
* [Installing Redis](https://www.digitalocean.com/community/articles/how-to-install-and-use-redis)
* [Hapi Node Framework](http://spumko.github.io/)

