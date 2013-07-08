# Dotenv - load environment variables from .env for nodejs projects

We like open source here at SendGrid. A lot of the tools we use are open source, and sometimes we create our own open source tools.

Recently, we created a small node.js module for handling environment variables better. It's called [dotenv](https://github.com/scottmotte/dotenv) and is inspired by the [rubygem of the same name](https://github.com/bkeepers/dotenv).

To use it, add it to your node.js package.json file. Then as early as possible in your application require dotenv and load the .env variables.

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
