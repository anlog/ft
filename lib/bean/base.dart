class base {
  int timestamp;
  int code;

  base() {}

  base.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    code = json['code'];
  }
}
