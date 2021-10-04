module CustomLoader : sig
  type t

  type context

  type config

  (*onSuccessCallback definitions*)

  type response

  type succ_stats

  type succ_ctx

  type succ_ntw_details

  val set_on_success_callback :
    t ->
    (response -> succ_stats -> succ_ctx -> succ_ntw_details -> unit) ->
    unit
    [@@js.set]

  (*onProgressCallback definitions*)

  type progress_stats

  type progress_ctx

  type progress_data

  type progress_ntw_details

  val set_on_progress_callback :
    t ->
    (progress_stats ->
    progress_ctx ->
    progress_data ->
    progress_ntw_details ->
    unit) ->
    unit
    [@@js.set]

  (*onErrorCallback definition*)

  type error

  type error_ctx

  type error_ntw_details

  val set_on_error_callback :
    t -> (error -> error_ctx -> error_ntw_details -> unit) -> unit
    [@@js.set]

  (*onTimeoutCallback definition*)

  type timeout_stats

  type timeout_ctx

  val set_on_timeout_callback :
    t -> (timeout_stats -> timeout_ctx -> unit) -> unit
    [@@js.set]

  type callbacks

  (*TODO: feel free to unhence this constructor if necessary*)

  val t : context:context -> config:config -> callbacks:callbacks -> t
    [@@js.builder] [@@js.verbatim_names]
end

module CustomFragmentLoader : sig
  type t

  (*TODO: complete this module cf CustomLoader if necessary for your project*)
end

module CustomPlaylistLoader : sig
  type t

  (*TODO: complete this module cf CustomLoader if necessary for your project*)
end

