import 'package:blood_donation_app/common_widgets/async_value_ui.dart';
import 'package:blood_donation_app/common_widgets/async_value_widget.dart';
import 'package:blood_donation_app/features/authentication/data/auth_repository.dart';
import 'package:blood_donation_app/features/user_management/domain/app_notification.dart';
import 'package:blood_donation_app/features/user_management/presentation/controllers/firestore_controller.dart';
import 'package:blood_donation_app/features/user_management/presentation/controllers/mail_controller.dart';
import 'package:blood_donation_app/util/appstyles.dart';
import 'package:blood_donation_app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/domain/app_user.dart';

class UserItem extends ConsumerWidget {
  const UserItem(this.appUser, {super.key});

  final AppUser appUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);

    final userId=ref.watch(currentUserProvider)!.uid;
    final userDataAsync= ref.watch(loadUserInformationProvider(userId));

    final state = ref.watch(mailControllerProvider);
    ref.listen<AsyncValue>(mailControllerProvider, (_, state){
      state.showAlertDialogOnError(context);
    });

    return AsyncValueWidget<AppUser>(value: userDataAsync, data: (userData){
      return Card(
        child: ListTile(
          leading: Image.asset(
            appUser.type == 'Donor' ? 'assets/donor.png' : 'assets/recipient.jpg',
            height: 100,
            width: 100,
          ),
          title: Column(
            children: [
              Text(
                appUser.type.toUpperCase(),
                style: AppStyles.normalTextStyle.copyWith(color: Colors.black),
              ),

              Text(
                'Name: ${appUser.name}',
                overflow: TextOverflow.ellipsis,
                style: AppStyles.normalTextStyle.copyWith(color: Colors.black),
              ),

              Text(
                'Email: ${appUser.email}',
                overflow: TextOverflow.ellipsis,
                style: AppStyles.normalTextStyle.copyWith(color: Colors.black),
              ),

              Text(
                'Phone: ${appUser.phoneNumber}',
                overflow: TextOverflow.ellipsis,
                style: AppStyles.normalTextStyle.copyWith(color: Colors.black),
              ),
              Text(
                'Blood Group: ${appUser.bloodGroup}',
                overflow: TextOverflow.ellipsis,
                style: AppStyles.normalTextStyle.copyWith(color: Colors.black),
              ),
            ],
          ),
          trailing: ElevatedButton(onPressed: ()async{
            final result = await ref.read(mailControllerProvider.notifier).sendEmail(donorEmail: appUser.email, recipientEmail: userData.email, recipientName: userData.name, recipientPhone: userData.phoneNumber, recipientBloodGroup: userData.bloodGroup);

            if(result){
              ref.read(firestoreControllerProvider.notifier).saveIdsToDatabase(recipientId: userData.userId, donorId: appUser.userId);

              final date = DateTime.now().toString();
              final myNotification= AppNotification(text: 'Requested Blood Donation', date: date, donorId: appUser.userId, recipientId: userData.userId);
              
              ref.read(firestoreControllerProvider.notifier)
              .addNotifications(recipientId: userData.userId, donorId: appUser.userId, appNotification: myNotification);

              showDialog(context: context, builder: (ctx){
                return AlertDialog(
                  title: const Text(
                    'Donor Emailed Successfully',
                    style:
                    TextStyle(color: Colors.black,fontSize: 20),
                  ),
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 120,
                  ),
                  alignment: Alignment.center,
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppStyles.mainColor
                          ),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text('Okay',
                          style: AppStyles.normalTextStyle),
                        ),
                      ],
                    ),
                  ],
                );
              });
            }
          }, style: ElevatedButton.styleFrom(backgroundColor: AppStyles.mainColor,
          ),
            child: state.isLoading ? const CircularProgressIndicator() :Text(
              'EMAIL',
              style: AppStyles.normalTextStyle,
            ),
          ),
        ),
      );
    });
  }
}
