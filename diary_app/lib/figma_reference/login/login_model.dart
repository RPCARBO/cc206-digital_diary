import '../../customs/utils.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends CustomModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emaillogin widget.
  FocusNode? emailloginFocusNode;
  TextEditingController? emailloginTextController;
  String? Function(BuildContext, String?)? emailloginTextControllerValidator;
  // State field(s) for loginpass widget.
  FocusNode? loginpassFocusNode;
  TextEditingController? loginpassTextController;
  late bool loginpassVisibility;
  String? Function(BuildContext, String?)? loginpassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    loginpassVisibility = false;
  }

  @override
  void dispose() {
    emailloginFocusNode?.dispose();
    emailloginTextController?.dispose();

    loginpassFocusNode?.dispose();
    loginpassTextController?.dispose();
  }
}
