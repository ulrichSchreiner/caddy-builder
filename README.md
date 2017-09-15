# caddy builder

This is a base image to build the caddy server. It can be used as a base image if you want to have custom plugins in your caddy server.

Create a directory with a `Dockerfile` and a `plugins.go` file where you must code the plugin paths of your plugins you want to have in your caddy server. 

As an example you can take a look at my [caddy-http](https://github.com/ulrichSchreiner/caddy-http) repository where i build a caddy server with the `prometheus` and a `git` plugin.
