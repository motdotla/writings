# Beginners Guide to Go

[Go](http://golang.org/) is an increasingly popular language. It's fast, easy to get started with, and is proving useful for building systems at scale.

In this tutorial, I show you how to get started with golang.

## Installation

Installation on a mac is as easy as downloading the Mac package installer. [Click here](http://code.google.com/p/go/downloads/list?q=OpSys-OSX+Type-Installer) to download and install.

For other operating systems, the [instructions are here](http://golang.org/doc/install), and also quite easy.

## Test your installation

Create a file named hello.go and put the following program in it.

```go
package main

import "fmt"

func main() {
    fmt.Printf("hello, world\n")
}
```

Run that file.

```
go run hello.go
```

If you saw 'hello, world' output to your screen then your installation is working.

You're not quite done though yet. You need to setup a workspace in Go.

## Golang workspace

You must setup your workspace correctly in go. Unlike other languages, this is very important. 

A workspace is made up of 3 directories.

* src
* pkg
* bin

Let's create this workspace and it's contents.

```
mkdir -p ~/go/bin
mkdir -p ~/go/pkg
mkdir -p ~/go/src
```

Now, let's specify the location of that workspace in our PATH.

```
vim .zshrc  # this might be .bashrc for you
```

Towards the end of that file add the following.

```
export GOPATH=$HOME/go
```

Finally, add your github.com user directory to the workspace. This should use the username of your [GitHub](http://github.com) profile.

```
mkdir -p $GOPATH/src/github.com/your_username
```

## Hello World in Go

Now, we can create our first go program. 

```
mkdir -p $GOPATH/src/github.com/your_username/hello-go
cd $GOPATH/src/github.com/your_username/hello-go
vim hello-go.go
```

Inside that file, paste the following.

```
package main

import "fmt"

func main() {
  fmt.Printf("Hello, world.\n")
}
```

Install and build that program using the go tool.

```
go install github.com/your_username/hello-go
```

That installs the program as a binary to $GOPATH/bin/hello-go. Try running it.

```
$GOPATH/bin/hello-go
```

You should see the output 'Hello, world.'. Congrats, you wrote your first go program.

## Install GoVim

I'm a vim user. I recommend installing Go Vim.

```
cd ~/.vim/bundle
git clone https://github.com/fatih/vim-go.git
```




