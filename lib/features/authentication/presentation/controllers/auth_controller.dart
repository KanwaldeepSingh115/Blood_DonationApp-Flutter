import 'dart:async';

import 'package:blood_donation_app/features/authentication/data/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController{
  @override
  FutureOr<void> build(){}

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async{
    if(email.trim().isEmpty||password.trim().isEmpty){
      state=AsyncError('Ensure all fields are filled', StackTrace.current);
      return;
    }
    state= const AsyncLoading();
    state= await AsyncValue.guard(()=> ref.read(authRepositoryProvider)
    .signInWithEmailAndPassword(email: email, password: password));
  }
  Future<void> createUserWithEmailAndPassword({required String email,required String password, required String name, required String bloodGroup,required String phoneNumber, required String type})async {
  if(email.trim().isEmpty || password.trim().isEmpty|| name.trim().isEmpty || phoneNumber.trim().isEmpty|| bloodGroup == null) {
    state=AsyncError('Ensure all fields are filled', StackTrace.current);
    return;
  }
  state= const AsyncLoading();
  state= await AsyncValue.guard(()=> ref.read(authRepositoryProvider).createUserWithEmailAndPassword(email: email, password: password, name: name, bloodGroup: bloodGroup, phoneNumber: phoneNumber, type: type));
  }

  }