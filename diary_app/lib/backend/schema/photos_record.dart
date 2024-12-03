import 'dart:async';

import 'package:collection/collection.dart';

import '../backend.dart';

import '../../customs/utils.dart';

class PhotosRecord extends FirestoreRecord {
  PhotosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "photos" field.
  String? _photos;
  String get photos => _photos ?? '';
  bool hasPhotos() => _photos != null;

  // "multiple_photos" field.
  List<String>? _multiplePhotos;
  List<String> get multiplePhotos => _multiplePhotos ?? const [];
  bool hasMultiplePhotos() => _multiplePhotos != null;

  void _initializeFields() {
    _photos = snapshotData['photos'] as String?;
    _multiplePhotos = getDataList(snapshotData['multiple_photos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('photos');

  static Stream<PhotosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhotosRecord.fromSnapshot(s));

  static Future<PhotosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PhotosRecord.fromSnapshot(s));

  static PhotosRecord fromSnapshot(DocumentSnapshot snapshot) => PhotosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhotosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhotosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhotosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhotosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhotosRecordData({
  String? photos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photos': photos,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhotosRecordDocumentEquality implements Equality<PhotosRecord> {
  const PhotosRecordDocumentEquality();

  @override
  bool equals(PhotosRecord? e1, PhotosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.photos == e2?.photos &&
        listEquality.equals(e1?.multiplePhotos, e2?.multiplePhotos);
  }

  @override
  int hash(PhotosRecord? e) =>
      const ListEquality().hash([e?.photos, e?.multiplePhotos]);

  @override
  bool isValidKey(Object? o) => o is PhotosRecord;
}
