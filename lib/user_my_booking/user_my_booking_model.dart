import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/qr_code/qr_code_widget.dart';
import 'dart:math';
import '/flutter_flow/request_manager.dart';

import 'user_my_booking_widget.dart' show UserMyBookingWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserMyBookingModel extends FlutterFlowModel<UserMyBookingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Query cache managers for this widget.

  final _aaaManager = StreamRequestManager<List<BookingRecord>>();
  Stream<List<BookingRecord>> aaa({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BookingRecord>> Function() requestFn,
  }) =>
      _aaaManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAaaCache() => _aaaManager.clear();
  void clearAaaCacheKey(String? uniqueKey) =>
      _aaaManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearAaaCache();
  }
}
