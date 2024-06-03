import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:testapplication/feature/auth/otp_verification.dart';

import '../../core/app_colors.dart';

class LogIn extends StatelessWidget {
  final TextEditingController _phController = TextEditingController();

  final void Function()? onTap;

  LogIn({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 20, top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonTitleText(
                heading: 'LogIn',
                subHeading: 'Log in to Continue',
              ),
              SizedBox(
                height: containerWidth * 0.06,
              ),
              CommonTextFormField(
                hintText: "9800072183",
                controller: _phController,
                maxLine: 1,
                textInputType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              CommonButton(
                onClicked: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OtpVerification()),
                  )
                },
                label: "LOG IN",
                buttonHeight: containerWidth * 0.06,
                buttonWidth: containerWidth * 0.8,
                fontSize: 20,
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonTitleText extends StatelessWidget {
  final String heading;
  final String subHeading;
  const CommonTitleText(
      {super.key, required this.heading, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 00.0, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 40,
                color: Color(0xffff6600),
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subHeading,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.colorSecondaryText2),
          )
        ],
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  final String? label;
  late Function()? onClicked;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final List<Color>? gradColor;
  final Color? borderColor;
  final double borderRadius;
  final Color? solidColor;
  final double? fontSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final bool? isLoading;

  CommonButton(
      {this.label,
      this.onClicked,
      this.labelColor,
      this.gradColor,
      this.solidColor,
      this.borderColor,
      this.borderRadius = 12.0,
      this.fontSize,
      this.buttonHeight = 50.0,
      this.buttonWidth,
      this.labelFontWeight,
      this.isLoading,
      super.key});

  @override
  Widget build(BuildContext context) {
    return (isLoading ?? false)
        ? const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primaryButtonColor)))
        : Bounce(
            duration: const Duration(milliseconds: 200),
            onPressed: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              if (onClicked != null) onClicked!();
            },
            child: Container(
              // alignment: Alignment.center,

              height: buttonHeight,
              width: buttonWidth,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
              decoration: BoxDecoration(
                  gradient: solidColor == null
                      ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: gradColor ??
                              [
                                const Color(0xffff6600),
                                const Color(0xECE5715F),
                              ])
                      : null,
                  color: solidColor,
                  border: borderColor != null
                      ? Border.all(
                          color: borderColor!,
                          width: 1.0,
                        )
                      : null,
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
              child: Center(
                child: Text(
                  label ?? "",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: labelColor ?? AppColors.white,
                      fontFamily: 'Roboto',
                      fontSize: fontSize ?? 16,
                      fontWeight: labelFontWeight ?? FontWeight.w500),
                ),
              ),
            ));
  }
}

class CommonTextFormField extends StatefulWidget {
  late TextEditingController? controller;
  final String? suffixIcon;
  final TextInputAction textInputAction;
  final String hintText;
  final String? labelText;
  final TextInputType textInputType;
  final Color fillColors;
  final TextAlign textAlign;
  final Function(String)? onValueChanged;
  final Function(String?)? onValidator;
  final Function()? onSuffixClick;
  final Function? onSuffixClickWithValue;
  final bool? isProgressSuffix;
  final bool? obscureText;
  final bool readOnly;
  final bool? isEnable;
  List<TextInputFormatter>? inputFormatters;
  final Function(String? value)? onSave;
  final Function()? onTap;
  final String? initialValue;
  final InputDecoration? decoration;
  final int maxLine;
  final int? maxLength;
  final FocusNode? focusNode;

