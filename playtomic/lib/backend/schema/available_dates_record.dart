import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AvailableDatesRecord extends FirestoreRecord {
  AvailableDatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "courtRef" field.
  DocumentReference? _courtRef;
  DocumentReference? get courtRef => _courtRef;
  bool hasCourtRef() => _courtRef != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _courtRef = snapshotData['courtRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('availableDates');

  static Stream<AvailableDatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvailableDatesRecord.fromSnapshot(s));

  static Future<AvailableDatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvailableDatesRecord.fromSnapshot(s));

  static AvailableDatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvailableDatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvailableDatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvailableDatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvailableDatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvailableDatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvailableDatesRecordData({
  DateTime? date,
  DocumentReference? courtRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'courtRef': courtRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvailableDatesRecordDocumentEquality
    implements Equality<AvailableDatesRecord> {
  const AvailableDatesRecordDocumentEquality();

  @override
  bool equals(AvailableDatesRecord? e1, AvailableDatesRecord? e2) {
    return e1?.date == e2?.date && e1?.courtRef == e2?.courtRef;
  }

  @override
  int hash(AvailableDatesRecord? e) =>
      const ListEquality().hash([e?.date, e?.courtRef]);

  @override
  bool isValidKey(Object? o) => o is AvailableDatesRecord;
}
