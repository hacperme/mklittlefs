# mklittlefs

Tool to build and unpack [littlefs](https://github.com/ARMmbed/littlefs) images. Support littlefs v1.x.x and v2.x.x.
Based off of [mklittlefs](https://github.com/earlephilhower/mklittlefs) by earlephilhower.

## Usage

```
mklittlefs-v1 or mklittlefs-v2          {-c <pack_dir>|-u <dest_dir>|-l} 
                                        [-T <from_file>] [-d <0-5>] [-a] [-w <number>] 
                                        [-r <number>] [-b <number>] [-s <number>] [--] 
                                        [--version] [-h] <image_file>

Where:

   -c <pack_dir>,  --create <pack_dir>
     (OR required)  create littlefs image from a directory
         -- OR --
   -u <dest_dir>,  --unpack <dest_dir>
     (OR required)  unpack littlefs image to a directory
         -- OR --
   -l,  --list
     (OR required)  list files in littlefs image


   -T <from_file>,  --from-file <from_file>
     when creating an image, include paths in from_file instead of scanning
     pack_dir

   -d <0-5>,  --debug <0-5>
     Debug level. 0 means no debug output.

   -a,  --all-files
     when creating an image, include files which are normally ignored;
     currently only applies to '.DS_Store' files and '.git' directories

   -w <number>,  --prosize <number>
     fs pro size, in bytes

   -r <number>,  --readsize <number>
     fs read_size, in bytes

   -b <number>,  --block <number>
     fs block size, in bytes

   -s <number>,  --size <number>
     fs image size, in bytes

   --,  --ignore_rest
     Ignores the rest of the labeled arguments following this flag.

   --version
     Displays version information and exits.

   -h,  --help
     Displays usage information and exits.

   <image_file>
     (required)  littlefs image file

```
## Build

You need gcc (≥4.8) or clang(≥600.0.57), and xmake. On Windows, use MinGW.

Run:
```bash
$ git submodule update --init
$ xmake
```

On windows, use xmake and MinGW:

```bash
$ xmake f -p mingw --sdk=E:\workspace\tools\winlibs-x86_64-posix-seh-gcc-13.2.0-mingw-w64msvcrt-11.0.1-r2\mingw64
$ xmake
```


## License

MIT

## To do

- [ ] Add more debug output and print LittleFS debug output
- [ ] Error handling
- [ ] Code cleanup
