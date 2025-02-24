import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClubsRecord extends FirestoreRecord {
  ClubsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "club_name" field.
  String? _clubName;
  String get clubName => _clubName ?? '';
  bool hasClubName() => _clubName != null;

  // "club_image" field.
  String? _clubImage;
  String get clubImage => _clubImage ?? '';
  bool hasClubImage() => _clubImage != null;

  // "club_created_time" field.
  DateTime? _clubCreatedTime;
  DateTime? get clubCreatedTime => _clubCreatedTime;
  bool hasClubCreatedTime() => _clubCreatedTime != null;

  // "club_owner" field.
  DocumentReference? _clubOwner;
  DocumentReference? get clubOwner => _clubOwner;
  bool hasClubOwner() => _clubOwner != null;

  // "club_members" field.
  List<DocumentReference>? _clubMembers;
  List<DocumentReference> get clubMembers => _clubMembers ?? const [];
  bool hasClubMembers() => _clubMembers != null;

  // "club_region" field.
  String? _clubRegion;
  String get clubRegion => _clubRegion ?? '';
  bool hasClubRegion() => _clubRegion != null;

  // "club_description" field.
  String? _clubDescription;
  String get clubDescription => _clubDescription ?? '';
  bool hasClubDescription() => _clubDescription != null;

  // "club_join_request" field.
  List<DocumentReference>? _clubJoinRequest;
  List<DocumentReference> get clubJoinRequest => _clubJoinRequest ?? const [];
  bool hasClubJoinRequest() => _clubJoinRequest != null;

  void _initializeFields() {
    _clubName = snapshotData['club_name'] as String?;
    _clubImage = snapshotData['club_image'] as String?;
    _clubCreatedTime = snapshotData['club_created_time'] as DateTime?;
    _clubOwner = snapshotData['club_owner'] as DocumentReference?;
    _clubMembers = getDataList(snapshotData['club_members']);
    _clubRegion = snapshotData['club_region'] as String?;
    _clubDescription = snapshotData['club_description'] as String?;
    _clubJoinRequest = getDataList(snapshotData['club_join_request']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clubs');

  static Stream<ClubsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClubsRecord.fromSnapshot(s));

  static Future<ClubsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClubsRecord.fromSnapshot(s));

  static ClubsRecord fromSnapshot(DocumentSnapshot snapshot) => ClubsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClubsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClubsRecord._(reference, mapFromFirestore(data));

  static ClubsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ClubsRecord.getDocumentFromData(
        {
          'club_name': snapshot.data['club_name'],
          'club_image': snapshot.data['club_image'],
          'club_created_time': convertAlgoliaParam(
            snapshot.data['club_created_time'],
            ParamType.DateTime,
            false,
          ),
          'club_owner': convertAlgoliaParam(
            snapshot.data['club_owner'],
            ParamType.DocumentReference,
            false,
          ),
          'club_members': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['club_members'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'club_region': snapshot.data['club_region'],
          'club_description': snapshot.data['club_description'],
          'club_join_request': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['club_join_request'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
        },
        ClubsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ClubsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'clubs',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ClubsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClubsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClubsRecordData({
  String? clubName,
  String? clubImage,
  DateTime? clubCreatedTime,
  DocumentReference? clubOwner,
  String? clubRegion,
  String? clubDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'club_name': clubName,
      'club_image': clubImage,
      'club_created_time': clubCreatedTime,
      'club_owner': clubOwner,
      'club_region': clubRegion,
      'club_description': clubDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClubsRecordDocumentEquality implements Equality<ClubsRecord> {
  const ClubsRecordDocumentEquality();

  @override
  bool equals(ClubsRecord? e1, ClubsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.clubName == e2?.clubName &&
        e1?.clubImage == e2?.clubImage &&
        e1?.clubCreatedTime == e2?.clubCreatedTime &&
        e1?.clubOwner == e2?.clubOwner &&
        listEquality.equals(e1?.clubMembers, e2?.clubMembers) &&
        e1?.clubRegion == e2?.clubRegion &&
        e1?.clubDescription == e2?.clubDescription &&
        listEquality.equals(e1?.clubJoinRequest, e2?.clubJoinRequest);
  }

  @override
  int hash(ClubsRecord? e) => const ListEquality().hash([
        e?.clubName,
        e?.clubImage,
        e?.clubCreatedTime,
        e?.clubOwner,
        e?.clubMembers,
        e?.clubRegion,
        e?.clubDescription,
        e?.clubJoinRequest
      ]);

  @override
  bool isValidKey(Object? o) => o is ClubsRecord;
}
