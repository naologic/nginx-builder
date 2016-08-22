### nginx installer

This is a nginx installer + configuration + modules + patches for web speed and security.

Feel free to use, add, modify at will. Apart the normal build dependencies, it will install 
```lua 2.0``` (unless it's installed already), Google's ```brotli``` compression engine 
(better for large files), and a number of ```nginx``` modules. If you don't plan on using
all the modules, see the install files to disable them.  

This installer is for ```Ubuntu 14,15,16```


# Install 

``` 
git clone https://github.com/gp187/nginx-builder
cd nginx-builder/
chmod +x install.sh
sudo ./install.sh --full --steroids
```


# Modules
``` 
This is where I got the modules from to import them in the builder https://github.com/agile6v/awesome-nginx
```

# DEVMODE
_This is still in dev mode. Feel free to report bugs and use `ONLY` from `./install.sh`. I'm working on making it a service_ 


*** more to come ***