module XhrSetup : sig
  type t

  (*TODO: complete this module cf https://github.com/video-dev/hls.js/blob/master/docs/API.md if necessary for your project*)
end

module FetchSetupCB : sig
  type t

  (*TODO: complete this module cf https://github.com/video-dev/hls.js/blob/master/docs/API.md if necessary for your project*)
end

module AbrController : sig
  type t

  (*TODO: complete this module cf https://github.com/video-dev/hls.js/blob/master/docs/API.md if necessary for your project*)
end

module BufferController : sig
  type t

  (*TODO: complete this module cf https://github.com/video-dev/hls.js/blob/master/docs/API.md if necessary for your project*)
end

module CapLevelController : sig
  type t

  (*TODO: complete this module cf https://github.com/video-dev/hls.js/blob/master/docs/API.md if necessary for your project*)
end

module FPSController : sig
  type t

  (*TODO: complete this module cf https://github.com/video-dev/hls.js/blob/master/docs/API.md if necessary for your project*)
end

module TimelineController : sig
  type t

  (*TODO: complete this module cf https://github.com/video-dev/hls.js/blob/master/docs/API.md if necessary for your project*)
end

module RequestMediaKeySystemAccess : sig
  type t

  (*TODO: complete this module cf https://github.com/video-dev/hls.js/blob/master/docs/API.md if necessary for your project*)
end

type hls_item

type audiocodec =
  | AAC_LC [@js "mp4a.40.2"]
  | HE_AAC [@js "mp4a.40.5"]
  | Undefined [@js "undefined"]
[@@js.enum]

type xhr (*XmlHttpRequest*)

type drm_options

val drm_options :
  ?audio_robustness:string -> ?video_robustness:string -> unit -> drm_options
  [@@js.builder] [@@js.verbatim_names]

type config

val config :
  ?auto_start_load:bool ->
  ?start_position:int ->
  ?debug:bool ->
  ?cap_level_on_fps_drop:bool ->
  ?cap_level_to_player_size:bool ->
  ?default_audio_codec:audiocodec ->
  ?initial_live_manifest_size:int ->
  ?max_buffer_length:int ->
  ?max_max_buffer_length:int ->
  ?back_buffer_length:int (*defalut value = Infinity*) ->
  ?max_buffer_size:int ->
  ?max_buffer_hole:float ->
  ?high_buffer_watchdog_period:int ->
  ?nudget_off_set:float ->
  ?nudget_max_retry:int ->
  ?max_frag_look_up_tolerance:float ->
  ?live_sync_duration_count:int ->
  ?live_max_latency_duration_count:int (*default value = Inifinity*) ->
  ?live_duration_infinty:bool ->
  ?enable_worker:bool ->
  ?enable_software_aes:bool ->
  ?manifest_loading_time_out:int ->
  ?manifest_loading_max_retry:int ->
  ?manifest_loading_retry_delay:int ->
  ?manifest_loading_max_retry_timeout:int ->
  ?start_level:int ->
  ?level_loading_time_out:int ->
  ?level_loading_max_retry:int ->
  ?level_loading_retry_delay:int ->
  ?level_loading_max_retry_timeout:int ->
  ?frag_loading_time_out:int ->
  ?frag_loading_max_retry:int ->
  ?frag_loading_retry_delay:int ->
  ?frag_loading_max_retry_timeout:int ->
  ?start_frag_prefetch:bool ->
  ?test_bandwidth:bool ->
  ?progressive:bool ->
  ?low_latency_mode:bool ->
  ?fps_dropped_monitoring_period:int ->
  ?fps_dropped_monitoring_threshold:float ->
  ?append_error_max_retry:int ->
  ?loader:CustomLoader.t ->
  ?f_loader:CustomFragmentLoader.t ->
  ?p_loader:CustomPlaylistLoader.t ->
  ?xhr_setup:XhrSetup.t ->
  ?fetch_setup:FetchSetupCB.t ->
  ?abr_controller:AbrController.t ->
  ?buffer_controller:BufferController.t ->
  ?cap_level_controller:CapLevelController.t ->
  ?fps_controller:FPSController.t ->
  ?timeline_controller:TimelineController.t ->
  ?enable_web_vtt:bool ->
  ?enable_imsc1:bool ->
  ?enable_cea708_captations:bool ->
  ?stretch_short_video_track:bool ->
  ?max_audio_frames_drift:int ->
  ?forced_key_frame_on_discontinuity:bool ->
  ?abr_ewma_fast_live:float ->
  ?abr_ewma_slow_live:float ->
  ?abr_ewma_fast_vod:float ->
  ?abr_ewma_slow_vod:float ->
  ?abr_ewma_default_estimate:int ->
  ?abr_band_width_factor:float ->
  ?abr_band_width_up_factor:float ->
  ?abr_max_with_real_bitrate:bool ->
  ?max_starvation_delay:int ->
  ?max_loading_delay:int ->
  ?min_auto_bitrate:int ->
  ?eme_enabled:bool ->
  ?widevine_license_url:string ->
  ?license_xhr_setup:(xhr:xhr -> url:string -> unit) ->
  ?drm_system_options:drm_options ->
  ?request_media_key_system_access_func:RequestMediaKeySystemAccess.t ->
  unit ->
  config
  [@@js.builder] [@@js.verbatim_names]

val set_auto_start_load : config -> bool -> unit [@@js.set "autoStartLoad"]

val set_start_position : config -> int -> unit [@@js.set "startPosition"]

val set_debug : config -> bool -> unit [@@js.set]

val set_cap_level_on_fps_drop : config -> bool -> unit
  [@@js.set "capLevelOnFPSDrop"]

val set_cap_level_to_player_size : config -> bool -> unit
  [@@js.set "capLevelToPlayerSize"]

val set_default_audio_codec : config -> audiocodec -> unit
  [@@js.set "defaultAudioCodec"]

val set_initial_live_manifest_size : config -> int -> unit
  [@@js.set "initialLiveManifestSize"]

val set_max_buffer_length : config -> int -> unit [@@js.set "maxBufferLength"]

val set_max_max_buffer_length : config -> int -> unit
  [@@js.set "maxMaxBufferLength"]

val set_back_buffer_length : config -> int -> unit [@@js.set "backBufferLength"]

val set_max_buffer_size : config -> int -> unit [@@js.set "maxBufferSize"]

val set_max_buffer_hole : config -> float -> unit [@@js.set "maxBufferHole"]

val set_high_buffer_watchdog_period : config -> int -> unit
  [@@js.set "highBufferWatchdogPeriod"]

val set_nudget_off_set : config -> float -> unit [@@js.set]

val set_nudget_max_retry : config -> int -> unit [@@js.set]

val set_max_frag_look_up_tolerance : config -> float -> unit [@@js.set]

val set_live_sync_duration_count : config -> int -> unit [@@js.set]

val set_live_max_latency_duration_count : config -> int -> unit [@@js.set]

val set_live_duration_infinity : config -> bool -> unit [@@js.set]

val set_enable_worker : config -> bool -> unit [@@js.set]

val set_enable_software_aes : config -> bool -> unit [@@js.set]

val set_manifest_loading_time_out : config -> int -> unit [@@js.set]

val set_manifest_loading_max_retry : config -> int -> unit [@@js.set]

val set_manifest_loading_retry_delay : config -> int -> unit [@@js.set]

val set_manifest_loading_max_retry_timeout : config -> int -> unit [@@js.set]

val set_start_level : config -> int -> unit [@@js.set]

val set_level_loading_time_out : config -> int -> unit [@@js.set]

val set_level_loading_max_retry : config -> int -> unit [@@js.set]

val set_level_loading_retry_delay : config -> int -> unit [@@js.set]

val set_level_loading_max_retry_timeout : config -> int -> unit [@@js.set]

val set_frag_loading_time_out : config -> int -> unit [@@js.set]

val set_frag_loading_max_retry : config -> int -> unit [@@js.set]

val set_frag_loading_retry_delay : config -> int -> unit [@@js.set]

val set_frag_loading_max_retry_timeout : config -> int -> unit [@@js.set]

val set_start_frag_prefetch : config -> bool -> unit [@@js.set]

val set_test_bandwidth : config -> bool -> unit [@@js.set]

val set_progressive : config -> bool -> unit [@@js.set]

val set_low_latency_mode : config -> bool -> unit [@@js.set]

val set_fps_dropped_monitoring_period : config -> int -> unit [@@js.set]

val set_fps_dropped_monitoring_threshold : config -> float -> unit [@@js.set]

val set_append_error_max_retry : config -> int -> unit [@@js.set]

val set_loader : config -> CustomLoader.t -> unit [@@js.set]

val set_f_loader : config -> CustomFragmentLoader.t -> unit [@@js.set]

val set_p_loader : config -> CustomPlaylistLoader.t -> unit [@@js.set]

val set_xhr_setup : config -> XhrSetup.t -> unit [@@js.set]

val set_fetch_setup : config -> FetchSetupCB.t -> unit [@@js.set]

val set_abr_controller : config -> AbrController.t -> unit [@@js.set]

val set_buffer_controller : config -> BufferController.t -> unit [@@js.set]

val set_cap_level_controller : config -> CapLevelController.t -> unit [@@js.set]

val set_fps_controller : config -> FPSController.t -> unit [@@js.set]

val set_timeline_controller : config -> TimelineController.t -> unit [@@js.set]

val set_enable_web_vtt : config -> bool -> unit [@@js.set]

val set_enable_imsc1 : config -> bool -> unit [@@js.set]

val set_enable_cea708_captations : config -> bool -> unit [@@js.set]

val set_stretch_short_video_track : config -> bool -> unit [@@js.set]

val set_max_audio_frames_drift : config -> int -> unit [@@js.set]

val set_forced_key_frame_on_discontinuity : config -> bool -> unit [@@js.set]

val set_abr_ewma_fast_live : config -> float -> unit [@@js.set]

val set_abr_ewma_slow_live : config -> float -> unit [@@js.set]

val set_abr_ewma_fast_vod : config -> float -> unit [@@js.set]

val set_abr_ewma_slow_vod : config -> float -> unit [@@js.set]

val set_abr_ewma_default_estimate : config -> int -> unit [@@js.set]

val set_abr_band_width_factor : config -> float -> unit [@@js.set]

val set_abr_band_width_up_factor : config -> float -> unit [@@js.set]

val set_abr_max_with_real_bittrate : config -> bool -> unit [@@js.set]

val set_max_starvation_delay : config -> int -> unit [@@js.set]

val set_max_loading_delay : config -> int -> unit [@@js.set]

val set_min_auto_bitrate : config -> int -> unit [@@js.set]

val set_eme_enabled : config -> bool -> unit [@@js.set]

val set_widevine_license_url : config -> string -> unit [@@js.set]

val set_license_xhr_setup : config -> (xhr:xhr -> url:string -> unit) -> unit
  [@@js.set]

val set_drm_system_options : config -> drm_options -> unit [@@js.set]

val set_request_media_key_system_access_func :
  config -> RequestMediaKeySystemAccess.t -> unit
  [@@js.set]

val new_hls : ?config:config -> unit -> hls_item [@@js.new "Hls"]

val get_config : hls_item -> config [@@js.get "config"]

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
