import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:animated_textformfields/animated_textformfields.dart';

void main() {
  TextEditingController textEditingControllerAnimated =
      new TextEditingController();
  TextEditingController textEditingControllerLite = new TextEditingController();
  TextEditingController textEditingControllerSlideIn = new TextEditingController();
  FocusNode focusNode = new FocusNode();
  testWidgets('Animated TextFormField renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Animated TextFormField Test',
        home: Scaffold(
          body: Container(
            child: AnimatedTextFormField(
              width: 200.0,
              height: 48.0,
              inputType: TextInputType.text,
              hintText: "Name",
              controller: textEditingControllerAnimated,
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

  testWidgets('Custom TextFormField Lite renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Custom TextFormField Lite Test',
        home: Scaffold(
          body: Container(
            child: CustomTextFormFieldLite(
              width: 200.0,
              height: 48.0,
              inputType: TextInputType.text,
              hintText: "Name",
              controller: textEditingControllerLite,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              cornerRadius: BorderRadius.circular(14.0),
            ),
          ),
        ),
      ),
    );
  });
}
