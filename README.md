# nginx installer

This is a nginx installer + configuration + modules + patches for web speed and security.

Feel free to use, add, modify at will. Apart the normal build dependencies, it will install 
```lua 2.0``` (unless it's installed already), Google's ```brotli``` compression engine 
(better for large files), and a number of ```nginx``` modules. If you don't plan on using
all the modules, see the install files to disable them.  

This installer is for ```Ubuntu 14,15,16```

## Dependencies
_Run a update first just to be sure. Type ```locale``` and check config. AWS usually has this problem. Check on how to fix `fix/aws_locale.sh`_

## Options
- `--full`    _Install server and clean existing repos_ 
- `--clean`   _Clean local files_ 
- `--compile` _Compile from existing directories_ 
- `--deps`    _Only dependencies_ 
- `--down`    _Only download modules_ 
## Server Configs
- `--simple`     _Simple web server with perfromance modules and standard configuration_
- `--simple_ssl` _Simple web server but with extra SSL features_
- `--steroids`   _Nginx, Lua, Lua Scripts, JWT, Imagemagik, Compression_


## Install 

``` 
git clone https://github.com/gp187/nginx-builder
cd nginx-builder/
chmod +x install.sh
sudo ./install.sh --full --steroids
```


## Modules
``` 
This is where I got the modules from to import them in the builder https://github.com/agile6v/awesome-nginx
```

## Known Errors
- `LC_ALL not set` _happens often on AWS instances. Make sure you set country or region you are in! [Fix is here](fix/aws_locale.sh)
- `aclocal-1.15 command not found` _common error due to default `automake` package which is `1.4`. [Fix is Here](fix/aclocal.sh)

## DEVMODE
_This is still in dev mode. Feel free to report bugs and use `ONLY` from `./install.sh`. I'm working on making it a service_ 


*** more to come ***