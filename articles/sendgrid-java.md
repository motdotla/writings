# sendgrid-java

![](https://raw.github.com/scottmotte/writings/master/images/sendgrid-java.jpg)

Announcing [sendgrid-java](http://github.com/sendgrid/sendgrid-java) - a Java module for sending emails through SendGrid using Java. 

Go check it out and its documentation [here](https://github.com/sendgrid/sendgrid-java). 

## Why we created it

We created it to make your coding life easier.

You've always been able to send emails through SendGrid using Java. You could use one of Java's built in SMTP libraries to communicate with our SMTP API or you could use an http request library to communicate with our Web API. 

However, you had to write a large amount of boilerplate code for both of these approaches. I recently had to build a Java application using SendGrid, and I was discouraged with this boilerplate code.

As I coded the application, I started pulling pieces out into a SendGrid.java file. This evolved into the [SendGrid Java library](https://github.com/sendgrid/sendgrid-java) you see today.

## How to use it

To begin, add the library to your Java application. I recommend using [gradle](http://www.gradle.org/) for this (detailed instructions [here](https://github.com/sendgrid/sendgrid-java#installation)), but you can simply add the [SendGrid.java](https://github.com/sendgrid/sendgrid-java/blob/master/src/main/java/com/github/sendgrid/SendGrid.java) file to your project if you prefer.

Then where you need, initiate the SendGrid object with your SendGrid credentials.

```java
import com.github.sendgrid.SendGrid;
SendGrid sendgrid = new SendGrid("sendgrid_username", "sendgrid_password");
```

Add your message details.

```java
sendgrid.addTo("example@example.com");
sendgrid.addToName("Example Guy");
sendgrid.setFrom("other@example.com");
sendgrid.setSubject("Hello World");
sendgrid.setText("My first email through SendGrid");
```

And finally, send it.

```java
sendgrid.send();
```

Enjoy! As of writing, the library is at version [0.1.0](https://github.com/sendgrid/sendgrid-java/tree/v0.1.0) and is stable. If you run into any bugs file them on the [issues page](https://github.com/sendgrid/sendgrid-java/issues).
