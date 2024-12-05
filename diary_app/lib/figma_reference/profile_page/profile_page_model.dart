import '../../customs/utils.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends CustomModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  UploadedFile uploadedLocalFile =
      UploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
