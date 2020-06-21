import 'package:animated_textformfields/definitions/callbacks.dart';
import 'package:flutter/material.dart';
import 'package:animated_textformfields/custom_textformfield_lite/custom_textformfield_lite.dart';
import 'package:animated_size_and_fade/animated_size_and_fade.dart';

class SlideInTextFormField extends StatefulWidget {
  // sets the duration for the animation
  // default is 500 milliseconds
  final Duration animationDuration;


  // sets the vsync
  // required
  final TickerProvider vsync;


  // sets the width of the textformfield
  final double width;


  // sets the height of the textformfield
  // default is set to 48.0
  final double height;


  // toogles between a shadow and a very light border
  // default is false
  final bool hasShadow;


  // background color of the textformfield
  // default color is #EEEEEE
  final Color backgroundColor;


  // the corner radius of the textformfield when it does not have focus
  // default is 16.0
  final BorderRadius cornerRadius;


  // sets the text style of both the text and the hintText
  // default is an empty string
  final TextStyle textStyle;


  // sets the hint text and the field text
  // this is required
  final String fieldText;


  // validator is a function that returns a string
  // if the entered text is invalid
  // return null if it is valid
  final StringCallback validator;


  // toggles between obscuring text and keeping plain text
  // recommended for fields that take sensitive information like passwords
  // default is false
  final bool obscureText;


  // defines the TextInputType
  // default is TextInputType.text
  final TextInputType inputType;


  // defines the focusNode
  final FocusNode focusNode;


  // defines the TextEditingController
  final TextEditingController controller;


  // defines the TextInputAction
  // default is TextInputAction.done
  final TextInputAction textInputAction;


  // defines the color when the textformfield has focus
  // default is Colors.white
  final Color focusColor;


  // sets the cursor color
  // default is #0A2552
  final Color cursorColor;


  // the maximum lines of text it will render
  final int maxLines;


  // sets the TextOverFlow 
  final TextOverflow textOverflow;


  // sets the padding
  // default is EdgeInsets.fromLTRB(32.0, 0.0, 84.0, 0.0),
  final EdgeInsets padding;

  // these are generic textformfield parameters
  final int maxLength, minLines;
  final bool autocorrect;
  final bool autofocus;
  final EdgeInsets margin;
  final ValueChanged<String> onChanged, onSubmitted;
  final bool enabled;
  final GestureTapCallback onTap;

  const SlideInTextFormField(
      {Key key,
      this.animationDuration = const Duration(milliseconds: 500),
      @required this.vsync,
      @required this.width,
      @required this.controller,
      @required this.fieldText,
      this.focusNode,
      this.height = 48.0,
      this.inputType,
      this.margin = const EdgeInsets.all(10),
      this.obscureText = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.cornerRadius = const BorderRadius.all(Radius.circular(16)),
      this.cursorColor = const Color(0xff0a2552),
      this.focusColor = Colors.white,
      this.hasShadow = false,
      this.textStyle,
      this.validator,
      this.autofocus = false,
      this.autocorrect = false,
      this.enabled = true,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.padding = const EdgeInsets.fromLTRB(32.0, 0.0, 84.0, 0.0),
      this.onChanged,
      this.textOverflow = TextOverflow.ellipsis,
      this.onTap,
      this.textInputAction,
      this.onSubmitted})
      : assert(width != null),
        assert(vsync != null),
        assert(controller != null),
        assert(fieldText != null),
        super(key: key);

  @override
  _SlideInTextFormFieldState createState() => _SlideInTextFormFieldState();
}

class _SlideInTextFormFieldState extends State<SlideInTextFormField> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.animationDuration,
      child: Column(
        children: [
          AnimatedSizeAndFade(
            vsync: widget.vsync,
            child: widget.controller.text != ""
                ? Padding(
                    padding: widget.padding,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.fieldText,
                        overflow: widget.textOverflow,
                        maxLines: widget.maxLines,
                      ),
                    ),
                  )
                : Container(),
          ),
          CustomTextFormFieldLite(
            width: widget.width,
            height: widget.height,
            inputType: widget.inputType == null
                ? TextInputType.text
                : widget.inputType,
            textStyle: widget.textStyle,
            hasShadow: widget.hasShadow,
            backgroundColor: widget.backgroundColor,
            cornerRadius: widget.cornerRadius,
            onSubmitted: widget.onSubmitted,
            hintText: widget.fieldText,
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.obscureText,
            autofocus: widget.autofocus,
            autocorrect: widget.autocorrect,
            focusNode: widget.focusNode,
            enabled: widget.enabled,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            textInputAction: widget.textInputAction == null ? TextInputAction.done : widget.textInputAction,
          ),
        ],
      ),
    );
  }
}
