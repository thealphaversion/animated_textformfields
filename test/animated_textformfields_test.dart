import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:animated_textformfields/animated_textformfields.dart';

void main() {
  TextEditingController textEditingController = new TextEditingController();
  FocusNode focusNode = new FocusNode();
  testWidgets('Animated TextField renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Animated TextField Test',
        home: Scaffold(
          body: Container(
            child: AnimatedTextFormField(
              width: 200.0,
              height: 48.0,
              inputType: TextInputType.text,
              hintText: "Name",
              controller: textEditingController,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              focusNode: focusNode,
              cornerRadius: BorderRadius.circular(14.0),
            ),
          ),
        ),
      ),
    );
  });
}
