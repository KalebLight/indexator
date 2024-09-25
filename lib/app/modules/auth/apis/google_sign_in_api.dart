import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static const _clientIDWeb = '428609087219-ptneot9ab9ifi5eepoo0vspnu53v2sgd.apps.googleusercontent.com';

  static final _googleSignIn = GoogleSignIn(
    clientId: _clientIDWeb,
    scopes: [
      'email',
      'https://www.googleapis.com/auth/webmasters',
    ],
    // forceCodeForRefreshToken: true,
  );

  static Future signIn() => _googleSignIn.signIn();

  static Future signInSilently() => _googleSignIn.signInSilently();

  static Future logout() => _googleSignIn.disconnect();
}
