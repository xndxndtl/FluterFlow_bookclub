import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DebateContentsRecord extends FirestoreRecord {
  DebateContentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "contents" field.
  String? _contents;
  String get contents => _contents ?? '';
  bool hasContents() => _contents != null;

  // "contents_owner" field.
  DocumentReference? _contentsOwner;
  DocumentReference? get contentsOwner => _contentsOwner;
  bool hasContentsOwner() => _contentsOwner != null;

  // "contents_create_time" field.
  DateTime? _contentsCreateTime;
  DateTime? get contentsCreateTime => _contentsCreateTime;
  bool hasContentsCreateTime() => _contentsCreateTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _contents = snapshotData['contents'] as String?;
    _contentsOwner = snapshotData['contents_owner'] as DocumentReference?;
    _contentsCreateTime = snapshotData['contents_create_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('debate_contents')
          : FirebaseFirestore.instance.collectionGroup('debate_contents');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('debate_contents').doc(id);

  static Stream<DebateContentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DebateContentsRecord.fromSnapshot(s));

  static Future<DebateContentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DebateContentsRecord.fromSnapshot(s));

  static DebateContentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DebateContentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DebateContentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DebateContentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DebateContentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DebateContentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDebateContentsRecordData({
  String? contents,
  DocumentReference? contentsOwner,
  DateTime? contentsCreateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'contents': contents,
      'contents_owner': contentsOwner,
      'contents_create_time': contentsCreateTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class DebateContentsRecordDocumentEquality
    implements Equality<DebateContentsRecord> {
  const DebateContentsRecordDocumentEquality();

  @override
  bool equals(DebateContentsRecord? e1, DebateContentsRecord? e2) {
    return e1?.contents == e2?.contents &&
        e1?.contentsOwner == e2?.contentsOwner &&
        e1?.contentsCreateTime == e2?.contentsCreateTime;
  }

  @override
  int hash(DebateContentsRecord? e) => const ListEquality()
      .hash([e?.contents, e?.contentsOwner, e?.contentsCreateTime]);

  @override
  bool isValidKey(Object? o) => o is DebateContentsRecord;
}
