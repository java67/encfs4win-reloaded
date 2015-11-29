# EncFS4win Reloaded
EncFS4win Reloaded is a fork of EncFS4win, since the original project has not been updated since early 2013.
It provides:
- **Binaries** in /bin folder.
- **Easy 1-step build** on Visual Studio 2015: all necessary dependencies (source + pre-build libraries) and project files are available.
- **Community developments**: for now, encfs 1.9.0 (ported by jetwhiz), Dokany 0.7.4. Expect more updates to come.
- **Bugfix** for **read-only** files and network shares support.

## Download & Use

Install:

1. Install **[Dokany](https://github.com/dokan-dev/dokany/releases)**. Tested with 0.8.0 RC3 but 0.7.4 should have better support.
2. Extract **[encfs4win.zip](https://github.com/kriswebdev/encfs4win-reloaded/raw/master/bin/encfs4win.zip)**

You may eventually need Microsoft [Redistribuable Visual C++ 2015](https://www.microsoft.com/download/details.aspx?id=48145).

Run:

**CLI**: Open a command prompt and launch:
```
encfs <crypted_dir> <plain_dir>
```

NOTE: **Use a drive (like `X:`)** as `<plain_dir>` to avoid case sensitive problems which results in file/folder not found problems. To change the drive label, use `encfs <crypt_dir> <plain_dir> -- -o volname=<label>`

NOTE: GUI (encfsw) is not compatible with EncFS4Win Reloaded v2. If you want it, consider downloading v1 (see [Releases](https://github.com/kriswebdev/encfs4win-reloaded/releases)).

## Build

Instructions are for Visual Studio 2015. Library dependencies are already pre-built for Release config.

1. (Optionnal for Release) Open `dokany\dokan.sln` and Build > Build Solution (or Build dokan-fuse only)
2. (Optionnal for Release) Open `rlog\win32\rlog.sln` and Build > Build Solution
3. **Open `encfs\msvc\encfs.sln` and Build > Build Solution**

Binaries and necessary DLL are copied to root `bin\Release` folder (or `bin\Debug` for Debug config).

NOTE: Build instructions are not provided for Win32 OpenSSL and Boost C++. See versions.txt for all source links and check the official websites for build instructions.

## Credits

[jetwhiz/encfs4win](https://github.com/jetwhiz/encfs4win), [freddy77/encfs4win](https://github.com/freddy77/encfs4win), [rustyx/encfs4win](https://github.com/rustyx/encfs4win), [dokan-dev/dokany](https://github.com/dokan-dev/dokany), [Win32 OpenSSL](https://slproweb.com/products/Win32OpenSSL.html), [Boost C++](http://www.boost.org/), [rlog](https://code.google.com/p/rlog/)...

See source files for licences, and [Boost Software licence](http://www.boost.org/users/license.html) as it is minimized.

## Official repository

EncFS4win Reloaded: https://github.com/kriswebdev/encfs4win-reloaded/
