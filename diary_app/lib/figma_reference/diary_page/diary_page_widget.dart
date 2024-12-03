import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/emptyentry_widget.dart';
import '../../customs/icon_button.dart';
import '../../customs/ff_themes.dart';
import '../../customs/utils.dart';
import 'package:flutter/material.dart';
import 'diary_page_model.dart';
export 'diary_page_model.dart';

class DiaryPageWidget extends StatefulWidget {
  const DiaryPageWidget({super.key});

  @override
  State<DiaryPageWidget> createState() => _DiaryPageWidgetState();
}

class _DiaryPageWidgetState extends State<DiaryPageWidget> {
  late DiaryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiaryPageModel());
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
        floatingActionButton: Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 0.0, 0.0),
            child: FloatingActionButton(
              onPressed: () async {
                context.pushNamed('CreateDiary');
              },
              backgroundColor: const Color(0xFFDDE2C6),
              elevation: 10.0,
              child: const Icon(
                Icons.add_rounded,
                color: Color(0xFFA72608),
                size: 30.0,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFFA72608),
          automaticallyImplyLeading: false,
          leading: CustomizedIconButton(
            borderRadius: 8.0,
            buttonSize: 40.0,
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFFE6EED6),
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed('MenuPage');
            },
          ),
          title: Text(
            'January',
            style: CustomedTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: const Color(0xFFE6EED6),
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFDDE2C6),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            4.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'It is ',
                            style: CustomedTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Flexible(
                            child: Text(
                              dateTimeFormat("yMMMd", getCurrentTimestamp),
                              style: CustomedTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 15.0),
                  child: StreamBuilder<List<EntriesRecord>>(
                    stream: queryEntriesRecord(
                      queryBuilder: (entriesRecord) => entriesRecord
                          .where(
                            'author',
                            isEqualTo: currentUserReference,
                          )
                          .orderBy('time_posted', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                CustomedTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<EntriesRecord> diaryEntriesEntriesRecordList =
                          snapshot.data!;
                      if (diaryEntriesEntriesRecordList.isEmpty) {
                        return const EmptyentryWidget();
                      }

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: diaryEntriesEntriesRecordList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                        itemBuilder: (context, diaryEntriesIndex) {
                          final diaryEntriesEntriesRecord =
                              diaryEntriesEntriesRecordList[diaryEntriesIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 30.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFDDE2C6),
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                4.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                      "yMMMd",
                                                      diaryEntriesEntriesRecord
                                                          .timePosted!),
                                                  style: CustomedTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF090C02),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Text(
                                                  diaryEntriesEntriesRecord
                                                      .postTitle,
                                                  style: CustomedTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF090C02),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    diaryEntriesEntriesRecord
                                                        .postDescription,
                                                    style: CustomedTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Visibility(
                                                              visible: diaryEntriesEntriesRecord
                                                                          .postPhoto !=
                                                                      null &&
                                                                  diaryEntriesEntriesRecord
                                                                          .postPhoto !=
                                                                      '',
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  diaryEntriesEntriesRecord
                                                                      .postPhoto,
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
