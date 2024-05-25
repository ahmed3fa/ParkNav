import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<AvailabilityStruct>? initalAvaliablity() {
  final List<AvailabilityStruct> availability = [];

  final List<String> daysOfWeek = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  // Define the default start and end times
  final DateTime defaultStartTime = DateTime(2024, 1, 1, 0, 0); // 12:00 AM
  final DateTime defaultEndTime = DateTime(2024, 1, 1, 23, 59); // 11:59 PM

  for (final day in daysOfWeek) {
    availability.add(
      AvailabilityStruct(
        dayofWeek: day,
        startTime: defaultStartTime,
        endTime: defaultEndTime,
      ),
    );
  }

  return availability;
}

List<DateTime>? getAvailabileSlots(
  List<DateTime> bookings,
  DateTime dateArg,
  List<AvailabilityStruct> availability,
  String parkingRef,
) {
  final matchingAvailability = availability
      .where((a) =>
          parkingRef != null &&
          parkingRef.contains(a.parkingRef) &&
          a.dayofWeek.toLowerCase() ==
              DateFormat('EEEE').format(dateArg).toLowerCase())
      .toList();

  final availableSlots = <DateTime>[];
  for (final a in matchingAvailability) {
    if (a.hasStartTime() && a.hasEndTime()) {
      final startHour = a.startTime!.hour;
      final endHour = a.endTime!.hour;
      final startMinute = a.startTime!.minute;
      final endMinute = a.endTime!.minute;

      for (var hour = startHour; hour <= endHour; hour++) {
        for (var minute = 0; minute < 60; minute += 60) {
          final slotDateTime =
              DateTime(dateArg.year, dateArg.month, dateArg.day, hour, minute);
          final slotIsBooked = bookings.any((booking) =>
              booking.hour == slotDateTime.hour &&
              booking.minute == slotDateTime.minute &&
              booking.day == slotDateTime.day &&
              booking.month == slotDateTime.month &&
              booking.year == slotDateTime.year);

          if (!slotIsBooked) {
            availableSlots.add(slotDateTime);
          }
        }
      }
    }
  }

  // Filter out slots that are in the past
  final now = DateTime.now();
  final availableSlotsFiltered =
      availableSlots.where((slot) => slot.isAfter(now)).toList();

  return availableSlotsFiltered;
}

DateTime? stringtoTime(
  String? hourArg,
  DateTime? dateArg,
) {
  if (hourArg == null || dateArg == null) {
    return null;
  }
  final hourMin = hourArg.split(':');
  final hour = int.tryParse(hourMin[0]) ?? 0;
  final minute = int.tryParse(hourMin[1]) ?? 0;
  return DateTime(dateArg.year, dateArg.month, dateArg.day, hour, minute);
}

bool? isItAvalible() {
  // random Value code true false
  final random = math.Random();
  return random.nextBool();
}
