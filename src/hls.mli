type hls_item

val _Hls : unit -> hls_item [@@js.new "Hls"]

[@@@js.stop]

type video_elt = Js_of_ocaml.Dom_html.element Js_of_ocaml.Js.t

[@@@js.start]

[@@@js.implem type video_elt = Js_of_ocaml.Dom_html.element Js_of_ocaml.Js.t]

[@@@js.implem let video_elt_to_js = Obj.magic]

val attach_media : hls_item -> video_elt -> unit [@@js.call]

val load_source : hls_item -> url:string -> unit [@@js.call]

val start_load : hls_item -> unit [@@js.call]

val recover_media_error : hls_item -> unit [@@js.call]

val destroy : hls_item -> unit [@@js.call]

module Events : sig
  type t

  val media_attached : unit -> t [@@js.get "Hls.Events.MEDIA_ATTACHED"]

  val error : unit -> t [@@js.get "Hls.Events.ERROR"]
end

module Error_type : sig
  type t

  val network_error : unit -> t [@@js.get "Hls.ErrorTypes.NETWORK_ERROR"]

  val media_error : unit -> t [@@js.get "Hls.ErrorTypes.MEDIA_ERROR"]
end

module Data : sig
  type t

  val _type : t -> Error_type.t [@@js.get]

  val fatal : t -> bool [@@js.get]
end

(*val details : data -> string [@@js.get]*)

val on : hls_item -> Events.t -> (Ojs.t -> Data.t -> unit) -> unit [@@js.call]
