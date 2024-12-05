import '../../customs/utils.dart';
import 'create_diary_widget.dart' show CreateDiaryWidget;
import 'package:flutter/material.dart';

class CreateDiaryModel extends CustomModel<CreateDiaryWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  UploadedFile uploadedLocalFile1 =
      UploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for DiaryEntry widget.
  FocusNode? diaryEntryFocusNode;
  TextEditingController? diaryEntryTextController;
  String? Function(BuildContext, String?)? diaryEntryTextControllerValidator;
  bool isDataUploading2 = false;
  UploadedFile uploadedLocalFile2 =
      UploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    diaryEntryFocusNode?.dispose();
    diaryEntryTextController?.dispose();
  }
}
