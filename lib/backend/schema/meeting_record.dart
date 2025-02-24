import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeetingRecord extends FirestoreRecord {
  MeetingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "meeting_name" field.
  String? _meetingName;
  String get meetingName => _meetingName ?? '';
  bool hasMeetingName() => _meetingName != null;

  // "meeting_date" field.
  DateTime? _meetingDate;
  DateTime? get meetingDate => _meetingDate;
  bool hasMeetingDate() => _meetingDate != null;

  // "meeting_description" field.
  String? _meetingDescription;
  String get meetingDescription => _meetingDescription ?? '';
  bool hasMeetingDescription() => _meetingDescription != null;

  // "meeting_join_user" field.
  List<DocumentReference>? _meetingJoinUser;
  List<DocumentReference> get meetingJoinUser => _meetingJoinUser ?? const [];
  bool hasMeetingJoinUser() => _meetingJoinUser != null;

  // "meeting_owner" field.
  DocumentReference? _meetingOwner;
  DocumentReference? get meetingOwner => _meetingOwner;
  bool hasMeetingOwner() => _meetingOwner != null;

  // "meeting_location" field.
  String? _meetingLocation;
  String get meetingLocation => _meetingLocation ?? '';
  bool hasMeetingLocation() => _meetingLocation != null;

  // "meeting_photo" field.
  String? _meetingPhoto;
  String get meetingPhoto => _meetingPhoto ?? '';
  bool hasMeetingPhoto() => _meetingPhoto != null;

  // "meeting_uid" field.
  LatLng? _meetingUid;
  LatLng? get meetingUid => _meetingUid;
  bool hasMeetingUid() => _meetingUid != null;

  // "meeting_book_author" field.
  String? _meetingBookAuthor;
  String get meetingBookAuthor => _meetingBookAuthor ?? '';
  bool hasMeetingBookAuthor() => _meetingBookAuthor != null;

  // "meeting_debate" field.
  DocumentReference? _meetingDebate;
  DocumentReference? get meetingDebate => _meetingDebate;
  bool hasMeetingDebate() => _meetingDebate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _meetingName = snapshotData['meeting_name'] as String?;
    _meetingDate = snapshotData['meeting_date'] as DateTime?;
    _meetingDescription = snapshotData['meeting_description'] as String?;
    _meetingJoinUser = getDataList(snapshotData['meeting_join_user']);
    _meetingOwner = snapshotData['meeting_owner'] as DocumentReference?;
    _meetingLocation = snapshotData['meeting_location'] as String?;
    _meetingPhoto = snapshotData['meeting_photo'] as String?;
    _meetingUid = snapshotData['meeting_uid'] as LatLng?;
    _meetingBookAuthor = snapshotData['meeting_book_author'] as String?;
    _meetingDebate = snapshotData['meeting_debate'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('meeting')
          : FirebaseFirestore.instance.collectionGroup('meeting');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('meeting').doc(id);

  static Stream<MeetingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeetingRecord.fromSnapshot(s));

  static Future<MeetingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeetingRecord.fromSnapshot(s));

  static MeetingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeetingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeetingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeetingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeetingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeetingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeetingRecordData({
  String? meetingName,
  DateTime? meetingDate,
  String? meetingDescription,
  DocumentReference? meetingOwner,
  String? meetingLocation,
  String? meetingPhoto,
  LatLng? meetingUid,
  String? meetingBookAuthor,
  DocumentReference? meetingDebate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'meeting_name': meetingName,
      'meeting_date': meetingDate,
      'meeting_description': meetingDescription,
      'meeting_owner': meetingOwner,
      'meeting_location': meetingLocation,
      'meeting_photo': meetingPhoto,
      'meeting_uid': meetingUid,
      'meeting_book_author': meetingBookAuthor,
      'meeting_debate': meetingDebate,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeetingRecordDocumentEquality implements Equality<MeetingRecord> {
  const MeetingRecordDocumentEquality();

  @override
  bool equals(MeetingRecord? e1, MeetingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.meetingName == e2?.meetingName &&
        e1?.meetingDate == e2?.meetingDate &&
        e1?.meetingDescription == e2?.meetingDescription &&
        listEquality.equals(e1?.meetingJoinUser, e2?.meetingJoinUser) &&
        e1?.meetingOwner == e2?.meetingOwner &&
        e1?.meetingLocation == e2?.meetingLocation &&
        e1?.meetingPhoto == e2?.meetingPhoto &&
        e1?.meetingUid == e2?.meetingUid &&
        e1?.meetingBookAuthor == e2?.meetingBookAuthor &&
        e1?.meetingDebate == e2?.meetingDebate;
  }

  @override
  int hash(MeetingRecord? e) => const ListEquality().hash([
        e?.meetingName,
        e?.meetingDate,
        e?.meetingDescription,
        e?.meetingJoinUser,
        e?.meetingOwner,
        e?.meetingLocation,
        e?.meetingPhoto,
        e?.meetingUid,
        e?.meetingBookAuthor,
        e?.meetingDebate
      ]);

  @override
  bool isValidKey(Object? o) => o is MeetingRecord;
}
