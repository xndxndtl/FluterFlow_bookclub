import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DebatesRecord extends FirestoreRecord {
  DebatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "debate_owner" field.
  DocumentReference? _debateOwner;
  DocumentReference? get debateOwner => _debateOwner;
  bool hasDebateOwner() => _debateOwner != null;

  // "debate_description" field.
  String? _debateDescription;
  String get debateDescription => _debateDescription ?? '';
  bool hasDebateDescription() => _debateDescription != null;

  // "debate_create_time" field.
  DateTime? _debateCreateTime;
  DateTime? get debateCreateTime => _debateCreateTime;
  bool hasDebateCreateTime() => _debateCreateTime != null;

  // "debate_fix_time" field.
  DateTime? _debateFixTime;
  DateTime? get debateFixTime => _debateFixTime;
  bool hasDebateFixTime() => _debateFixTime != null;

  // "related_meeting" field.
  DocumentReference? _relatedMeeting;
  DocumentReference? get relatedMeeting => _relatedMeeting;
  bool hasRelatedMeeting() => _relatedMeeting != null;

  void _initializeFields() {
    _debateOwner = snapshotData['debate_owner'] as DocumentReference?;
    _debateDescription = snapshotData['debate_description'] as String?;
    _debateCreateTime = snapshotData['debate_create_time'] as DateTime?;
    _debateFixTime = snapshotData['debate_fix_time'] as DateTime?;
    _relatedMeeting = snapshotData['related_meeting'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('debates');

  static Stream<DebatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DebatesRecord.fromSnapshot(s));

  static Future<DebatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DebatesRecord.fromSnapshot(s));

  static DebatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DebatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DebatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DebatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DebatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DebatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDebatesRecordData({
  DocumentReference? debateOwner,
  String? debateDescription,
  DateTime? debateCreateTime,
  DateTime? debateFixTime,
  DocumentReference? relatedMeeting,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'debate_owner': debateOwner,
      'debate_description': debateDescription,
      'debate_create_time': debateCreateTime,
      'debate_fix_time': debateFixTime,
      'related_meeting': relatedMeeting,
    }.withoutNulls,
  );

  return firestoreData;
}

class DebatesRecordDocumentEquality implements Equality<DebatesRecord> {
  const DebatesRecordDocumentEquality();

  @override
  bool equals(DebatesRecord? e1, DebatesRecord? e2) {
    return e1?.debateOwner == e2?.debateOwner &&
        e1?.debateDescription == e2?.debateDescription &&
        e1?.debateCreateTime == e2?.debateCreateTime &&
        e1?.debateFixTime == e2?.debateFixTime &&
        e1?.relatedMeeting == e2?.relatedMeeting;
  }

  @override
  int hash(DebatesRecord? e) => const ListEquality().hash([
        e?.debateOwner,
        e?.debateDescription,
        e?.debateCreateTime,
        e?.debateFixTime,
        e?.relatedMeeting
      ]);

  @override
  bool isValidKey(Object? o) => o is DebatesRecord;
}
