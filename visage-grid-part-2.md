# visage-grid II

This is part II of visage-grid. You can read part I here.

In part I, I showed you how to receive a daily digestible email with people's names and their faces. It helped you remember people's names better.

There was a big downside though. It required you to make an API call to add people's names to the database it pulled from. Wouldn't it be nicer to automatically add emails as you communicate with people. 

In part II, I am going to show you how to do that.

We can use SendGrid's parse API to make this a reality. 

First, let's setup the SendGrid parse API. Go to [http://sendgrid.com/developer/reply](http://sendgrid.com/developer/reply). Set your hostname to `m.yourdomain.com` and set your urls as `https://yoursubdomain.herokuapp.com/emails/parse`.

Next, go to your domain's DNS dashboard and add the MX record with your hostname `m.yourdomain.com` with the value of `mx.sendgrid.net`.

Finally, setup all your emails to forward to `email@m.yourdomain.com`.

Ok, now that we have done that, we can add the appropriate code to visage-grid to catch that incoming email, parse it, and add the person's email address to the database.

In app.js add the following code.

```javascript
var emails      = {
  ...
  parse: {
    handler: function(request) {
      var payload = request.payload;
      var emails  = findEmailAddresses(payload.text);

      emails.forEach(function(email) {
        db.sadd("emails", email); 
      });

      request.reply({
        success: true
      });
    }
  }
};

server.route({
  method    : 'POST',
  path      : '/emails/parse',
  config    : emails.parse
});
```

What we have done here is added a POST route at /emails/parse. You can see that the payload comes in, and then we get the emails out of the payload.text for that email.

The findEmailAddress function looks like the following.

```javascript
function findEmailAddresses(text) {
  var emails = text.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);
  return emails;
}
```

Power of regexes. It returns an array of all the email addresses contained in that email.

There you go. All of that combined does a nice job of replacing the crusty curl request. Now as you naturally use your email, visage-grid will build a list of various people and email you about them - helping you to remember their names. 

