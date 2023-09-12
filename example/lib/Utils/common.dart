import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/colors.dart';

class CustomStyle {
  static const TextStyle primaryTextStyle = TextStyle(
    fontSize: 16,
    color: primaryColor,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle secondTextStyle = TextStyle(
    fontSize: 16,
    color: primaryColor,
    fontWeight: FontWeight.normal,
  );

  static BoxDecoration primaryBoxDecoration = BoxDecoration(
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(15)
  );

  static BoxDecoration secondBoxDecoration = BoxDecoration(
      color: primaryColor,
      border: Border.all(color: primaryColor),
      borderRadius: BorderRadius.circular(15)
  );

  static BoxDecoration cardBoxDecoration = BoxDecoration(
    color: cardColor,
    borderRadius: BorderRadius.circular(7),
    boxShadow:  [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15), // <-- Radius
    ),
  );
}

InputDecoration inputDecoration(TextStyle textStyle, String text) {
  return InputDecoration(
      labelText: text,
      labelStyle: textStyle,
      errorStyle: TextStyle(color: add_booking, fontSize: 16.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: primaryColor,
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: primaryColor,
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: primaryColor,
          )
      )
  );
}

const spinkit = SpinKitPouringHourGlassRefined(
  color: primaryColor,
  size: 35.0,
);

const spinkitSecondary = SpinKitPouringHourGlassRefined(
  color: secondaryPrimaryColor,
  size: 35.0,
);

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: primaryColor,
      fontSize: 14.0
  );
}
/*
void showAlertDialog(BuildContext context, String title, String message) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(message),
  );
  showDialog(context: context, builder: (_) => alertDialog);

}*/

void initial() async {
//  logindata = await SharedPreferences.getInstance();
//  logindata.setBool('login', false);
}

void showExitDialog(BuildContext context, String title, String message) {
  Dialogs.materialDialog(
      msg: message,
      title: title,
      color: Colors.white,
      context: context,
      dialogWidth: kIsWeb ? 0.3 : null,
      onClose: (value) => print("returned value is '$value'"),
      actions: [
        IconsOutlineButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: 'Hayır',
          iconData: Icons.cancel_outlined,
          textStyle: const TextStyle(color: Colors.grey),
          iconColor: Colors.grey,
        ),
        IconsButton(
          onPressed: () {
            initial();
            Navigator.pushNamed(context, '/login');
          },
          text: "Evet",
          iconData: Icons.check_circle_outline,
          color: Colors.red,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ]);
}

void showAlertDialog2(BuildContext context, String title, String message) {
  Dialogs.materialDialog(
      msg: message,
      title: title,
      color: Colors.white,
      context: context,
      dialogWidth: kIsWeb ? 0.3 : null,
      onClose: (value) => print("returned value is '$value'"),
      actions: [
        IconsButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: "Kapat",
          iconData: Icons.close,
          color: Colors.red,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ]);
}
/**
    Route CustomRoute() {
    return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AllowedEntryPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    final tween = Tween(begin: begin, end: end);
    final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
    );

    return SlideTransition(
    position: tween.animate(curvedAnimation),
    child: child,
    );
    });
    }*/
