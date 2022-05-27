import 'package:flutter/widgets.dart';
import 'package:restaurant_orders/core/resources/image_assets.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.kLoginCover),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SafeArea(child: LoginForm())
    ]);
  }
}
