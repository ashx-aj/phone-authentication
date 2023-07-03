import 'package:firebase_auth/firebase_auth.dart';

String verificationId = "";
Future<void> signInWithPhoneNumber(String phoneNumber, String smsCode) async {
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
    codeSent: (String newVerificationId, int? forceCodeResent) async {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: newVerificationId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      print('Auto-retrieval timed out');
      verificationId = verificationId;
    },
  );
}
