
import 'package:financesok/model/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Mappers {

  static User getUserContext(FirebaseUser firebaseUser) {
    User user = new User();
    user.email = firebaseUser.email;
    user.name = firebaseUser.displayName;
    user.isAnonymous = firebaseUser.isAnonymous;
    user.isValidateEmail = firebaseUser.isEmailVerified;
    user.phone = firebaseUser.phoneNumber;
    user.photoUrl = firebaseUser.photoUrl;
    user.providerData = firebaseUser.providerId;
    user.id = firebaseUser.uid;
    return user;
  }

}