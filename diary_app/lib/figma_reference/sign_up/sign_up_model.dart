import '../../customs/utils.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends CustomModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DisplayUserName widget.
  FocusNode? displayUserNameFocusNode;
  TextEditingController? displayUserNameTextController;
  String? Function(BuildContext, String?)?
      displayUserNameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for birthday widget.
  FocusNode? birthdayFocusNode;
  TextEditingController? birthdayTextController;
  String? Function(BuildContext, String?)? birthdayTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for ConfirmPass widget.
  FocusNode? confirmPassFocusNode;
  TextEditingController? confirmPassTextController;
  late bool confirmPassVisibility;
  String? Function(BuildContext, String?)? confirmPassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPassVisibility = false;
  }

  @override
  void dispose() {
    displayUserNameFocusNode?.dispose();
    displayUserNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    birthdayFocusNode?.dispose();
    birthdayTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPassFocusNode?.dispose();
    confirmPassTextController?.dispose();
  }
}
