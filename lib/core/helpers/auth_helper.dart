import 'package:kelotimaja/core/constants/storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInSingleton {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  static GoogleSignIn get instance => _googleSignIn;
}

class AuthProvider {
  GoogleSignInAccount? _currentUser;

  GoogleSignInAccount? get currentUser => _currentUser;

  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignInSingleton.instance;
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Simpan informasi pengguna di sini
        _currentUser = googleSignInAccount;
        // Lanjutkan dengan proses selanjutnya
      }
    } catch (error) {
      print('Error during Google login: $error');
    }
  }

  Future<void> signOutGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignInSingleton.instance;
      await _googleSignIn.signOut();
      // Setelah sign-out, atur _currentUser ke null atau sesuai kebutuhan
      _currentUser = null;
    } catch (error) {
      print('Error during Google sign-out: $error');
    }
  }
}

class AuthHelper {
  static Future<void> setUserStorage(Map<String, dynamic> data) async {
    print('set user storage');
    if (data.containsKey('access_token')) {
      await userStorage.write('access_token', data['access_token']);
    }
    await userStorage.write('user_data', data['user']);
    await userStorage.write('user_role', data['user']['user_role']);
    await userStorage.write('user_meta', data['user']['user_meta']);
    await userStorage.write('user_rekening', data['user']['user_rekening']);
    await userStorage.write('user_wallet', data['user']['user_wallet']);
    await userStorage.write('user_address', data['user']['user_address']);
    await userStorage.write('is_verified',
        data['user']['is_verified'].toString() == '1' ? true : false);
    await userStorage.write('is_email_verified',
        data['user']['email_verified_at'] == null ? false : true);
    await userStorage.write(
        'verify_submit_status', data['user']['verify_submit_status']);
    await userStorage.write('isLogin', true);
    await userStorage.write('uid', data['user']['id']);
  }

  static Future<void> unsetUserStorage() async {
    print('unset user storage');
    String playerId = userStorage.read('player_id');
    await userStorage.remove('access_token');
    await userStorage.remove('user_data');
    await userStorage.remove('user_role');
    await userStorage.remove('user_meta');
    await userStorage.remove('user_rekening');
    await userStorage.remove('user_wallet');
    await userStorage.remove('user_address');
    await userStorage.remove('is_verified');
    await userStorage.remove('is_email_verified');
    await userStorage.remove('isLogin');
    await userStorage.remove('uid');
    await userStorage.erase();
    await userStorage.write('player_id', playerId);
  }
}
