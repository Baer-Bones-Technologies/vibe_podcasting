import 'package:go_router/go_router.dart';

import '../../../ui/pages/auth/register.dart';

final registerScreenBuilder = GoRoute(
    path: RegisterScreen.routeLocation,
    name: RegisterScreen.routeName,
    builder: (context, state){
      return RegisterScreen(
        onEmailSubmitted: (email) {
              print(email);
        },
        onPasswordSubmitted: (password) {
          print(password);
        },
        onVerifyPasswordChanged: (password)
      {
            print(password);
      },
      );
    });