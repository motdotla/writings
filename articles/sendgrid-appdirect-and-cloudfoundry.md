# SendGrid, AppDirect, and Cloud Foundry 

![](https://raw.github.com/scottmotte/writings/master/images/sendgrid-appdirect-cloudfoundry-0.png)

[Cloud Foundry](http://www.cloudfoundry.com/) makes developers' lives easier. You can build, test, deploy, and scale applications quite quickly - freeing you up to focus on the core of your product. It's great, but what will prove to be even greater is the Cloud Foundry services.

## Services

The ability to quickly use services from Cloud Foundry adds a lot of power to you the developer. You can add databases like [ClearDB](http://docs.cloudfoundry.com/docs/dotcom/marketplace/services/cleardb.html), [MongoLab](http://docs.cloudfoundry.com/docs/dotcom/marketplace/services/mongolab.html), and [Redis](http://docs.cloudfoundry.com/docs/dotcom/marketplace/services/rediscloud.html), application monitoring with [New Relic](http://docs.cloudfoundry.com/docs/dotcom/marketplace/services/newrelic/), or email sending with [SendGrid](http://docs.cloudfoundry.com/docs/dotcom/marketplace/services/sendgrid.html).

Did you know that you can also create your own services? You can, and you can add them to the marketplace. If you have a developer focused product, I'd highly recommend you do so. You'll be getting your product out to a developer audience, creating an additional revenue source, and making developers' lives easier.

## Creating your own service

I work with [SendGrid](http://sendgrid.com), and we did just that. We make developers lives easier by making it easy to send and receive [transactional email](http://sendgrid.com/transactional-email) from within your application. Now we do that on the Cloud Foundry platform too.

Here is how we approached it. You might want to do the same.

We teamed up with [AppDirect](http://www.appdirect.com/). They are a marketplace as a service. We integrated our API with them and it was pretty seamless. You could definitely do the same with your product.

AppDirect then integrated with [Cloud Foundry](http://cloudfoundry.com). This automatically put our service on the Cloud Foundry store and made our API accessible to any developer using Cloud Foundry.

That was it. Now developers are able to add our SendGrid API to their application with just a few lines typed into the terminal.

Finally, we created a [sendgrid-java library](github.com/sendgrid/sendgrid-java) to make it easier for developers using Java with Cloud Foundry as well as an example Spring application called [spring-attack](https://github.com/scottmotte/spring-attack).

## Conclusion

All in all, this SendGrid/AppDirect/Cloud Foundry 'trifecta' worked out really well. You should create your own trifecta. Talk to AppDirect and Cloud Foundry and make it happen.

And Cloud Foundry developers can send *25,000 emails every month for free*. Check out [Cloud Foundry's documentation page](http://docs.cloudfoundry.com/docs/dotcom/marketplace/services/sendgrid.html) to get started!
