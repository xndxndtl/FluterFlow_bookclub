import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemberRecord extends FirestoreRecord {
  MemberRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "member_joindate" field.
  DateTime? _memberJoindate;
  DateTime? get memberJoindate => _memberJoindate;
  bool hasMemberJoindate() => _memberJoindate != null;

  // "member_meeting_joincount" field.
  int? _memberMeetingJoincount;
  int get memberMeetingJoincount => _memberMeetingJoincount ?? 0;
  bool hasMemberMeetingJoincount() => _memberMeetingJoincount != null;

  // "member_role" field.
  MermberRoleEnum? _memberRole;
  MermberRoleEnum? get memberRole => _memberRole;
  bool hasMemberRole() => _memberRole != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _memberJoindate = snapshotData['member_joindate'] as DateTime?;
    _memberMeetingJoincount =
        castToType<int>(snapshotData['member_meeting_joincount']);
    _memberRole = snapshotData['member_role'] is MermberRoleEnum
        ? snapshotData['member_role']
        : deserializeEnum<MermberRoleEnum>(snapshotData['member_role']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('member')
          : FirebaseFirestore.instance.collectionGroup('member');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('member').doc(id);

  static Stream<MemberRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MemberRecord.fromSnapshot(s));

  static Future<MemberRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MemberRecord.fromSnapshot(s));

  static MemberRecord fromSnapshot(DocumentSnapshot snapshot) => MemberRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MemberRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MemberRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MemberRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MemberRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMemberRecordData({
  DateTime? memberJoindate,
  int? memberMeetingJoincount,
  MermberRoleEnum? memberRole,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'member_joindate': memberJoindate,
      'member_meeting_joincount': memberMeetingJoincount,
      'member_role': memberRole,
    }.withoutNulls,
  );

  return firestoreData;
}

class MemberRecordDocumentEquality implements Equality<MemberRecord> {
  const MemberRecordDocumentEquality();

  @override
  bool equals(MemberRecord? e1, MemberRecord? e2) {
    return e1?.memberJoindate == e2?.memberJoindate &&
        e1?.memberMeetingJoincount == e2?.memberMeetingJoincount &&
        e1?.memberRole == e2?.memberRole;
  }

  @override
  int hash(MemberRecord? e) => const ListEquality()
      .hash([e?.memberJoindate, e?.memberMeetingJoincount, e?.memberRole]);

  @override
  bool isValidKey(Object? o) => o is MemberRecord;
}
