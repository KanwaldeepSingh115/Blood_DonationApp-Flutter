import 'package:blood_donation_app/features/user_management/data/firestore_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

import '../../domain/app_notification.dart';
part 'firestore_controller.g.dart';

@riverpod
class FirestoreController extends _$FirestoreController{
  @override
  FutureOr<void> build(){}

  Future<void> saveIdsToDatabase({
   required String recipientId,
   required String donorId,
}) async{
    final firestoreRepository= ref.read(firestoreRepositoryProvider);
    state= await AsyncValue.guard(() async{
      await firestoreRepository.saveIdsToDatabase(recipientId: recipientId, donorId: donorId);
    });
  }

  Future<void> addNotifications({
    required String recipientId,
    required String donorId,
    required AppNotification appNotification,
  }) async{
    final firestoreRepository= ref.read(firestoreRepositoryProvider);
    state= await AsyncValue.guard(() async{
      await firestoreRepository.addNotifications(
          recipientId: recipientId,
          donorId: donorId,
          appNotification: appNotification,
      );
    });
  }

}