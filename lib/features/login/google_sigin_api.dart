import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() async {
    final isUserConnected = await _googleSignIn.isSignedIn();
    if (isUserConnected) {
      print('trying to disconnect user');
      await _googleSignIn.disconnect();
    }
    final user = await _googleSignIn.signIn();
    if (user == null) {
      print('Sign in failed');
    } else {
      print(user.email);
      print(user.id);
      print(user.displayName);
    }
  }
}
