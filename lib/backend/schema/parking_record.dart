import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParkingRecord extends FirestoreRecord {
  ParkingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ParkingNumber" field.
  int? _parkingNumber;
  int get parkingNumber => _parkingNumber ?? 0;
  bool hasParkingNumber() => _parkingNumber != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "availability" field.
  List<AvailabilityStruct>? _availability;
  List<AvailabilityStruct> get availability => _availability ?? const [];
  bool hasAvailability() => _availability != null;

  // "AdminParkinAdd" field.
  DocumentReference? _adminParkinAdd;
  DocumentReference? get adminParkinAdd => _adminParkinAdd;
  bool hasAdminParkinAdd() => _adminParkinAdd != null;

  // "parkingURL" field.
  String? _parkingURL;
  String get parkingURL => _parkingURL ?? '';
  bool hasParkingURL() => _parkingURL != null;

  // "parkingdescription" field.
  String? _parkingdescription;
  String get parkingdescription => _parkingdescription ?? '';
  bool hasParkingdescription() => _parkingdescription != null;

  // "isAvalibale" field.
  bool? _isAvalibale;
  bool get isAvalibale => _isAvalibale ?? false;
  bool hasIsAvalibale() => _isAvalibale != null;

  void _initializeFields() {
    _parkingNumber = castToType<int>(snapshotData['ParkingNumber']);
    _price = castToType<double>(snapshotData['Price']);
    _location = snapshotData['Location'] as String?;
    _availability = getStructList(
      snapshotData['availability'],
      AvailabilityStruct.fromMap,
    );
    _adminParkinAdd = snapshotData['AdminParkinAdd'] as DocumentReference?;
    _parkingURL = snapshotData['parkingURL'] as String?;
    _parkingdescription = snapshotData['parkingdescription'] as String?;
    _isAvalibale = snapshotData['isAvalibale'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Parking');

  static Stream<ParkingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParkingRecord.fromSnapshot(s));

  static Future<ParkingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParkingRecord.fromSnapshot(s));

  static ParkingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParkingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParkingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParkingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParkingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParkingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParkingRecordData({
  int? parkingNumber,
  double? price,
  String? location,
  DocumentReference? adminParkinAdd,
  String? parkingURL,
  String? parkingdescription,
  bool? isAvalibale,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ParkingNumber': parkingNumber,
      'Price': price,
      'Location': location,
      'AdminParkinAdd': adminParkinAdd,
      'parkingURL': parkingURL,
      'parkingdescription': parkingdescription,
      'isAvalibale': isAvalibale,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParkingRecordDocumentEquality implements Equality<ParkingRecord> {
  const ParkingRecordDocumentEquality();

  @override
  bool equals(ParkingRecord? e1, ParkingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.parkingNumber == e2?.parkingNumber &&
        e1?.price == e2?.price &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.availability, e2?.availability) &&
        e1?.adminParkinAdd == e2?.adminParkinAdd &&
        e1?.parkingURL == e2?.parkingURL &&
        e1?.parkingdescription == e2?.parkingdescription &&
        e1?.isAvalibale == e2?.isAvalibale;
  }

  @override
  int hash(ParkingRecord? e) => const ListEquality().hash([
        e?.parkingNumber,
        e?.price,
        e?.location,
        e?.availability,
        e?.adminParkinAdd,
        e?.parkingURL,
        e?.parkingdescription,
        e?.isAvalibale
      ]);

  @override
  bool isValidKey(Object? o) => o is ParkingRecord;
}
