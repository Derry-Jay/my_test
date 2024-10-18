import '../../extensions/extensions.dart';

class Reply {
  final int status;
  final String message;
  Reply(this.status, this.message);
  static Reply emptyReply = Reply(403, '');
  Map<String, dynamic> get json {
    Map<String, dynamic> map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

  factory Reply.fromMap(Map<String, dynamic> json) {
    json.jot();
    return Reply(json['status'], json['message']);
  }
}
