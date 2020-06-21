class PhotoBean {
  int timestamp;
  int code;
  String message;
  Data data;
  Pagination pagination;

  PhotoBean({this.timestamp, this.code, this.data, this.pagination});

  PhotoBean.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    return data;
  }
}

class Data {
  List<MediaList> mediaList;
  List<MediaTagsList> mediaTagsList;

  Data({this.mediaList, this.mediaTagsList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['media_list'] != null) {
      mediaList = new List<MediaList>();
      json['media_list'].forEach((v) {
        mediaList.add(new MediaList.fromJson(v));
      });
    }
    if (json['media_tags_list'] != null) {
      mediaTagsList = new List<MediaTagsList>();
      json['media_tags_list'].forEach((v) {
        mediaTagsList.add(new MediaTagsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mediaList != null) {
      data['media_list'] = this.mediaList.map((v) => v.toJson()).toList();
    }
    if (this.mediaTagsList != null) {
      data['media_tags_list'] =
          this.mediaTagsList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MediaList {
  int id;
  int owner;
  int status;
  String taken;
  int utcOffset;
  String createdAt;
  String sourcePath;
  int size;
  String md5;
  String format;
  int width;
  int height;
  int orientation;
  String make;
  String model;
  double aperture;
  String exposureTime;
  int iso;
  double focalLength;
  int flash;
  double latitude;
  double longitude;
  String mime;
  int qualityScore;
  List<int> tags;
  List<String> hiddenTags;
  List<String> negTags;
  bool deleted;
  String generatedAt;
  String uploadedAt;
  String token;
  Location location;
  String originalFid;

  MediaList(
      {this.id,
      this.owner,
      this.status,
      this.taken,
      this.utcOffset,
      this.createdAt,
      this.sourcePath,
      this.size,
      this.md5,
      this.format,
      this.width,
      this.height,
      this.orientation,
      this.make,
      this.model,
      this.aperture,
      this.exposureTime,
      this.iso,
      this.focalLength,
      this.flash,
      this.latitude,
      this.longitude,
      this.mime,
      this.qualityScore,
      this.tags,
      this.hiddenTags,
      this.negTags,
      this.deleted,
      this.generatedAt,
      this.uploadedAt,
      this.token,
      this.location,
      this.originalFid});

  MediaList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    status = json['status'];
    taken = json['taken'];
    utcOffset = json['utc_offset'];
    createdAt = json['created_at'];
    sourcePath = json['source_path'];
    size = json['size'];
    md5 = json['md5'];
    format = json['format'];
    width = json['width'];
    height = json['height'];
    orientation = json['orientation'];
    make = json['make'];
    model = json['model'];
    aperture = json['aperture'];
    exposureTime = json['exposure_time'];
    iso = json['iso'];
    focalLength = json['focal_length'];
    flash = json['flash'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    mime = json['mime'];
    qualityScore = json['quality_score'];
    tags = json['tags'].cast<int>();
    hiddenTags = json['hidden_tags'].cast<String>();
    negTags = json['neg_tags'].cast<String>();
    deleted = json['deleted'];
    generatedAt = json['generated_at'];
    uploadedAt = json['uploaded_at'];
    token = json['token'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    originalFid = json['original_fid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner'] = this.owner;
    data['status'] = this.status;
    data['taken'] = this.taken;
    data['utc_offset'] = this.utcOffset;
    data['created_at'] = this.createdAt;
    data['source_path'] = this.sourcePath;
    data['size'] = this.size;
    data['md5'] = this.md5;
    data['format'] = this.format;
    data['width'] = this.width;
    data['height'] = this.height;
    data['orientation'] = this.orientation;
    data['make'] = this.make;
    data['model'] = this.model;
    data['aperture'] = this.aperture;
    data['exposure_time'] = this.exposureTime;
    data['iso'] = this.iso;
    data['focal_length'] = this.focalLength;
    data['flash'] = this.flash;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['mime'] = this.mime;
    data['quality_score'] = this.qualityScore;
    data['tags'] = this.tags;
    data['hidden_tags'] = this.hiddenTags;
    data['neg_tags'] = this.negTags;
    data['deleted'] = this.deleted;
    data['generated_at'] = this.generatedAt;
    data['uploaded_at'] = this.uploadedAt;
    data['token'] = this.token;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['original_fid'] = this.originalFid;
    return data;
  }
}

class Location {
  String hash;
  String country;
  String province;
  String city;
  String district;
  String street;
  List<String> business;

  Location(
      {this.hash,
      this.country,
      this.province,
      this.city,
      this.district,
      this.street,
      this.business});

  Location.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    country = json['country'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
    street = json['street'];
    business = json['business'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    data['country'] = this.country;
    data['province'] = this.province;
    data['city'] = this.city;
    data['district'] = this.district;
    data['street'] = this.street;
    data['business'] = this.business;
    return data;
  }
}

class MediaTagsList {
  int mediaId;
  List<int> tags;
  List<String> peoples;

  MediaTagsList({this.mediaId, this.tags, this.peoples});

  MediaTagsList.fromJson(Map<String, dynamic> json) {
    mediaId = json['media_id'];
    tags = json['tags'].cast<int>();
    peoples = json['peoples'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media_id'] = this.mediaId;
    data['tags'] = this.tags;
    data['peoples'] = this.peoples;
    return data;
  }
}

class Pagination {
  bool hasMore;
  String prev;

  Pagination({this.hasMore, this.prev});

  Pagination.fromJson(Map<String, dynamic> json) {
    hasMore = json['has_more'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_more'] = this.hasMore;
    data['prev'] = this.prev;
    return data;
  }
}
