import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import '../../customs/utils.dart';

class EntriesRecord extends FirestoreRecord {
  EntriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "post_photo" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  void _initializeFields() {
    _postPhoto = snapshotData['post_photo'] as String?;
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _images = getDataList(snapshotData['images']);
    _author = snapshotData['author'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('entries');

  static Stream<EntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EntriesRecord.fromSnapshot(s));

  static Future<EntriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EntriesRecord.fromSnapshot(s));

  static EntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEntriesRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DateTime? timePosted,
  DocumentReference? author,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_photo': postPhoto,
      'post_title': postTitle,
      'post_description': postDescription,
      'time_posted': timePosted,
      'author': author,
    }.withoutNulls,
  );

  return firestoreData;
}

class EntriesRecordDocumentEquality implements Equality<EntriesRecord> {
  const EntriesRecordDocumentEquality();

  @override
  bool equals(EntriesRecord? e1, EntriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postPhoto == e2?.postPhoto &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.author == e2?.author;
  }

  @override
  int hash(EntriesRecord? e) => const ListEquality().hash([
        e?.postPhoto,
        e?.postTitle,
        e?.postDescription,
        e?.timePosted,
        e?.images,
        e?.author
      ]);

  @override
  bool isValidKey(Object? o) => o is EntriesRecord;
}
