# Part 2: Remember People’s Names with a Digestible Daily Email

In a previous blog post, I showed you how to [remember people's names with a digestible daily email](http://blog.sendgrid.com/remember-peoples-names-with-an-easily-digestible-daily-email/). I've been using the approach daily. 

It has been helpful but has had one big downside. It requires me to make an API call by hand every time I want to add a person to the database. This is tedious. Let's change that by automating it.

[SendGrid's Parse API](http://sendgrid.com/docs/API_Reference/Webhooks/parse.html) can help us here.

## The Approach

The majority of people's names I want to remember are people I have interacted with over email. Likely I met them in person, followed up with them over email, and might run into them again in my travels.

So let's forward all our emails to SendGrid's Parse API, pull out the email addresses from the contents of the email, and save that to our database. Now our database of people's names will automatically grow as our network grows.

Let's get to building.

## Setup the MX records

To begin, we must add SendGrid's MX Record to a web domain we own. This will allow us to forward all emails to SendGrid's Parse API.

Go to your domain's DNS dashboard and add the MX record `m.yourdomain.com` with the value of `mx.sendgrid.net`.

[screenshot here]

Next, setup the SendGrid Parse API. Go to [http://sendgrid.com/developer/reply](http://sendgrid.com/developer/reply). Set your hostname to `m.yourdomain.com` and set your url as `https://yoursubdomain.herokuapp.com/emails/parse`.

[screenshots here]

Now you can send an email to `email@m.yourdomain.com`, and SendGrid's Parse API will receive it, and make a POST request to  `https://yoursubdomain.herokuapp.com/emails/parse`.

Awesome. Now, we can write the code to parse that incoming email data.

## The Code

In app.js add the following code.

```javascript
…

function findEmailAddresses(text) {
  var emails = text.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);
  return emails;
}

var emails      = {
  …
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

In the code above, we are setting up a route to catch the incoming email at /emails/parse. Then we get an array of email addresses out of that email. Finally, we add those emails to our database.

We're almost there. The final step is to forward all our incoming emails.

## Forward Your Emails

In GMail go to Settings > Forwarding & POP/IMAP and add a forward address to email@m.yourdomain.com. 

[screenshot]

That's it. You are done. As you naturally use your email, this app will build a list of various people and email you about them - helping you to remember their names.

The source code is [available here](https://github.com/scottmotte/visage-grid).
