// Flutter imports:
// ignore_for_file: public_member_api_docs

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';
import 'package:teta_core/src/blocs/text_styles/index.dart';
import 'package:teta_core/src/models/text_style.dart';
// Project imports:
import 'package:teta_widgets/src/elements/controls/key_constants.dart';
import 'package:teta_widgets/src/elements/features/font_weight.dart';
import 'package:teta_widgets/src/elements/index.dart';

class FTextStyle {
  /// Set of funcs to use TextStyle in Teta's widgets
  FTextStyle({
    this.fill,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textDecoration,
    this.textAlign,
    this.fontStyle,
    this.textStyleModel,
    this.textDirection,
  }) {
    fill ??= FFill(
      type: FFillType.solid,
      levels: [
        FFillElement(color: 'ffffff', stop: 0),
      ],
    );
    fontSize ??= FFontSize();
    fontFamily ??= 'Poppins';
    fontWeight ??= FFontWeight();
    textDecoration ??= FTextDecoration();
    textAlign ??= FTextAlign();
    fontStyle ??= FFontStyle();
    textDirection ??= FTextDirection();
  }

  FFill? fill;
  FFontSize? fontSize;
  String? fontFamily;
  FFontWeight? fontWeight;
  FTextDecoration? textDecoration;
  FTextAlign? textAlign;
  FFontStyle? fontStyle;
  String? textStyleModel;
  FTextDirection? textDirection;

  TextStyle get(
    final BuildContext context,
    final TextStyleModel? model,
  ) {
    return TetaTextStyles.get(
      context: context,
      model: model,
      fill: fill ??
          FFill(
            type: FFillType.solid,
            levels: [FFillElement(color: '000000', stop: 0)],
          ),
      fontFamily: fontFamily ?? 'Poppins',
      fontSize: fontSize ?? FFontSize(),
      fontWeight: fontWeight ?? FFontWeight(),
      textDecoration: textDecoration ?? FTextDecoration(),
      fontStyle: fontStyle ?? FFontStyle(),
    );
  }

  static FTextStyle fromJson(final Map<String, dynamic> doc) {
    try {
      return FTextStyle(
        fill: doc[DBKeys.fill] != null
            ? FFill().fromJson(doc[DBKeys.fill] as Map<String, dynamic>)
            : FFill(
                type: FFillType.solid,
                levels: [FFillElement(color: '000000', stop: 0)],
              ),
        fontSize: doc[DBKeys.fontSize] != null
            ? FFontSize().fromJson(doc[DBKeys.fontSize])
            : FFontSize(),
        fontFamily: doc[DBKeys.fontFamily] as String? ?? 'Poppins',
        fontWeight: doc[DBKeys.fontWeight] != null
            ? FFontWeight().fromJson(doc[DBKeys.fontWeight] as String)
            : FFontWeight(),
        textDecoration: doc[DBKeys.textDecoration] != null
            ? FTextDecoration.fromJson(doc[DBKeys.textDecoration] as String)
            : FTextDecoration(),
        textAlign: doc[DBKeys.textAlign] != null
            ? FTextAlign.fromJson(doc[DBKeys.textAlign] as String)
            : FTextAlign(),
        fontStyle: doc[DBKeys.fontStyle] != null
            ? FFontStyle().fromJson(doc[DBKeys.fontStyle] as String)
            : FFontStyle(),
        textDirection: doc[DBKeys.textDirection] != null
            ? FTextDirection.fromJson(doc[DBKeys.textDirection] as String)
            : FTextDirection(),
        textStyleModel: doc[DBKeys.textStyleModel] as String?,
      );
    } catch (e) {
      return FTextStyle(
        fill: FFill(
          type: FFillType.solid,
          levels: [FFillElement(color: '000000', stop: 0)],
        ),
        fontSize: FFontSize(),
        fontFamily: 'Poppins',
        fontWeight: FFontWeight(),
        textDecoration: FTextDecoration(),
        textAlign: FTextAlign(),
        fontStyle: FFontStyle(),
        textDirection: FTextDirection(),
      );
    }
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        DBKeys.fill: (fill != null)
            ? fill!.toJson()
            : FFill(
                type: FFillType.solid,
                levels: [FFillElement(color: '000000', stop: 0)],
              ).toJson(),
        DBKeys.fontSize:
            (fontSize != null) ? fontSize!.toJson() : FFontSize().toJson(),
        DBKeys.fontFamily: fontFamily ?? 'Poppins',
        DBKeys.fontWeight: (fontWeight != null)
            ? fontWeight!.toJson()
            : FFontWeight().toJson(),
        DBKeys.textDecoration: (textDecoration != null)
            ? textDecoration!.toJson()
            : FTextDecoration().toJson(),
        DBKeys.textAlign:
            (textAlign != null) ? textAlign!.toJson() : FTextAlign().toJson(),
        DBKeys.fontStyle:
            (fontStyle != null) ? fontStyle!.toJson() : FFontStyle().toJson(),
        DBKeys.textDirection: (textDirection != null)
            ? textDirection!.toJson()
            : FTextDirection().toJson(),
        DBKeys.textStyleModel: textStyleModel,
      };

  /// Returns style (TextStyle) and textAlign (TextAlign) property
  /// ```dart
  /// style: TextStyle(
  ///   color: Colors.black,
  ///   fontWeight: FontWeight.normal,
  ///   fontSize: 16,
  ///   fontFamily: '',
  ///   fontStyle: FontStyle.normal,
  ///   decoration: TextDecoration.none,
  /// ),
  /// textAlign: TextAlign.center,
  /// ```
  String toCode(final BuildContext context) {
    TextStyleModel? model;
    if (textStyleModel != null) {
      BlocProvider.of<TextStylesBloc>(context).state.forEach((final element) {
        if (element.name == textStyleModel) model = element;
      });
    }

    final rc = ReCase((model?.fontFamily ?? fontFamily) ?? 'Poppins');

    final align = textAlign?.toCode();
    final color = fill?.getHexColor(context);
    final size = (model?.fontSize ?? fontSize)?.toCode();
    final weight = (model?.fontWeight ?? fontWeight)?.toCode();
    final style = fontStyle?.toCode();
    final decoration = textDecoration?.toCode();
    final direction = textDirection?.toCode();

    return '''
    style: GoogleFonts.${rc.camelCase}(
      textStyle: TextStyle(
        color: Color(0xFF$color).withOpacity(${fill?.levels?.first.opacity ?? '1'}),
        fontWeight: $weight,
        fontSize: $size,
        fontStyle: $style,
        decoration: $decoration,
      ),
    ),
    textAlign: $align,
    textDirection: $direction,
    ''';
  }
}

Widget example() {
  return const Text(
    '',
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      fontFamily: '',
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    ),
    textAlign: TextAlign.center,
  );
}
