# vapp
This is the skeleton for a basic app. The idea is that this is the core. Everything extends this.

For how to extend this properly and make use of this repository, see: https://github.com/nxvapps/vapp-template

## Components
There are a few critical components

### X11 Session
This is what powers everything. We run the app directly in an X11 session with no desktop.

### VirtualGL
This is what allows us to GPU accelerate raw X11 sessions and is critical to this project.

### XPRA
This is how we deliver any app to the frontend browser. We extend the previous X!! session accelerated
with VirtualGL

### app_install.sh
This file, located at `files/root-files/root/app_install.sh`, is what is used to install the app during
the docker build routine. Add unique requirements here.

### app_run.sh
This file, located at `files/root-files/root/app_run.sh` is the file that specifies unique actions for
the app at runtime.

### root-files
This folder, located at `files/root-files`, if specified in your project will override any file in the files/root-files of this project.
The intention is that you can override any file if unique issues present themselves.
