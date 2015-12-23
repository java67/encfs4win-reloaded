# About
EncFS4win Reloaded is a fork of EncFS4win, a Windows port of the encrypted filesystem [EncFS](https://en.wikipedia.org/wiki/EncFS), as the original port is not updated since 2013.

It provides:
- **Binaries** in /bin folder.
- **Easy 1-step build** on Visual Studio 2015: all necessary dependencies (source + pre-build libraries) and project files are available.
- **Community developments**: encfs 1.9.0 (ported by jetwhiz) that solves some [security issues](https://defuse.ca/audits/encfs.htm) and Dokany 0.7.4. Expect more updates to come.
- **Bugfix** for **read-only** files and network shares support.

## Download & Use

Install:

1. Install **[Microsoft Redistribuable Visual C++ 2015](https://www.microsoft.com/download/details.aspx?id=48145) x86**.
2. Install **[Dokany v0.7.4](https://github.com/dokan-dev/dokany/releases/tag/v0.7.4)** (no v8 support yet).
3. Extract **[encfs4win.zip](https://github.com/kriswebdev/encfs4win-reloaded/raw/master/bin/encfs4win.zip)**

Run:

**CLI**: Open a command prompt and launch:
```
encfs <crypted_dir> <plain_dir>
```

NOTES:
- **Use a drive (like `X:`)** as `<plain_dir>` to avoid case sensitive problems which results in file/folder not found problems. To change the drive label, use `encfs <crypt_dir> <plain_dir> -- -o volname=<label>`
- GUI (encfsw) is not compatible with EncFS4Win Reloaded v2. If you want it, consider downloading v1 (see [Releases](https://github.com/kriswebdev/encfs4win-reloaded/releases)).
- Facing an issue? Enable debugging output with `encfs -f -v -d <crypted_dir> <plain_dir>`
- EncFS4Win is currently not compatible with Paragon ExtFS due to Dokany dependency conflict. Properly unistall this software if you have it and then reinstall Dokany 0.7.4.

## Build

Instructions are for Visual Studio 2015. Library dependencies are already pre-built for Release config.

1. (Optionnal for Release) Open `rlog\win32\rlog.sln`, select `Release` `x86`, select `rlog` in Solution Explorer pan and Build > Build rlog
2. (Optionnal for Release) Open `dokany\dokan.sln`, select `Release` `x86`, select `dokan-fuse` in Solution Explorer pan and Build > Build Solution
3. **Open `encfs\encfs\encfs.sln`, select `Release` `x86` and Build > Build Solution**

Binaries and necessary DLL are copied to root `bin\Release` folder (or `bin\Debug` for Debug config).

NOTES:
- Build instructions are not provided for Win32 OpenSSL. Pre-built library come from the official sites.
- Boost C++ is already pre-compiled. You can also build it yourself by running tools\minimize-boost.bat and following instructions.
- x64 build and Debug build are not supported/implemented.

## Credits

[jetwhiz/encfs4win](https://github.com/jetwhiz/encfs4win), [vgough/encfs](https://github.com/vgough/encfs), [freddy77/encfs4win](https://github.com/freddy77/encfs4win), [rustyx/encfs4win](https://github.com/rustyx/encfs4win), [dokan-dev/dokany](https://github.com/dokan-dev/dokany), [Win32 OpenSSL](https://slproweb.com/products/Win32OpenSSL.html), [Boost C++](http://www.boost.org/), [rlog](https://code.google.com/p/rlog/)...

See source files for licences, and [Boost Software licence](http://www.boost.org/users/license.html) as it is minimized.

## Official repository

EncFS4win Reloaded: https://github.com/kriswebdev/encfs4win-reloaded/
