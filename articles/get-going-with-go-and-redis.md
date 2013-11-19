# Get Going with Go and Redis

Go is a promising language. It's a strong replacement for Java, it's similarly productive to writing Python, and it is an excellent tool for writing servers.

I'm starting to dive into it in my spare time, and in this blog post I will show you the basics of getting started with Go and Redis together.

## Setup

### Install Go

Install Go. As of writing [this](https://go.googlecode.com/files/go1.1.2.darwin-amd64.pkg) was the latest version.

You can find the list of all available downloads by clicking from [the go download page](http://golang.org/doc/install).

### Install Mercurial

You must have Mercurial installed for the `go get` command to work. So let's install Mercurial.

```bash
brew update   
brew doctor
brew install mercurial
```
### Setup GOPATH

Create your go workspace. This is just the way go works. Do the following.

```bash
mkdir gocode
```

Open up .bashrc (or .zshrc if using zsh).

```bash
vim .bashrc
```

On the last line set the GOPATH.

```bash
export GOPATH="$HOME/gocode"
```

### Create your project inside your workspace 

Now, we can create our project inside our gocode workspace.

```bash
cd gocode
mkdir -p src/github.com/yourusername
```

## Code

Cool, now let's create the redis go project.

### Create the hello-go-redis project

```bash
cd src/github/username
mkdir hello-go-redis
cd hello-go-redis
vim hello-go-redis.go
```

Paste the following into `hello-go-redis.go`.

```go
package main

import "fmt"
import "github.com/garyburd/redigo/redis"

func main() {
  fmt.Printf("hello, go\n")
  //INIT OMIT
  c, err := redis.Dial("tcp", ":6379")
  if err != nil {
    panic(err)
  }

  defer c.Close()

  //set
  c.Do("SET", "hello", "world")

  //get
  world, err := redis.String(c.Do("GET", "hello"))
  if err != nil {
    fmt.Println("key not found")
  }

  fmt.Println(world)
  //ENDINIT OMIT
}
```

Get redis.

```bash
go get github.com/garyburd/redigo/redis
```

### Run it

```bash
go run hello-go-redis.go
```
