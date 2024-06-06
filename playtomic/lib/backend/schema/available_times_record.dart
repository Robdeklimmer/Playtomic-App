import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AvailableTimesRecord extends FirestoreRecord {
  AvailableTimesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "taken" field.
  bool? _taken;
  bool get taken => _taken ?? false;
  bool hasTaken() => _taken != null;

  // "dateReference" field.
  String? _dateReference;
  String get dateReference => _dateReference ?? '';
  bool hasDateReference() => _dateReference != null;

  // "endTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  bool hasEndTime() => _endTime != null;

  // "dateRef" field.
  DocumentReference? _dateRef;
  DocumentReference? get dateRef => _dateRef;
  bool hasDateRef() => _dateRef != null;

  void _initializeFields() {
    _time = snapshotData['time'] as String?;
    _taken = snapshotData['taken'] as bool?;
    _dateReference = snapshotData['dateReference'] as String?;
    _endTime = snapshotData['endTime'] as String?;
    _dateRef = snapshotData['dateRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('availableTimes');

  static Stream<AvailableTimesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvailableTimesRecord.fromSnapshot(s));

  static Future<AvailableTimesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvailableTimesRecord.fromSnapshot(s));

  static AvailableTimesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvailableTimesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvailableTimesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvailableTimesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvailableTimesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvailableTimesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvailableTimesRecordData({
  String? time,
  bool? taken,
  String? dateReference,
  String? endTime,
  DocumentReference? dateRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time': time,
      'taken': taken,
      'dateReference': dateReference,
      'endTime': endTime,
      'dateRef': dateRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvailableTimesRecordDocumentEquality
    implements Equality<AvailableTimesRecord> {
  const AvailableTimesRecordDocumentEquality();

  @override
  bool equals(AvailableTimesRecord? e1, AvailableTimesRecord? e2) {
    return e1?.time == e2?.time &&
        e1?.taken == e2?.taken &&
        e1?.dateReference == e2?.dateReference &&
        e1?.endTime == e2?.endTime &&
        e1?.dateRef == e2?.dateRef;
  }

  @override
  int hash(AvailableTimesRecord? e) => const ListEquality()
      .hash([e?.time, e?.taken, e?.dateReference, e?.endTime, e?.dateRef]);

  @override
  bool isValidKey(Object? o) => o is AvailableTimesRecord;
}
