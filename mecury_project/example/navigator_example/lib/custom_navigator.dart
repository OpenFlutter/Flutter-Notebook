import 'package:flutter/material.dart';
import 'collect_personal_info_page.dart';
import 'choose_credentia_is_page.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SignUpPage builds its own Navigator which ends up being a nested
    // Navigator in our app.
    return Scaffold(
      appBar: AppBar(),
      body: Navigator(
        initialRoute: 'signup/personal_info',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case 'signup/personal_info':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
              builder = (BuildContext _) => CollectPersonalInfoPage();
              break;
            case 'signup/choose_credentials':
            // Assume ChooseCredentialsPage collects new credentials and then
            // invokes 'onSignupComplete()'.
              builder = (BuildContext _) => ChooseCredentialsPage(
                onSignupComplete: () {
                  // Referencing Navigator.of(context) from here refers to the
                  // top level Navigator because SignUpPage is above the
                  // nested Navigator that it created. Therefore, this pop()
                  // will pop the entire "sign up" journey and return to the
                  // "/" route, AKA HomePage.
                  Navigator.of(context).pop();
                },
              );
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}