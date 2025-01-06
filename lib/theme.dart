import 'package:flutter/material.dart';


ThemeData theme() {
  return ThemeData(
    //useMaterial3: true,
    appBarTheme: const AppBarTheme(color: Colors.white),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        // 버튼의 텍스트 스타일 변경
        // textStyle: MaterialStateProperty.all<TextStyle>(
        //   TextStyle(fontSize: 16.0),
        // ),
        // 버튼의 텍스트 색상 변경
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        // 버튼의 배경색상 변경
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        // 버튼의 모서리를 둥글게 변경
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        // 버튼을 눌렀을 때, 배경색상 변경
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) => Colors.blue.withOpacity(0.0),
        ),
      ),
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // 버튼의 텍스트 스타일 변경
        // textStyle: MaterialStateProperty.all<TextStyle>(
        //   TextStyle(color: Colors.white, fontSize: 16.0),
        // ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        // 버튼의 배경색상 변경
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        // 버튼의 모서리를 둥글게 변경
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        // 버튼을 눌렀을 때, 배경색상 변경
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) => Colors.black.withOpacity(0.0),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.black),
      labelStyle: TextStyle(color: Colors.black),
      enabledBorder: UnderlineInputBorder(
        // 밑줄 색상 변경
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: UnderlineInputBorder(
        // 포커스될 때 밑줄 색상 변경
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black, // 모든 텍스트 필드 커서 색상 변경
    ),
  );
}
