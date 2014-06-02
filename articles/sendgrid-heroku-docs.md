[SendGrid](http://addons.heroku.com/sendgrid) is an [add-on](http://addons.heroku.com) for providing scalable email delivery and analytics for apps.

SendGrid's cloud-based email infrastructure relieves businesses of the cost and complexity of maintaining custom email systems. SendGrid provides reliable delivery, scalability and real-time analytics along with flexible APIs that make custom integration a breeze.

## Provisioning the add-on

SendGrid can be attached to a Heroku application via the  CLI:

<div class="callout" markdown="1">
A list of all plans available can be found [here](http://addons.heroku.com/sendgrid) .
</div>

    :::term
    $ heroku addons:add sendgrid:starter
    -----> Adding sendgrid:starter to sharp-mountain-4005... done, v18 (free)

Once SendGrid has been added a `SENDGRID_USERNAME`, `SENDGRID_PASSWORD` settings will be available in the app configuration and will contain the credentials used to access the newly provisioned SendGrid service instance. This can be confirmed using the `heroku config:get` command.

    :::term
    $ heroku config:get SENDGRID_USERNAME
    appXYZ@heroku.com

    $ heroku config:get SENDGRID_PASSWORD
    password

After installing SendGrid the application should be configured to fully integrate with the add-on.


## Ruby / Rails

If you're not using Rails and ActionMailer, or you are using the Cedar [stack](http://devcenter.heroku.com/articles/stack), you will need to setup your email framework manually; check out examples below.

If your Rails app is using ActionMailer and running on the Bamboo stack, Heroku will automatically configure your app on `git push` after the add-on is installed.

### ActionMailer

Note that a plugin to automatically configure ActionMailer for Rails is installed on our Bamboo stack. The following settings are necessary on Cedar, or for non-Rails apps using ActionMailer on Bamboo.

#### config/environment.rb

    :::ruby
    ActionMailer::Base.smtp_settings = {
      :address        => 'smtp.sendgrid.net',
      :port           => '587',
      :authentication => :plain,
      :user_name      => ENV['SENDGRID_USERNAME'],
      :password       => ENV['SENDGRID_PASSWORD'],
      :domain         => 'heroku.com',
      :enable_starttls_auto => true
    }

### Pony

We encourage developers to take a look at [Pony](http://github.com/benprew/pony) for something simpler than ActionMailer, yet more convenient than net/smtp.

    :::ruby
    Pony.options = {
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'heroku.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    }

### Mail
Install mail gem:
`gem install mail`

To send out emails through SendGrid, you need to configure the Mail class to have the correct values:

    :::ruby
    require 'mail'

    Mail.defaults do
      delivery_method :smtp, {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'heroku.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    end

Send an email.

    :::ruby
    Mail.deliver do
      to 'example@example.com'
      from 'sender@example.comt'
      subject 'testing send mail'
      body 'Sending email with Ruby through SendGrid!'
    end

## Node.js

<div class="callout" markdown="1">
The sendgrid npm module is fully tested and verified to work on the Cedar stack.
</div>

SendGrid has an official Node.js package. The code is open source and available on [Github](http://github.com/sendgrid/sendgrid-nodejs).

Add the following settings in package.json file

#### package.json
-----------------

    :::javascript
    {
      "name": "node-sendgrid-example",
      "version": "0.0.1",
      "dependencies": {
        "express": "3.1.x",
        "sendgrid": "0.3.0-rc.1.7"
      },
      "engines": {
        "node": ">= 0.4.7"
      }
    }

Install SendGrid locally with the following command:
`npm install`

#### program.js
-----------------
To begin using this library, initialize the sendgrid object with your SendGrid credentials:

    :::javascript
    var sendgrid  = require('sendgrid')(
      process.env.SENDGRID_USERNAME,
      process.env.SENDGRID_PASSWORD
    );

Send the email.

    :::javascript
    sendgrid.send({
      to: 'example@example.com',
      from: 'sender@example.com',
      subject: 'Hello World',
      text: 'Sending email with NodeJS through SendGrid!'
    }, function(err, json) {
    if (err) { return console.error(err); }
      console.log(json);
    });

Full documentation of all the features of SendGrid's Node.js package can
be found on [Github](http://github.com/sendgrid/sendgrid-nodejs)

## PHP

SendGrid has a PHP library that facilitates the adoption of SendGrid in PHP applications. The module's source code can be found at [Github](http://github.com/sendgrid/sendgrid-php).

Add SendGrid to your composer.json file.

    :::javascript
    {  
      "require": {
        "sendgrid/sendgrid": "2.0.5"
      }
    }

The following code is an example on how to send email using the module:

    :::php
    require 'vendor/autoload.php';
    $sendgrid = new SendGrid('YOUR_SENDGRID_USERNAME', 'YOUR_SENDGRID_PASSWORD');

    $message = new SendGrid\Email();
    $message->addTo('foo@bar.com')->
              setFrom('me@bar.com')->
              setSubject('Subject goes here')->
              setText('Hello World!')->
              setHtml('<strong>Hello World!</strong>');
    $response = $sendgrid->send($message);

Full documentation of all the features of SendGrid’s PHP library can be found on [Github](http://github.com/sendgrid/sendgrid-php).

## Java

This Java program will build a multi-part MIME email and send it through SendGrid. Java already has built in libraries to send and receive emails. This example uses [javamail](http://javamail.kenai.com/nonav/javadocs/javax/mail/internet/package-summary.html).

Add the following dependency to your pom.xml:

    :::xml
    <dependency>
        <groupId>javax.activation</groupId>
        <artifactId>activation</artifactId>
        <version>1.1</version>
    </dependency>
    <dependency>
        <groupId>javax.mail</groupId>
        <artifactId>mail</artifactId>
        <version>1.4</version>
    </dependency>

Java class:

    :::java
    import javax.mail.*;
    import javax.mail.internet.*;
    import javax.mail.Authenticator;
    import javax.mail.PasswordAuthentication;
    import java.util.Properties;

    public class SimpleMail {

        private static final String SMTP_HOST_NAME = "smtp.sendgrid.net";
        private static final String SMTP_AUTH_USER = System.getenv("SENDGRID_USERNAME");
        private static final String SMTP_AUTH_PWD  = System.getenv("SENDGRID_PASSWORD");

        public static void main(String[] args) throws Exception{
            new SimpleMail().test();
        }

        public void test() throws Exception{
            Properties props = new Properties();
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", SMTP_HOST_NAME);
            props.put("mail.smtp.port", 587);
            props.put("mail.smtp.auth", "true");

            Authenticator auth = new SMTPAuthenticator();
            Session mailSession = Session.getDefaultInstance(props, auth);
            // uncomment for debugging infos to stdout
            // mailSession.setDebug(true);
            Transport transport = mailSession.getTransport();

            MimeMessage message = new MimeMessage(mailSession);

            Multipart multipart = new MimeMultipart("alternative");

            BodyPart part1 = new MimeBodyPart();
            part1.setText("This is multipart mail and u read part1......");

            BodyPart part2 = new MimeBodyPart();
            part2.setContent("<b>This is multipart mail and u read part2......</b>", "text/html");

            multipart.addBodyPart(part1);
            multipart.addBodyPart(part2);

            message.setContent(multipart);
            message.setFrom(new InternetAddress("me@myhost.com"));
            message.setSubject("This is the subject");
            message.addRecipient(Message.RecipientType.TO,
                new InternetAddress("someone@somewhere.com"));

            transport.connect();
            transport.sendMessage(message,
            message.getRecipients(Message.RecipientType.TO));
            transport.close();
        }

        private class SMTPAuthenticator extends javax.mail.Authenticator {
            public PasswordAuthentication getPasswordAuthentication() {
                String username = SMTP_AUTH_USER;
                String password = SMTP_AUTH_PWD;
                return new PasswordAuthentication(username, password);
            }
        }
    }

## Dashboard

<div class="callout" markdown="1">
For more information on the features available within the SendGrid dashboard please see the docs at [sendgrid.com/docs](http://sendgrid.com/docs/Delivery_Metrics/index.html).
</div>

SendGrid offers statistics a number of different metrics to report on what is happening with your messages.
![ScreenShot](https://sendgrid.com/docs/images/delivery_metrics.png)

The dashboard can be accessed via the CLI:

    :::term
    $ heroku addons:open sendgrid
    Opening sendgrid for sharp-mountain-4005â€¦

or by visiting the [Heroku apps web interface](http://heroku.com/myapps) and selecting the application in question. Select SendGrid from the Add-ons menu.


## Migrating between plans

Plan migrations are easy and instant. Use the `heroku addons:upgrade` command to migrate to a new plan.

    :::term
    $ heroku addons:upgrade sendgrid:platinum
    -----> Upgrading sendgrid:platinum to sharp-mountain-4005... done, v18 ($399.95/mo)
           Your plan has been updated to: sendgrid:platinum

## Removing the add-on

SendGrid can be removed via the  CLI. If you accidentally remove the SendGrid add-on, re-adding SendGrid will resume your access to the account

    :::term
    $ heroku addons:remove sendgrid
    -----> Removing sendgrid from sharp-mountain-4005... done, v20 (free)

## Support

All SendGrid support and runtime issues should be submitted via on of the [Heroku Support channels](https://devcenter.heroku.com/articles/support-channels). Any non-support related issues or product feedback is welcome at [http://support.sendgrid.com/home](http://support.sendgrid.com/home).

## Additional resources

Additional resources are available at:

- [Integrate With SendGrid](http://sendgrid.com/docs/Integrate/index.html)
- [Code Examples](http://sendgrid.com/docs/Code_Examples/index.html)
 
