import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingRecord extends FirestoreRecord {
  BookingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "ParkingREf" field.
  DocumentReference? _parkingREf;
  DocumentReference? get parkingREf => _parkingREf;
  bool hasParkingREf() => _parkingREf != null;

  // "AdminREF" field.
  DocumentReference? _adminREF;
  DocumentReference? get adminREF => _adminREF;
  bool hasAdminREF() => _adminREF != null;

  // "BookTime" field.
  DateTime? _bookTime;
  DateTime? get bookTime => _bookTime;
  bool hasBookTime() => _bookTime != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as DocumentReference?;
    _parkingREf = snapshotData['ParkingREf'] as DocumentReference?;
    _adminREF = snapshotData['AdminREF'] as DocumentReference?;
    _bookTime = snapshotData['BookTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booking');

  static Stream<BookingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingRecord.fromSnapshot(s));

  static Future<BookingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingRecord.fromSnapshot(s));

  static BookingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingRecordData({
  DocumentReference? userId,
  DocumentReference? parkingREf,
  DocumentReference? adminREF,
  DateTime? bookTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'ParkingREf': parkingREf,
      'AdminREF': adminREF,
      'BookTime': bookTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingRecordDocumentEquality implements Equality<BookingRecord> {
  const BookingRecordDocumentEquality();

  @override
  bool equals(BookingRecord? e1, BookingRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.parkingREf == e2?.parkingREf &&
        e1?.adminREF == e2?.adminREF &&
        e1?.bookTime == e2?.bookTime;
  }

  @override
  int hash(BookingRecord? e) => const ListEquality()
      .hash([e?.userId, e?.parkingREf, e?.adminREF, e?.bookTime]);

  @override
  bool isValidKey(Object? o) => o is BookingRecord;
}
