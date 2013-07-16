**this article is uncompleted**

# Getting started with python

* brew install python
* mkdir hello
* cd hello
* vim hello.py
* paste in

```
#!/usr/bin/env ptyhon
print "hello world"
```

* run it

```
python hello.py
```

Now let's build something with Flask.

```
pip install virtualenv
virtualenv moviegrid
cd moviegrid
source bin/activate
pip install Flask
pip install gunicorn
pip freeze > requirements.txt
gunicorn moviegrid:app
pip install -r /path/to/requirements.txt
```

pip is a package manager that comes with your install of python.
