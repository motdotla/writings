# Creating your first heroku buildpack

```
gem install vulcan
vulcan create buildpack-you
```

Nice, now get the binary you want locally on your machine.

```
wget https://mupdf.googlecode.com/files/mupdf-1.3-source.tar.gz
tar -xvzf mupdf-1.3-source.tar.gz
vulcan build -v -s ./mupdf-1.3-source
```




-----


```
curl -O https://mupdf.googlecode.com/files/mupdf-1.3-source.tar.gz
tar -xvzf mupdf-1.3-source.tar.gz
cd mupdf-1.3-source
apt-get install make
apt-get install pkg-config
apt-get install libx11-dev
apt-get install x11proto-xext-dev
apt-get install libxext-dev
apt-get install build-essential
make
make install
```



It ends up in ./build/debug/mudraw 

```
make install DESTDIR=/app/vendor/
```

```
~/mupdf-1.3-source $ make install DESTDIR=/app/vendor/
install -d /app/vendor//usr/local/include/mupdf
install -d /app/vendor//usr/local/include/mupdf/fitz
install -d /app/vendor//usr/local/include/mupdf/pdf
install include/mupdf/*.h /app/vendor//usr/local/include/mupdf
install include/mupdf/fitz/*.h /app/vendor//usr/local/include/mupdf/fitz
install include/mupdf/pdf/*.h /app/vendor//usr/local/include/mupdf/pdf
install -d /app/vendor//usr/local/lib
install build/debug/libmupdf.a build/debug/libmupdf-js-none.a  /app/vendor//usr/local/lib
install -d /app/vendor//usr/local/bin
install build/debug/mudraw build/debug/mutool build/debug/mupdf-x11   build/debug/mupdf-x11-curl /app/vendor//usr/local/bin
install -d /app/vendor//usr/local/share/man/man1
install docs/man/*.1 /app/vendor//usr/local/share/man/man1
install -d /app/vendor//usr/local/share/doc/mupdf
install README COPYING CHANGES docs/*.txt /app/vendor//usr/local/share/doc/mupdf
```
