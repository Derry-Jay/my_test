import 'package:flutter/material.dart';
import 'extensions.dart';
import 'package:time_machine/time_machine.dart';

extension TimeUt on Time {
  Time add(Time other) => Time.plus(this, other);

  Time maximum(Time other) => Time.max(this, other);

  Time minimum(Time other) => Time.min(this, other);

  Time subtract(Time other) => Time.minus(this, other);

  TimeOfDay get timeOfDay => TimeOfDay(hour: hourOfDay, minute: minuteOfHour);
}

extension BigintExt on BigInt {
  int get integer => toInt();

  BigInt get absolute => abs();

  double get float => toDouble();

  Time get time => Time.bigIntNanoseconds(this);

  String get creditCardNumber {
    final String n2s = absolute.string;
    return this >= 10.toThePowerOf(15).bigInt && n2s.length == 16
        ? '${n2s.substring(0, 4)} ${n2s.substring(4, 8)} ${n2s.substring(8, 12)} ${n2s.substring(12, 16)}'
        : '';
  }
}
