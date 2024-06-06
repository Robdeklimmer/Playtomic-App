import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourtRecord extends FirestoreRecord {
  CourtRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "streetname" field.
  String? _streetname;
  String get streetname => _streetname ?? '';
  bool hasStreetname() => _streetname != null;

  // "zipcode" field.
  int? _zipcode;
  int get zipcode => _zipcode ?? 0;
  bool hasZipcode() => _zipcode != null;

  // "cityName" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "houseNumber" field.
  int? _houseNumber;
  int get houseNumber => _houseNumber ?? 0;
  bool hasHouseNumber() => _houseNumber != null;

  // "pricePerHour" field.
  double? _pricePerHour;
  double get pricePerHour => _pricePerHour ?? 0.0;
  bool hasPricePerHour() => _pricePerHour != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "courtImage" field.
  String? _courtImage;
  String get courtImage => _courtImage ?? '';
  bool hasCourtImage() => _courtImage != null;

  // "courtLocation" field.
  LatLng? _courtLocation;
  LatLng? get courtLocation => _courtLocation;
  bool hasCourtLocation() => _courtLocation != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _streetname = snapshotData['streetname'] as String?;
    _zipcode = castToType<int>(snapshotData['zipcode']);
    _cityName = snapshotData['cityName'] as String?;
    _houseNumber = castToType<int>(snapshotData['houseNumber']);
    _pricePerHour = castToType<double>(snapshotData['pricePerHour']);
    _country = snapshotData['country'] as String?;
    _courtImage = snapshotData['courtImage'] as String?;
    _courtLocation = snapshotData['courtLocation'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('court');

  static Stream<CourtRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourtRecord.fromSnapshot(s));

  static Future<CourtRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourtRecord.fromSnapshot(s));

  static CourtRecord fromSnapshot(DocumentSnapshot snapshot) => CourtRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourtRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourtRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourtRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourtRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourtRecordData({
  String? name,
  String? streetname,
  int? zipcode,
  String? cityName,
  int? houseNumber,
  double? pricePerHour,
  String? country,
  String? courtImage,
  LatLng? courtLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'streetname': streetname,
      'zipcode': zipcode,
      'cityName': cityName,
      'houseNumber': houseNumber,
      'pricePerHour': pricePerHour,
      'country': country,
      'courtImage': courtImage,
      'courtLocation': courtLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourtRecordDocumentEquality implements Equality<CourtRecord> {
  const CourtRecordDocumentEquality();

  @override
  bool equals(CourtRecord? e1, CourtRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.streetname == e2?.streetname &&
        e1?.zipcode == e2?.zipcode &&
        e1?.cityName == e2?.cityName &&
        e1?.houseNumber == e2?.houseNumber &&
        e1?.pricePerHour == e2?.pricePerHour &&
        e1?.country == e2?.country &&
        e1?.courtImage == e2?.courtImage &&
        e1?.courtLocation == e2?.courtLocation;
  }

  @override
  int hash(CourtRecord? e) => const ListEquality().hash([
        e?.name,
        e?.streetname,
        e?.zipcode,
        e?.cityName,
        e?.houseNumber,
        e?.pricePerHour,
        e?.country,
        e?.courtImage,
        e?.courtLocation
      ]);

  @override
  bool isValidKey(Object? o) => o is CourtRecord;
}
