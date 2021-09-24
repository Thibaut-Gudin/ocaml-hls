# ocaml-hls

Binding to [hls.js](https://github.com/video-dev/hls.js/)

## What does ocaml-hls do ?

This library allows you to add `hls` video players (from the `hls.js`
library) into your ocaml app. It is indeed bound to `hls.js` using gen_js_api.

> HLS.js is a JavaScript library that implements an HTTP Live Streaming
  client. It relies on HTML5 video and MediaSource Extensions for
  playback.
  I works by transmuxing MPEG-2 Transport Stream ans AAC/MP3 streams
  into ISO BMFF (MP4) fragments. Transmuxing is performed asynchronously
  using a Web Worker when available in the browser. HLS.js also support
  HLS + fmp4, as announce during WWDC2016.


Source: [hls.js official documentation](https://github.com/video-dev/hls.js/#readme)

The binding isn't done completely, there is still some types and
function that are missing some value, see the `hls.mli` file for more
details. If there is some missing values in this plugin that would be
useful for your project, feel free to complete this library and to make
a pull request to the master branch.

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
opam install hls
```


## How to use it?

We will present the main functions of this plugin. See the [hls
API](https://github.com/video-dev/hls.js/blob/master/docs/API.md) and
the
[src.hls.mli](https://github.com/besport/ocaml-hls/blob/master/src/hls.mli)
file for more details.

The first function you need to use in this plugin `Hls.new_hls ()`, it
creates a new *hls* video player in the form of a `video_elt` object
that must be used as the first argument of several functions that will apply
changes in your player. The `Hls.new_hls` function takes a `config` value
as an optional argument: it allows you to define several parameters in
your HLS players.

Example:

```Ocaml
let config = Hls.config ~auto_start_load:true ~max_buffered_length:150
() in
let hls = Hls.new_hls ~config () in
[...]
```

The current `config` definition isn't complete for now, some of the most
complex typing defnitions aren't finish yet: those values wasn't used
for the project that initiate that library, only the structure was
initiated. Feel free to complete `src/hls.mli` if necessary.

## Link a video to your player

The function `Hls.attach_media` must be used to add a video to your
player, this function takes an argument of type `Dom_html.element Js.t`
from the `Js_of_ocaml` library. You can obtain that kind of value with
functions like `Html.To_dom.of_element`, see the [Js_of_ocaml official
library](https://ocsigen.org/js_of_ocaml/latest/manual/overview) for more
details.

## `Hls.on item event callback`

The function allows you to add, in the `item` hls_item, the `callback`
function that will be executed every time an event of type `evt` is
raised. The callback takes 2 arguments: an *Ojs.t* value and a *Data.t*
value.

### `Hls.Events`

This module regroups all the different events that can occur during the
player execution, for example `Hls.Events.error` is raised when an error
occurs.

### `Hls.Data`

This module contains all the function you need to extract value from a
*Data.t* element, it can for example, indicates the current error_type of
an `error` event.
