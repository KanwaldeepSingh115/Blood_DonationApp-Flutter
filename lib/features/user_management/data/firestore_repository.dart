import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/domain/app_user.dart';
import '../domain/app_notification.dart';

part 'firestore_repository.g.dart';

class FirestoreRepository{
  FirestoreRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Stream<List<AppUser>> loadDonors(){
    return _firestore
        .collection('users')
        .where('type', isEqualTo: 'Donor')
        .snapshots()
        .map((querySnapshot)=> querySnapshot.docs
            .map((doc)=> AppUser.fromMap(doc.data()))
        .toList());
  }

  Stream<List<AppUser>> loadSpecificBloodGroupDonors(String bloodGroup){
    return _firestore
        .collection('users')
        .where('type', isEqualTo: 'Donor')
        .where('bloodGroup', isEqualTo: bloodGroup)
        .snapshots()
        .map((querySnapshot)=> querySnapshot.docs
        .map((doc)=> AppUser.fromMap(doc.data()))
        .toList());
  }

  Stream<List<AppUser>> loadSimilarBloodGroups(String bloodGroup){
    return _firestore
        .collection('emails')
        .where('type', isEqualTo: 'Donor')
        .where('bloodGroup', isEqualTo: bloodGroup)
        .snapshots()
        .map((querySnapshot)=> querySnapshot.docs
        .map((doc)=> AppUser.fromMap(doc.data()))
        .toList());
  }

  Future<void> saveIdsToDatabase({required String recipientId,required String donorId}) async {
    await _firestore
        .collection('emails')
        .doc(recipientId)
        .collection('users emailed')
        .add({donorId: true});

    await _firestore
        .collection('emails')
        .doc(donorId)
        .collection('users emailed')
        .add({recipientId: true});

  }

  Future<void> addNotifications ({required String recipientId, required String donorId,required AppNotification appNotification}) async{
    await _firestore
    .collection('notifications')
    .doc(donorId)
    .collection('user notifications')
    .add(appNotification.toMap());

    await _firestore
        .collection('notifications')
        .doc(recipientId)
        .collection('user notifications')
        .add(appNotification.toMap());
  }

  Stream<List<AppNotification>>loadNotifications(String userId){
    return  _firestore
        .collection('notifications')
        .doc(userId)
        .collection('user notifications')
        .snapshots()
        .map((querySnapshot)=> querySnapshot.docs
        .map((doc)=>AppNotification.fromMap(doc.data()))
        .toList());
  }

  Stream<List<String>>loadEmailedUserIds(String userId){
    return  _firestore
        .collection('emails')
        .doc(userId)
        .collection('users emailed')
        .snapshots()
        .map((querySnapshot){
        return querySnapshot.docs.map((doc)=>doc.data().keys.toList()).expand((keys)=>keys).toList();
  });
        }
}

@riverpod
FirestoreRepository firestoreRepository(FirestoreRepositoryRef ref){
  return FirestoreRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<AppUser>> loadDonors(LoadDonorsRef ref){
  final firestoreRepository=ref.watch(firestoreRepositoryProvider);
  return firestoreRepository.loadDonors();
}

@riverpod
Stream<List<AppUser>> loadSpecificBloodGroupDonors(LoadSpecificBloodGroupDonorsRef ref,String bloodGroup){
  final firestoreRepository=ref.watch(firestoreRepositoryProvider);
  return firestoreRepository.loadSpecificBloodGroupDonors(bloodGroup);
}

@riverpod
Stream<List<AppUser>> loadSimilarBloodGroups(LoadSimilarBloodGroupsRef ref,String bloodGroup){
  final firestoreRepository=ref.watch(firestoreRepositoryProvider);
  return firestoreRepository.loadSimilarBloodGroups(bloodGroup);
}

@riverpod
Stream<List<AppNotification>> loadNotifications(LoadNotificationsRef ref,String userId){
  final firestoreRepository=ref.watch(firestoreRepositoryProvider);
  return firestoreRepository.loadNotifications(userId);
}

@riverpod
Stream<List<String>> loadEmailedUserIds(LoadEmailedUserIdsRef ref,String userId){
  final firestoreRepository=ref.watch(firestoreRepositoryProvider);
  return firestoreRepository.loadEmailedUserIds(userId);
}
