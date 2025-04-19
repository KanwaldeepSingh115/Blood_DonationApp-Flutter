import 'package:blood_donation_app/common_widgets/async_value_ui.dart';
import 'package:blood_donation_app/common_widgets/async_value_widget.dart';
import 'package:blood_donation_app/common_widgets/common_button.dart';
import 'package:blood_donation_app/util/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/routes.dart';
import '../../../../util/size_config.dart';
import '../../data/auth_repository.dart';
import '../../domain/app_user.dart';

class AccountScreen extends ConsumerWidget{
  const AccountScreen({super.key});

@override
Widget build(BuildContext context,WidgetRef ref){
  SizeConfig.init(context);

  final userId= ref.watch(currentUserProvider)!.uid;
  final userDataAsync= ref.watch(loadUserInformationProvider(userId));

  ref.listen<AsyncValue>(loadUserInformationProvider(userId), (_, state){
    state.showAlertDialogOnError(context);
  });

  void logOut(){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        icon: const Icon(
        Icons.logout,
        size: 50,
        color: AppStyles.mainColor,
        ),

   actions: [
     ElevatedButton(
        onPressed: (){
    Navigator.of(context).pop();
    },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppStyles.mainColor,
      ),
        child: Text(
        'Cancel',
        style: AppStyles.normalTextStyle,
        ),
    ), // Text
// ElevatedButton
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            ref.read(authRepositoryProvider).signOut();
            ref.read(goRouterProvider).refresh();
          },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.mainColor,
            ),
                child: Text(
                'Log Out',
                style: AppStyles.normalTextStyle,
            ),
            ),
            ],
            ),
            );
  }


  return Scaffold(
    appBar: AppBar(
      title: Text('My Profile Information',
      style: AppStyles.headingTextStyle,
      ),
    ),

    body: AsyncValueWidget<AppUser>(value: userDataAsync, data: (userData){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'Type: ${userData.type}',
              style: AppStyles.titleTextStyle.copyWith(color: Colors.black),
            ), // Text
            SizedBox(height: 20),
            Image.asset(
              userData.type == 'Donor'
                  ? 'assets/donor.png'
                  : 'assets/recipient.jpg',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ), // Image.asset
            SizedBox(height: 20),
            Text(
              'Name: ${userData.name}',
              style: AppStyles.normalTextStyle.copyWith(color: Colors.black),
            ), // Text
            Text(
              'Blood Group: ${userData.bloodGroup}',
              style:AppStyles.normalTextStyle.copyWith(color: Colors.black),
            ), // Text
            Text(
              'Email: ${userData.email}',
              style: AppStyles.normalTextStyle.copyWith(color: Colors.black),
            ), // Text
            Text(
              'Phone: ${userData.phoneNumber}',
              style: AppStyles.normalTextStyle.copyWith(color: Colors.black),
            ),
            SizedBox(height: 20),
            CommonButton(onTap: () {
              logOut();
            }, title: 'Sign Out', isLoading: false),
          ],// Text
        ),
      );
      // Column

    },
    ),
  );
}
}