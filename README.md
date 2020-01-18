# purpose
Provide maximum performance when users are expected to be using the device.

# how to use
Customize the two timer units under `init` to change the start time for switching CPU governors.  The default is:
* Use ondemand at 10 PM ever day.
* Use performance starting at 1 PM M-F and starting at 5 AM on the weekend.

# how to install
Use the provided `PKGBUILD` (Arch) or `Makefile` to install.

```
$ make

# make install
```

