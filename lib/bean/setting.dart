class SettingBean {
  int timestamp;
  int code;
  String message;
  Data data;

  SettingBean({this.timestamp, this.code, this.data});

  SettingBean.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  UriTemplate uriTemplate;
  List<Filters> filters;
  String feedbackInfo;
  List<Null> explore;
  int systemTagVersion;
  int chunkUploadThreshold;
  int chunkSize;
  bool enableShinkai;
  String storyTheme;
  SearchPlaceholder searchPlaceholder;
  List<String> relations;
  List<Null> toolbar;
  int maxMediaSizeLimit;
  bool hardwareAcceleration;
  bool weixinShare;
  int minBackoffMs;
  int maxBackoffMs;
  int startProtectDuration;
  bool allowCancelBackgroundTask;
  UserProperty userProperty;
  int maxUploadSize;
  String smsCodeNumber;
  bool reviewToggle;
  bool enableSticker;
  int trashShow;
  int storyImagesLimit;
  String streamShareRegexStr;

  Data(
      {this.uriTemplate,
      this.filters,
      this.feedbackInfo,
      this.explore,
      this.systemTagVersion,
      this.chunkUploadThreshold,
      this.chunkSize,
      this.enableShinkai,
      this.storyTheme,
      this.searchPlaceholder,
      this.relations,
      this.toolbar,
      this.maxMediaSizeLimit,
      this.hardwareAcceleration,
      this.weixinShare,
      this.minBackoffMs,
      this.maxBackoffMs,
      this.startProtectDuration,
      this.allowCancelBackgroundTask,
      this.userProperty,
      this.maxUploadSize,
      this.smsCodeNumber,
      this.reviewToggle,
      this.enableSticker,
      this.trashShow,
      this.storyImagesLimit,
      this.streamShareRegexStr});

  Data.fromJson(Map<String, dynamic> json) {
    uriTemplate = json['uri_template'] != null
        ? new UriTemplate.fromJson(json['uri_template'])
        : null;
    if (json['filters'] != null) {
      filters = new List<Filters>();
      json['filters'].forEach((v) {
        filters.add(new Filters.fromJson(v));
      });
    }
    feedbackInfo = json['feedback_info'];
    systemTagVersion = json['system_tag_version'];
    chunkUploadThreshold = json['chunk_upload_threshold'];
    chunkSize = json['chunk_size'];
    enableShinkai = json['enable_shinkai'];
    storyTheme = json['story_theme'];
    searchPlaceholder = json['search_placeholder'] != null
        ? new SearchPlaceholder.fromJson(json['search_placeholder'])
        : null;
    relations = json['relations'].cast<String>();

    maxMediaSizeLimit = json['max_media_size_limit'];
    hardwareAcceleration = json['hardware_acceleration'];
    weixinShare = json['weixin_share'];
    minBackoffMs = json['min_backoff_ms'];
    maxBackoffMs = json['max_backoff_ms'];
    startProtectDuration = json['start_protect_duration'];
    allowCancelBackgroundTask = json['allow_cancel_background_task'];
    userProperty = json['user_property'] != null
        ? new UserProperty.fromJson(json['user_property'])
        : null;
    maxUploadSize = json['max_upload_size'];
    smsCodeNumber = json['sms_code_number'];
    reviewToggle = json['review_toggle'];
    enableSticker = json['enable_sticker'];
    trashShow = json['trash_show'];
    storyImagesLimit = json['story_images_limit'];
    streamShareRegexStr = json['stream_share_regex_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uriTemplate != null) {
      data['uri_template'] = this.uriTemplate.toJson();
    }
    if (this.filters != null) {
      data['filters'] = this.filters.map((v) => v.toJson()).toList();
    }
    data['feedback_info'] = this.feedbackInfo;
    data['system_tag_version'] = this.systemTagVersion;
    data['chunk_upload_threshold'] = this.chunkUploadThreshold;
    data['chunk_size'] = this.chunkSize;
    data['enable_shinkai'] = this.enableShinkai;
    data['story_theme'] = this.storyTheme;
    if (this.searchPlaceholder != null) {
      data['search_placeholder'] = this.searchPlaceholder.toJson();
    }
    data['relations'] = this.relations;
    data['max_media_size_limit'] = this.maxMediaSizeLimit;
    data['hardware_acceleration'] = this.hardwareAcceleration;
    data['weixin_share'] = this.weixinShare;
    data['min_backoff_ms'] = this.minBackoffMs;
    data['max_backoff_ms'] = this.maxBackoffMs;
    data['start_protect_duration'] = this.startProtectDuration;
    data['allow_cancel_background_task'] = this.allowCancelBackgroundTask;
    if (this.userProperty != null) {
      data['user_property'] = this.userProperty.toJson();
    }
    data['max_upload_size'] = this.maxUploadSize;
    data['sms_code_number'] = this.smsCodeNumber;
    data['review_toggle'] = this.reviewToggle;
    data['enable_sticker'] = this.enableSticker;
    data['trash_show'] = this.trashShow;
    data['story_images_limit'] = this.storyImagesLimit;
    data['stream_share_regex_str'] = this.streamShareRegexStr;
    return data;
  }
}

class UriTemplate {
  String origin;
  String video;
  String p1080;
  String p720;
  String p360;
  String s240;
  String avatar;

  UriTemplate(
      {this.origin,
      this.video,
      this.p1080,
      this.p720,
      this.p360,
      this.s240,
      this.avatar});

  UriTemplate.fromJson(Map<String, dynamic> json) {
    origin = json['origin'];
    video = json['video'];
    p1080 = json['p1080'];
    p720 = json['p720'];
    p360 = json['p360'];
    s240 = json['s240'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['origin'] = this.origin;
    data['video'] = this.video;
    data['p1080'] = this.p1080;
    data['p720'] = this.p720;
    data['p360'] = this.p360;
    data['s240'] = this.s240;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Filters {
  String displayName;
  String name;
  String bgcolor;
  int redo;
  String redoTitle;
  String guide;
  String cover;
  String uriTemplate;

  Filters(
      {this.displayName,
      this.name,
      this.bgcolor,
      this.redo,
      this.redoTitle,
      this.guide,
      this.cover,
      this.uriTemplate});

  Filters.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    name = json['name'];
    bgcolor = json['bgcolor'];
    redo = json['redo'];
    redoTitle = json['redo_title'];
    guide = json['guide'];
    cover = json['cover'];
    uriTemplate = json['uri_template'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this.displayName;
    data['name'] = this.name;
    data['bgcolor'] = this.bgcolor;
    data['redo'] = this.redo;
    data['redo_title'] = this.redoTitle;
    data['guide'] = this.guide;
    data['cover'] = this.cover;
    data['uri_template'] = this.uriTemplate;
    return data;
  }
}

class SearchPlaceholder {
  String value;

  SearchPlaceholder({this.value});

  SearchPlaceholder.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class UserProperty {
  bool contactUploaded;

  UserProperty({this.contactUploaded});

  UserProperty.fromJson(Map<String, dynamic> json) {
    contactUploaded = json['contact_uploaded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_uploaded'] = this.contactUploaded;
    return data;
  }
}
