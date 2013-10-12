# Sending Email from Cloudfoundry Applications with Sendgrid

A few weeks ago SendGrid released their [sendgrid-java helper library](https://github.com/sendgrid/sendgrid-java). The library goes a step further in sticking with Cloud Foundry's "it just works" experience and making your life as a developer easier.

Previously, you had to write a large amount of boilerplate code using [JavaMail](https://javamail.java.net/nonav/docs/api/). Now, you can send email with just a few lines of code.

## How does it work

Add [SendGrid](http://sendgrid.com) as a service and bind it your app.

```bash
cf create-service sendgrid
cf bind-service
```

Next, show your VCAP_ENVIRONMENT variables.

```bash
cf restart yourapp
cf files yourapp logs/env.log
```

Inside there will be your sendgrid username and password. Note those values.

[Install the sendgrid-java library](https://github.com/sendgrid/sendgrid-java#installation) and add the following code to your project - replacing the sendgrid_username and sendgrid_password with the values you noted in your VCAP_ENVIRONMENT variables.

```java
import com.github.sendgrid.SendGrid;
SendGrid sendgrid = new SendGrid("sendgrid_username", "sendgrid_password");

sendgrid.addTo("example@example.com");
sendgrid.setFrom("other@example.com");
sendgrid.setSubject("Hello World");
sendgrid.setText("My first email through SendGrid");

sendgrid.send();
```

That's it. Now you can start sending emails from your Java application!

For a quick demo of Cloud Foundry + SendGrid (and to try it for yourself), just follow the easy steps in this example video.

And Cloud Foundry developers can send **25,000 emails every month for free**.
