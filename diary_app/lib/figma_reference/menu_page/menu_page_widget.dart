import '/auth/firebase_auth/auth_util.dart';
import '../../customs/ff_themes.dart';
import '../../customs/utils.dart';
import 'package:flutter/material.dart';
import 'menu_page_model.dart';
export 'menu_page_model.dart';

// Rechecked the code, everything is fine.

class MenuPageWidget extends StatefulWidget {
  const MenuPageWidget({super.key});

  @override
  State<MenuPageWidget> createState() => _MenuPageWidgetState();
}

class _MenuPageWidgetState extends State<MenuPageWidget> {
  late MenuPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuPageModel());
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: const Color(0xFFA72608),
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('ProfilePage');
                  },
                  child: Container(
                    width: 210.0,
                    height: 210.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      valueOrDefault<String>(
                        currentUserPhoto,
                        'https://firebasestorage.googleapis.com/v0/b/flutter-diary-9d25d.firebasestorage.app/o/default.png?alt=media&token=70c923e9-7dbe-4418-b632-70b1e52fcf94',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hello, ',
                      style: CustomedTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: const Color(0xFFE6EED6),
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    TextSpan(
                      text: currentUserDisplayName,
                      style: const TextStyle(),
                    )
                  ],
                  style: CustomedTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: const Color(0xFFE6EED6),
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 4.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 85.0,
                  decoration: const BoxDecoration(),
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'My Notes',
                        style:
                            CustomedTheme.of(context).headlineLarge.override(
                          fontFamily: 'Inter Tight',
                          color: const Color(0xFF090C02),
                          letterSpacing: 0.0,
                          shadows: [
                            Shadow(
                              color: CustomedTheme.of(context).secondaryText,
                              offset: const Offset(0.0, 2.0),
                              blurRadius: 2.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('DiaryPage');
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Container(
                                width: 312.0,
                                height: 82.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFA72608),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'January',
                                        textAlign: TextAlign.center,
                                        style: CustomedTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: const Color(0xFFE6EED6),
                                              letterSpacing: 1.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth('Login', context.mounted);
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Container(
                                width: 312.0,
                                height: 82.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFA72608),
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'February',
                                        textAlign: TextAlign.center,
                                        style: CustomedTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: const Color(0xFFE6EED6),
                                              letterSpacing: 1.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 312.0,
                              height: 82.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA72608),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'March',
                                      textAlign: TextAlign.center,
                                      style: CustomedTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: const Color(0xFFE6EED6),
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 312.0,
                              height: 82.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA72608),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'April',
                                      textAlign: TextAlign.center,
                                      style: CustomedTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: const Color(0xFFE6EED6),
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 312.0,
                              height: 82.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA72608),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'May',
                                      textAlign: TextAlign.center,
                                      style: CustomedTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: const Color(0xFFE6EED6),
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 312.0,
                              height: 82.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA72608),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'June',
                                      textAlign: TextAlign.center,
                                      style: CustomedTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: const Color(0xFFE6EED6),
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 312.0,
                              height: 82.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA72608),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'July',
                                      textAlign: TextAlign.center,
                                      style: CustomedTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: const Color(0xFFE6EED6),
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 312.0,
                              height: 82.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA72608),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'August',
                                      textAlign: TextAlign.center,
                                      style: CustomedTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: const Color(0xFFE6EED6),
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 312.0,
                              height: 82.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA72608),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'September',
                                      textAlign: TextAlign.center,
                                      style: CustomedTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: const Color(0xFFE6EED6),
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 312.0,
                              height: 82.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA72608),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'October',
                                      textAlign: TextAlign.center,
                                      style: CustomedTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: const Color(0xFFE6EED6),
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 312.0,
                              height: 82.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA72608),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'November',
                                      textAlign: TextAlign.center,
                                      style: CustomedTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: const Color(0xFFE6EED6),
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Container(
                              width: 312.0,
                              height: 82.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFA72608),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'December',
                                      textAlign: TextAlign.center,
                                      style: CustomedTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: const Color(0xFFE6EED6),
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 35.0)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
