# Mailtub

Begin by create a droplet on [digital ocean](https://www.digitalocean.com/droplets/new). Name it `mail` and make it 512 RAM. I choose San Francisco because that is nearest me. Make it Ubuntu 12.04 x64.

Cool, now ssh in.

```bash
ssh root@DROPLET_IP_ADDRESS
```

Install vim

```bash
apt-get remove vim-tiny
apt-get install vim
```

Install git

```bash
apt-get install git-core
```

Set the root user's password.

```bash
passwd
```

Restart ssh after that.

```bash
service ssh restart
```

Add a user.

```bash
adduser signatureio
```

Give the user privileges. 

```bash
visudo
```

Add the following.

```
root    ALL=(ALL:ALL) ALL
signatureio ALL=(ALL:ALL) ALL
```

Next to be extra safe let's change the ssh rules.

```bash
vim /etc/ssh/sshd_config
```

Set or add the following settings in that sshd_config file.

```
...
Port 25999
PermitRootLogin no
AllowUsers signatureio
...
```

Restart ssh.

```bash
service ssh restart
```

Ok, logout and login as the signatureio user.

```bash
ssh signatureio@IPADDRESS
```

Install oh-my-zsh

```bash
sudo apt-get update && sudo apt-get install zsh

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/9d2b5c841e251840d7965163f4eb9797bc0db49f/tools/install.sh | sh

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

chsh -s /bin/zsh
```

Install vundle.

```bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

Set your ~/.vimrc to look like the following.

[https://github.com/scottmotte/dotfiles/blob/master/vimrc](https://raw.github.com/scottmotte/dotfiles/master/vimrc)

Launch vim and run `:BundleInstall`.

Now, we can setup postfix.

```bash
sudo apt-get install postfix
```

Choose 'Internet Site' when the option is shown.

Enter the name of your domain for the system mail name.

Now, install go. (Check for the latest linux go [on this page](https://code.google.com/p/go/downloads/list).

```bash
wget https://go.googlecode.com/files/go1.1.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.1.2.linux-amd64.tar.gz
```

Add the following line into your `~/.zshrc` file.

```
export PATH=$PATH:/usr/local/go/bin
```

Then run.

```bash
source ~/.zshrc
```

Setup your go environment.

```bash
mkdir gocode
```

Open up .zshrc.

```bash
vim .zshrc
```

On the last line set the GOPATH.

```
export GOPATH="$HOME/gocode"
```

Now, we can create our project inside our gocode workspace.

```bash
cd gocode
mkdir -p src/github.com/scottmotte
```

Create the mailtub project.

```bash
cd src/github.com/scottmotte
mkdir mailtub
cd mailtub
vim mailtub.go
go get github.com/garyburd/redigo/redis
```

Paste the following into `mailtub.go`.

```go
package main

import "os"
import "time"
import "strconv"
import "io/ioutil"
import "github.com/garyburd/redigo/redis"

func main() {
  // Usage: echo 'stdin' | mailtub.go recipient@yourdomain.com"

  timestamp   := strconv.FormatInt(int64(time.Now().Unix()), 10)
  stdin       := os.Stdin
  args        := os.Args;
  recipient   := args[1];
  redisKey    := recipient + "|" + timestamp
  
  bytes, err := ioutil.ReadAll(stdin)

  if err != nil {
    panic(err)
  }

  c, err := redis.Dial("tcp", ":6379")
  if err != nil {
    panic(err)
  }

  defer c.Close()

  //set
  c.Do("SET", redisKey, string(bytes))

  //get
  keyValue, err := redis.String(c.Do("GET", redisKey))
  if err != nil {
    println("key not found")
  }
  println(keyValue)

  os.Exit(2)
}
```

Then run the following commands.

```bash
go get github.com/garyburd/redigo/redis
go build
```

Ok, now let's edit master.cf.

```
sudo vim /etc/postfix/master.cf
```

On the last line paste the following.

```
myhook unix - n n - - pipe
  flags=F user=root argv=/home/signatureio/gocode/src/github.com/scottmotte/mailtub/mailtub ${sender} ${size} ${recipient}
```

Let's stay in master.cf. We must now tell Postfix when to run that script.

To do this, let's edit the smtp line and change it this way:

```
smtp      inet  n       -       -       -       -       smtpd    -o content_filter=myhook:dummy
```

The -o content_filter=myhook:dummy tells Postfix to run the filter for any mail arriving via the SMTP delivery. Please note that is you are sending mails using the "sendmail" command, the filter will not trigger. In this case, add the option after the "pickup" delivery method:

```
pickup    fifo  n       -       -       60      1       pickup    -o content_filter=myhook:dummy
```

Reload postfix.

```bash
sudo postfix reload
```


Setup a catch all.

```bash
sudo vim /etc/postfix/virtual
```

Paste in.

```
@signature.io signatureio
```

Save and close and run:

```bash
sudo postmap /etc/postfix/virtual
```

Also make sure you have the following in /etc/postfix/main.cf

```
virtual_alias_maps = hash:/etc/postfix/virtual
```

Reload postfix.

```bash
sudo service postfix reload
```

Now, install redis.

```bash
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install tcl8.5
```

Download redis (latest at writing was 2.6.16).

```bash
wget http://download.redis.io/releases/redis-2.6.16.tar.gz
tar xzf redis-2.6.16.tar.gz
cd redis-2.6.16
make
make test
sudo make install
cd utils
sudo ./install_server.sh
```

Now start and stop it as you need.

```bash
sudo service redis_6379 start
sudo service redis_6379 stop
```
