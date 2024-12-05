import '../customs/themes.dart';
import '../customs/utils.dart';
import 'package:flutter/material.dart';
import 'emptyentry_model.dart';
export 'emptyentry_model.dart';

class EmptyentryWidget extends StatefulWidget {
  const EmptyentryWidget({super.key});

  @override
  State<EmptyentryWidget> createState() => _EmptyentryWidgetState();
}

class _EmptyentryWidgetState extends State<EmptyentryWidget> {
  late EmptyentryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyentryModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.notifications_none,
                  color: Color(0xFFA72608),
                  size: 72.0,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Empty Diary :(',
                    style: CustomedTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: const Color(0xFFA72608),
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Text(
                    'It seems that you don\'t have any recent entries.',
                    style: CustomedTheme.of(context).labelMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: const Color(0xFFA72608),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
