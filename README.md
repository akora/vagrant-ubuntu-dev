### Virtualised Ubuntu 18.04 with Python, Python3, Ruby, NodeJS, NPM

Based on HashiCorp's "ubuntu/bionic64" box.

The base VM is built as described in the `Vagrantfile` and `bootstrap.sh`.

Start the process by running

``` shell
vagrant up
```

Once the VM is ready, issue

``` shell
vagrant ssh
```

#### Tested on

* MacOS High Sierra 10.13.6
* VirtualBox 5.2.16r123759
