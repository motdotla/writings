# Creating your first heroku buildpack

Did you know you can install custom software on [Heroku](http://heroku.com)? You can, using [buildpacks](https://devcenter.heroku.com/articles/buildpacks).

In this tutorial, I show you how to write a custom buildpack. I'll use [MuPDF](http://www.mupdf.com/) as an example. Replace the MuPDF parts with the binary you want. 

[MuPDF](http://www.mupdf.com/) is a PDF viewer. It's handy for converting PDFs to PNGs.

## Create the binary

Before we can create the buildpack we need to create the binary on the Heroku server environment.

### Make the binary

Begin by creating a heroku app.

```
heroku create buildpack-stager
heroku run bash --app buildpack-stager
```

Then ssh into the server.

```
heroku run bash --app buildpack-stager
```

Make the binary.

```
curl -O https://mupdf.googlecode.com/files/mupdf-1.3-source.tar.gz
tar -xvzf mupdf-1.3-source.tar.gz
cd mupdf-1.3-source
make
DESTDIR=/app make install
```

Cool, that installs everything to `/app/usr/local`.

### Archive the binary

Now let's archive the generated binary files. The buildpack expects the binary in archived form.

```
cd ~
tar czf mupdf.tar.gz -C /app/usr/local .
```

### Transfer the archive to your local machine

There are a number of ways to do this, but I prefer using [srvdir](http://srvdir.net). It's easiest.

While still in the Heroku runtime environment.

```
curl https://raw.githubusercontent.com/scottmotte/srvdir-binary/master/srvdir.tar.gz -O -ssl3
tar -zxvf srvdir.tar.gz
./srvdir
```

Then on your local computer open [Google Chrome](https://google.com/chrome).

Visit the url `https://your-unique-url.srvdir.net/mupdf.tar.gz`. It will download the tar.gz to your machine.

### Host the archive remotely

The buildpack needs a way to access the archive over the internet. Let's host it remotely on [GitHub](http://github.com). 

On your local machine do the following.

```
mkdir mupdf-binary
cd mupdf-binary
cp ~/path/to/mupdf.tar.gz mupdf.tar.gz
git init
git add .
git commit -am "Initial commit"
```

Push that repo to GitHub. Now you can download it as a url like this:

[https://raw.githubusercontent.com/your_username/mupdf-binary/master/mupdf.tar.gz](https://raw.githubusercontent.com/scottmotte/mupdf-binary/master/mupdf.tar.gz)

Be sure to replace with your username.

You can see an example of this [here](https://github.com/scottmotte/mupdf-binary).

## Create the buildpack

We've prepared the binary, archived it, and saved it somewhere on the internet. We're finally ready to write the buildpack code. This is the easy part.

```
mkdir something-buildpack
cd something-buildpack
mkdir bin
cd bin
touch compile
touch detect
touch release
chmod 775 compile
chmod 775 detect
chmod 775 release
```

Edit compile.

```
#!/usr/bin/env bash

echo "-----> Installing MuPDF 1.3"

# change to the the BUILD_DIR ($1)
cd $1

# download the binary (-O) silently (-s)
curl https://raw.githubusercontent.com/scottmotte/mupdf-binary/master/mupdf.tar.gz -s -O -ssl3

# make a directory to untar (like unzip) the binary
mkdir -p vendor/mupdf

# untar the binary to the directory we want
tar -C vendor/mupdf -xvf mupdf.tar.gz
```

Edit detect

```
#!/usr/bin/env bash

echo "MuPDF 1.3"
exit 0
```

Edit release.

```
#!/usr/bin/env bash

cat <<EOF
---
config_vars:
  PATH: $PATH:/app/vendor/mupdf/bin
EOF
```

That's it. Commit that code and push it up to [GitHub](https://github.com/scottmotte/heroku-buildpack-mupdf).
 
You just created your first buildpack for Heroku. Repeat the process for other types of binaries.

You can run the buildpack like [this](https://github.com/scottmotte/heroku-buildpack-mupdf#usage).

```
heroku create -b https://github.com/scottmotte/heroku-buildpack-mupdf.git

# or if your app is already created
heroku config:add BUILDPACK_URL=https://github.com/scottmotte/heroku-buildpack-mupdf.git

git push heroku master
```
