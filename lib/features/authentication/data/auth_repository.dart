import 'package:blood_donation_app/features/authentication/domain/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_repository.dart';
part 'auth_repository.g.dart';

class AuthRepository{

  AuthRepository(this._auth);

  final FirebaseAuth _auth;

  Future<void> signInWithEmailAndPassword({required String email,required String password}) async{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({required String email,required String password, required String name, required String bloodGroup,required String phoneNumber, required String type})async{
    debugPrint("User Type Before Saving: $type");  // Check if correct type is passed

    final cred= await
    _auth.createUserWithEmailAndPassword(email: email, password: password);

    final firebaseFirestore = FirebaseFirestore.instance;

    final appUser = AppUser(
        name: name,
        phoneNumber: phoneNumber,
        bloodGroup: bloodGroup,
        email: email,
        type: type.trim(),
        userId: cred.user!.uid,
    );

    await firebaseFirestore.collection('users').doc(cred.user!.uid).set(appUser.toMap());

    debugPrint("User Successfully Created: ${appUser.toMap()}");

  }

  Stream<AppUser> loadUserInformation(String userId){
    return FirebaseFirestore.instance.collection('users').doc(userId).snapshots().map((docSnapshot)=> AppUser.fromMap(docSnapshot.data()!));
  }

  User? get currentUser{
    return _auth.currentUser;
  }

  Future<void> signOut() async{
    await _auth.signOut();
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref){
  return AuthRepository(FirebaseAuth.instance);
}

@riverpod
User? currentUser(CurrentUserRef ref){
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.currentUser;
}

@riverpod
Stream<AppUser> loadUserInformation(LoadUserInformationRef ref,String userId){
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.loadUserInformation(userId);
}