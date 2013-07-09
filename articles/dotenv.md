# Dotenv - load environment variables from .env for nodejs projects

![dotenv](https://raw.github.com/scottmotte/writings/master/images/dotenv.jpg)

We like open source here at SendGrid. A lot of the tools we use are open source, and sometimes we create our own open source tools.

Recently, we created a small [node.js](http://nodejs.org) module for handling environment variables better. It's called [dotenv](https://github.com/scottmotte/dotenv) and is inspired by the [rubygem of the same name](https://github.com/bkeepers/dotenv).

## Why we created it

Building modern web applications requires a handful of environment variables that vary between deploys. The tenets of a [twelve-factor app](http://www.12factor.net/config) describe this well. For example, if you are building your own [SaaS](http://en.wikipedia.org/wiki/Software_as_a_service) product, you might have a [Stripe](http://stripe.com) secret key to process payments and a url to your [Postgres](http://www.postgresql.org/) database. Both of these will be different between production and development.

By putting these keys in environment variables, we give ourselves a couple advantages:

1. They are easily changeable between environments and even isolated deploys. This leads to less complex deploys which saves time and money.
2. There is a decreased chance of the production keys leaking out into the wrong hands or to a junior developer's hands. This leads to less chance that your database might maliciously or accidentally be wiped.

[Dotenv](https://github.com/scottmotte/dotenv) will help you get these advantages for your node.js projects. That's why we think you should use it. 

## How to use it

To begin, add the dotenv module to your node.js package.json file. Then as early as possible in your application require dotenv and call load().

```javascript
var dotenv = require('dotenv');
dotenv.load();
```

Finally, create a .env file to store your environment variables in the following format. It is recommended you do not commit this file to version control.

```
S3_BUCKET=YOURS3BUCKET
SECRET_KEY=YOURSECRETKEYGOESHERE
SENDGRID_USERNAME=YOURSENDGRIDUSERNAME
SENDGRID_PASSWORD=YOURSENDGRIDPASSWORDGOESHERE
```

Now, whenever your application loads, these variables will be available in process.env.

For example:

```javascript
var sendgrid_username = process.env.SENDGRID_USERNAME;
```

Enjoy. Some alternatives to [dotenv](https://github.com/scottmotte/dotenv) are [node-config](https://github.com/lorenwest/node-config) and [nconf](https://github.com/flatiron/nconf).
