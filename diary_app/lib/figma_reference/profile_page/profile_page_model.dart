import 'package:flutter/material.dart';
import '../../customs/utils.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;

class ProfilePageModel extends CustomModel<ProfilePageWidget> {
  // State fields for stateful widgets in this page.
  bool isDataUploading = false;
  
  UploadedFile uploadedLocalFile =
      UploadedFile(bytes: Uint8List.fromList([]));
  
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    // Initialize any state or data here.
  }

  @override
  void dispose() {
    // Clean up any resources here.
  }
}
