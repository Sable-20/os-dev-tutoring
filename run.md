# if you are on Windows

```
docker run --rm -it -v %cd%:/root/env myos-buildenv
```

# if you are on Linux or MacOS

```
docker run --rm -it ${pwd}:/root/env myos-buildenv
```

# to run the iso

```
qemu-system-x86_64 -cdrom dist/x86_64/kernel.iso
```
