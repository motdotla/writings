# Flossed Today

New Year's resolutions are difficult to keep. I've found the best way to keep them is to have someone remind you - nag you really.

Likely, your friends' don't want to spend their free moments nagging you though. Let's have SendGrid do it instead. :)

As you're likely aware SendGrid has a [mail api](http://sendgrid.com/docs/API_Reference/Web_API/mail.html). But, we also have an inbound [Parse API](http://sendgrid.com/docs/API_Reference/Webhooks/parse.html). We can combine the two to act like a person reminding us of our New Year's resolution. 

How? We'll send an email each day asking if we did our new year's resolution. If we reply yes, the app will stop sending reminders that day. If we don't reply, it will send us another reminder later in the day. Essentially, this will nag us until we say 'Yes'. I like this concept. It's a friendly nag.

I've built an example of this that you can use. It's called [Flossed Today](http://github.com/scottmotte/flossedtoday) and it reminds me to floss. You can use the existing version [here](http://haveyouflossedtoday.herokuapp.com) or [deploy it to your own server](http://github.com/scottmotte/flossedtoday).

How does this work? There is a background task that delivers the reminder email. The gist of that code looks like this:

```
Reminder.send = function(to, fn) {
  var payload = {
    to:       to,              
    replyto:  c.REPLYTO,       
    from:     c.FROM,          
    subject:  c.SUBJECT,       
    text:     c.BODY           
  }
  
  sendgrid.send(payload, function(err, json) {
    if (err) { 
      fn(err, null);           
    } else {                   
      fn(null, json);          
    };
  });
};
```

Then the app needs a way to capture replies of 'Yes' from the user. For this we use SendGrid's Inbound Parse API.  

```
var inbound = {
  index: {
    handler: function (request) {
      var payload = request.payload;

      console.log(payload);

      if (payload.envelope) { envelope  = JSON.parse(payload.envelope) };

      var reply_html = payload.html.replace(c.BODY, "").toLowerCase();

      if (reply_html.indexOf("yes") >= 0) {
        Reminder.answeredYes(envelope.from, function(err, res) {
          request.reply({success: true});
        });
      } else {
        console.log("Reply did not include 'Yes'");

        request.reply({success: true});
      }
    }
  }
}
```

I'm using [hapijs](http://hapijs.com) to build the /inbound route. That route captures the payload delivered by SendGrid, parses it, and checks for a 'Yes' response. If there is a 'Yes' response, it marks the Reminder as answered 'Yes', and doesn't send another reminder until the next day.

The final step is to add this url route to the [/developer/reply](http://sendgrid.com/developer/reply). It should look something like the following.

![](https://raw.github.com/scottmotte/flossedtoday/master/inbound-setup-example.png)

Full instructions are on [GitHub](http://github.com/scottmotte/flossedtoday).

Enjoy your New Year's and show off those pearly whites!

