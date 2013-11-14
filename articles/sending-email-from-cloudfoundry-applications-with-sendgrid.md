# Sending Email from Cloud Foundry Applications with SendGrid

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

[Install the vcapenv library](https://github.com/scottmotte/vcapenv), and [Install the sendgrid-java library](https://github.com/sendgrid/sendgrid-java#installation). 

Then add the following code to your project.

```java
import com.github.scottmotte.Vcapenv;
import com.github.sendgrid.SendGrid;

Vcapenv vcapenv = new Vcapenv();
String sendgrid_username = vcapenv.SENDGRID_USERNAME();
String sendgrid_password = vcapenv.SENDGRID_PASSWORD();

SendGrid sendgrid = new SendGrid(sendgrid_username, sendgrid_password);

sendgrid.addTo("example@example.com");
sendgrid.setFrom("other@example.com");
sendgrid.setSubject("Hello World");
sendgrid.setText("My first email through SendGrid");

sendgrid.send();
```

That's it. Now you can start sending emails from your Java application! Cloud Foundry developers can send **25,000 emails every month for free**. Check out [Cloud Foundry's documentation page](http://docs.cloudfoundry.com/docs/dotcom/marketplace/services/sendgrid.html) to get started

## Video Demo

For a working demo of Cloud Foundry + SendGrid, just follow the easy steps in this example video. It uses the [example spring-attack app](https://github.com/scottmotte/spring-attack).

[![](https://raw.github.com/scottmotte/writings/master/images/cloudfoundry+sendgrid.png)](https://vimeo.com/76770369)
