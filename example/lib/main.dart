import 'package:flutter/material.dart';
import 'package:animated_textformfields/animated_textformfields.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated TextFields Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DemoPage(title: 'Demo Home Page'),
    );
  }
}

class DemoPage extends StatefulWidget {
  DemoPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> with TickerProviderStateMixin {
  FocusNode myFocusNode = FocusNode();
  TextEditingController textEditingControllerAnimated =
      new TextEditingController();
  TextEditingController textEditingControllerLite = new TextEditingController();
  TextEditingController textEditingControllerSlideIn = new TextEditingController();

  @override
  void dispose() {
    textEditingControllerAnimated.dispose();
    textEditingControllerLite.dispose();
    textEditingControllerSlideIn.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
            child: Text(
              'Animated TextFields Demo',
              style: TextStyle(
                fontSize: 24.0,
              ),
              maxLines: 3,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36.0, 12.0, 12.0, 4.0),
              child: Text(
                'AnimatedTextFormField',
                style: TextStyle(
                  fontSize: 18.0,
                ),
                maxLines: 1,
              ),
            ),
          ),
          // this example describes how to use AnimatedTextFormField
          AnimatedTextFormField(
            width: MediaQuery.of(context).size.width * 0.875,
            height: 48.0,
            inputType: TextInputType.text,
            hintText: "Name",
            controller: textEditingControllerAnimated,
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
            focusNode: myFocusNode,
            cornerRadius: BorderRadius.circular(14.0),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36.0, 24.0, 12.0, 4.0),
              child: Text(
                'CustomTextFormFieldLite',
                style: TextStyle(
                  fontSize: 18.0,
                ),
                maxLines: 1,
              ),
            ),
          ),
          // this example describes how to use CustomTextFormFieldLite
          CustomTextFormFieldLite(
            width: MediaQuery.of(context).size.width * 0.875,
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
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36.0, 24.0, 12.0, 4.0),
              child: Text(
                'SlideInTextFormField',
                style: TextStyle(
                  fontSize: 18.0,
                ),
                maxLines: 1,
              ),
            ),
          ),
          // this example describes how to use SlideInTextFormField
          SlideInTextFormField(
            vsync: this,
            width: MediaQuery.of(context).size.width * 0.875,
            height: 48.0,
            inputType: TextInputType.text,
            fieldText: "Name",
            controller: textEditingControllerSlideIn,
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
            cornerRadius: BorderRadius.circular(14.0),
          ),
        ],
      ),
    );
  }
}
