import 'package:firebase_auth/firebase_auth.dart';

String verificationId = "";
String phoneNumber = "";
Future<void> signInWithPhoneNumber(String phoneNumber) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  await auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      // Auto-retrieve verification code on some devices
      await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      print('Verification failed: ${e.message}');
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      print('Auto-retrieval timed out');
      verificationId = verificationId;
    },
    codeSent: (String verificationId, int? resendToken) {},
  );
}

Future<void> verifyOtp(String smsCode) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  await auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    codeSent: (String newVerificationId, int? resendToken) async {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: newVerificationId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    verificationFailed: (FirebaseAuthException error) {},
    verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
  );
}