  CommonTextFormField(
      {this.controller,
      super.key,
      this.labelText,
      this.hintText = "",
      this.readOnly = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.fillColors = Colors.transparent,
      this.suffixIcon,
      this.textAlign = TextAlign.start,
      this.onValueChanged,
      this.onTap,
      this.onValidator,
      this.decoration,
      this.maxLine = 1,
      this.isProgressSuffix,
      this.onSuffixClick,
      this.onSave,
      this.isEnable,
      this.initialValue,
      this.focusNode,
      this.maxLength,
      this.inputFormatters,
      this.onSuffixClickWithValue});

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  String? textValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtils().screenWidth(context),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: const TextStyle(color: AppColors.black),
              onTap: widget.onTap,
              cursorColor: AppColors.primaryButtonColor,
              obscureText: widget.obscureText!,
              readOnly: widget.readOnly,
              enabled: widget.isEnable,
              maxLength: widget.maxLength,
              initialValue: widget.initialValue,
              controller: widget.controller,
              textAlign: widget.textAlign,
              maxLines: widget.maxLine,
              focusNode: widget.focusNode,
              inputFormatters: widget.inputFormatters,
              onSaved: (value) {
                if (widget.onSave != null) {
                  widget.onSave!(value);
                }
              },
              textCapitalization: TextCapitalization.sentences,
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType,
              textAlignVertical: TextAlignVertical.center,
              decoration: widget.decoration ??
                  AppDecoration.sFormField.copyWith(
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primaryButtonColor, width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primaryButtonColor, width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: widget.fillColors,
                      labelText: widget.labelText,
                      hintText: widget.hintText,
                      labelStyle:
                          const TextStyle(color: AppColors.colorSecondaryText2),
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      isDense: true,
                      counterText: '',
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 2,
                        minHeight: 2,
                      ),
                      suffixIcon: widget.suffixIcon != null
                          ? InkWell(
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                if (widget.onSuffixClick != null) {
                                  widget.onSuffixClick!();
                                }
                                if (widget.onSuffixClickWithValue != null) {
                                  widget.onSuffixClickWithValue!(textValue);
                                }
                              },
                              child: const Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Icon(
                                    Icons.phone,
                                    size: 30,
                                    color: Colors.red,
                                  )),
                            )
                          : null),
              onChanged: (value) {
                textValue = value;
                widget.onValueChanged != null
                    ? widget.onValueChanged!(value)
                    : null;
              },
              validator: (value) => widget.onValidator != null
                  ? widget.onValidator!(value)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenUtils {
  static final ScreenUtils _instance = ScreenUtils._internal();

  factory ScreenUtils() {
    return _instance;
  }

  ScreenUtils._internal();

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double dynamicHeight(
          BuildContext context, double upperLimit, double lowerLimit) =>
      (lowerLimit * screenHeight(context)) / upperLimit;
}

class AppDecoration {
  static final AppDecoration _instance = AppDecoration._internal();

  factory AppDecoration() {
    return _instance;
  }

  AppDecoration._internal();

  static InputDecoration sFormField = InputDecoration(
    contentPadding:
        const EdgeInsets.only(left: 18.0, bottom: 12.0, top: 12.0, right: 18),
    filled: true,
    // fillColor: AppColors.colorTextBox,
    errorStyle: const TextStyle(
      color: Colors.red,
      fontFamily: 'Roboto',
      fontSize: 14,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: AppColors.primaryButtonColor, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: AppColors.primaryButtonColor, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),

    border: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 5),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
    ),

    errorMaxLines: 1,
    floatingLabelStyle: const TextStyle(
        color: AppColors.colorSecondaryText2,
        fontSize: 18.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600),
    labelStyle: const TextStyle(
        color: AppColors.primaryButtonColor,
        fontSize: 14.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400),
    hintStyle: const TextStyle(
        color: AppColors.colorSecondaryText2,
        fontSize: 14.0,
        fontFamily: 'Roboto',
        height: 0,
        fontWeight: FontWeight.w400),
    helperMaxLines: 1,
  );

  static const formFieldDecorationForMultipleLine = InputDecoration(
    hintText: "Hint Here",
    hintStyle: TextStyle(
        color: AppColors.colorSecondaryText2,
        fontSize: 14.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400),
    helperMaxLines: 1,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(16))),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(16))),
  );
}
