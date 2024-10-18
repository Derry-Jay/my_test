import 'package:time_machine/time_machine.dart';

class Timezone extends DateTimeZone {
  Timezone(super.id, super.isFixed, super.minOffset, super.maxOffset);

  @override
  ZoneInterval getZoneInterval(Instant instant) {
    // TODO: implement getZoneInterval
    throw UnimplementedError();
  }
}
