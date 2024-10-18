import '../../../utils/enums.dart';

class RouteArgument {
  final int? id;
  final TransitionType? type;
  final dynamic params;
  final String? tag;
  RouteArgument({this.id, this.params, this.tag, this.type});
}
