import 'package:collaction_app/presentation/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../services.dart';

Widget initialWidget = AppWidget();

void main() {
  group('Tests for AppWidget build() method', () {
    setUp(() {
      registerServices();
    });
    testWidgets('Testing MultiBloc Provider', (tester) async {
      await tester.pumpWidget(initialWidget);
      final multiBlocProvider = find.byType(MultiBlocProvider);
      expect(multiBlocProvider, findsOneWidget);
    });
  });
}
