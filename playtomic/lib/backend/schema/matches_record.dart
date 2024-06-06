import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class MatchesRecord extends FirestoreRecord {
  MatchesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "startTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  bool hasEndTime() => _endTime != null;

  // "player1UID" field.
  String? _player1UID;
  String get player1UID => _player1UID ?? '';
  bool hasPlayer1UID() => _player1UID != null;

  // "player2UID" field.
  String? _player2UID;
  String get player2UID => _player2UID ?? '';
  bool hasPlayer2UID() => _player2UID != null;

  // "player3UID" field.
  String? _player3UID;
  String get player3UID => _player3UID ?? '';
  bool hasPlayer3UID() => _player3UID != null;

  // "player4UID" field.
  String? _player4UID;
  String get player4UID => _player4UID ?? '';
  bool hasPlayer4UID() => _player4UID != null;

  // "courtRef" field.
  DocumentReference? _courtRef;
  DocumentReference? get courtRef => _courtRef;
  bool hasCourtRef() => _courtRef != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _startTime = snapshotData['startTime'] as String?;
    _endTime = snapshotData['endTime'] as String?;
    _player1UID = snapshotData['player1UID'] as String?;
    _player2UID = snapshotData['player2UID'] as String?;
    _player3UID = snapshotData['player3UID'] as String?;
    _player4UID = snapshotData['player4UID'] as String?;
    _courtRef = snapshotData['courtRef'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matches');

  static Stream<MatchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MatchesRecord.fromSnapshot(s));

  static Future<MatchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MatchesRecord.fromSnapshot(s));

  static MatchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MatchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MatchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MatchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MatchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MatchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMatchesRecordData({
  String? startTime,
  String? endTime,
  String? player1UID,
  String? player2UID,
  String? player3UID,
  String? player4UID,
  DocumentReference? courtRef,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'startTime': startTime,
      'endTime': endTime,
      'player1UID': player1UID,
      'player2UID': player2UID,
      'player3UID': player3UID,
      'player4UID': player4UID,
      'courtRef': courtRef,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class MatchesRecordDocumentEquality implements Equality<MatchesRecord> {
  const MatchesRecordDocumentEquality();

  @override
  bool equals(MatchesRecord? e1, MatchesRecord? e2) {
    return e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.player1UID == e2?.player1UID &&
        e1?.player2UID == e2?.player2UID &&
        e1?.player3UID == e2?.player3UID &&
        e1?.player4UID == e2?.player4UID &&
        e1?.courtRef == e2?.courtRef &&
        e1?.date == e2?.date;
  }

  @override
  int hash(MatchesRecord? e) => const ListEquality().hash([
        e?.startTime,
        e?.endTime,
        e?.player1UID,
        e?.player2UID,
        e?.player3UID,
        e?.player4UID,
        e?.courtRef,
        e?.date
      ]);

  @override
  bool isValidKey(Object? o) => o is MatchesRecord;
}
