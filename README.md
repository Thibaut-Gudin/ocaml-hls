# ocaml-hls

Binding to [hls.js](https://github.com/video-dev/hls.js/)

## What does ocaml-cordova-plugin-googleplus do ?

[TODO]

## How to install and compile your project by using this plugin ?

You can use opam by pinning the repository with:
```Shell
opam pin add hls https://github.com/besport/ocaml-hls
```

to compile your project, use:
```Shell
dune build @install
```

Finally, install the `hls` plugin with:
```Shell
cordova plugin add hls
```


## How to use it?

See the [hls
API](https://github.com/video-dev/hls.js/blob/master/docs/API.md) for
more details

### Create a new `HLS` item

The main function `Hls.new_hls` returns an `hls_item` value that can be
used for other functions. It can take a `config` value as an optional
argument: it allows you to define several parameters in your HLS
player.

!! This current `config` definition isn't complete for now, some of the
   more complex typing definition aren't finish yet: those values
   wasn't used for the project that initiate that library only the
   structure was initiate. You you need one of those more complex
   `config` arguments in your own ocaml mobile app, feel free to complete
   the "src/hls.mli" file and push a Pull-Request to the main fork !!

[TODO]
