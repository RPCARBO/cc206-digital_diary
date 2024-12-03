import '/auth/firebase_auth/auth_util.dart';
import '/components/emailverifybool_widget.dart';
import '../../customs/ff_themes.dart';
import '../../customs/utils.dart';
import '../../customs/ff_widgets.dart';
import 'package:flutter/material.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.emailloginTextController ??= TextEditingController();
    _model.emailloginFocusNode ??= FocusNode();

    _model.loginpassTextController ??= TextEditingController();
    _model.loginpassFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFBBC5AA),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: double.infinity,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Digital Keeper',
                  style: CustomedTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto Mono',
                    color: const Color(0xFFA72608),
                    fontSize: 40.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: CustomedTheme.of(context).secondaryText,
                        offset: const Offset(-4.0, 5.0),
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 307.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6EED6),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              4.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: SizedBox(
                                width: 200.0,
                                child: TextFormField(
                                  controller: _model.emailloginTextController,
                                  focusNode: _model.emailloginFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: CustomedTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0xFFA72608),
                                          fontSize: 0.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Email',
                                    hintStyle: CustomedTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0xFFA72608),
                                          fontSize: 18.0,
                                          letterSpacing: 2.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CustomedTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CustomedTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0x00C72525),
                                    prefixIcon: const Icon(
                                      Icons.mail,
                                      color: Color(0xFFA72608),
                                      size: 26.0,
                                    ),
                                  ),
                                  style: CustomedTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFFA72608),
                                        fontSize: 18.0,
                                        letterSpacing: 2.0,
                                      ),
                                  cursorColor:
                                      CustomedTheme.of(context).primaryText,
                                  validator: _model
                                      .emailloginTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 307.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6EED6),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              4.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: SizedBox(
                                width: 200.0,
                                child: TextFormField(
                                  controller: _model.loginpassTextController,
                                  focusNode: _model.loginpassFocusNode,
                                  autofocus: false,
                                  obscureText: !_model.loginpassVisibility,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: CustomedTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0xFFA72608),
                                          fontSize: 0.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Password',
                                    hintStyle: CustomedTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: const Color(0xFFA72608),
                                          fontSize: 18.0,
                                          letterSpacing: 2.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CustomedTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CustomedTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0x00C72525),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Color(0xFFA72608),
                                      size: 26.0,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => safeSetState(
                                        () => _model.loginpassVisibility =
                                            !_model.loginpassVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.loginpassVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: CustomedTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFFA72608),
                                        fontSize: 18.0,
                                        letterSpacing: 2.0,
                                      ),
                                  cursorColor:
                                      CustomedTheme.of(context).primaryText,
                                  validator: _model
                                      .loginpassTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(const SizedBox(height: 25.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        await authManager.refreshUser();
                        GoRouter.of(context).prepareAuthEvent();

                        final user = await authManager.signInWithEmail(
                          context,
                          _model.emailloginTextController.text,
                          _model.loginpassTextController.text,
                        );
                        if (user == null) {
                          return;
                        }

                        if (currentUserEmailVerified == true) {
                          context.pushNamedAuth('MenuPage', context.mounted);
                        } else {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            isDismissible: false,
                            enableDrag: false,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const EmailverifyboolWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        }
                      },
                      text: 'Login',
                      options: FFButtonOptions(
                        width: 307.0,
                        height: 60.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFA72608),
                        textStyle:
                            CustomedTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'PassReset',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                              ),
                            },
                          );
                        },
                        child: Text(
                          'Forgot your password?',
                          style:
                              CustomedTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      width: 1.0,
                      height: 25.0,
                      decoration: const BoxDecoration(),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('SignUp');
                      },
                      text: 'Sign Up',
                      options: FFButtonOptions(
                        width: 307.0,
                        height: 60.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: CustomedTheme.of(context).primaryBackground,
                        textStyle:
                            CustomedTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: CustomedTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    Container(
                      width: 1.0,
                      height: 10.0,
                      decoration: const BoxDecoration(),
                    ),
                  ],
                ),
              ].divide(const SizedBox(height: 85.0)),
            ),
          ),
        ),
      ),
    );
  }
}
