import 'package:blood_donation_app/common_widgets/async_value_ui.dart';
import 'package:blood_donation_app/common_widgets/async_value_widget.dart';
import 'package:blood_donation_app/features/authentication/data/auth_repository.dart';
import 'package:blood_donation_app/features/user_management/data/firestore_repository.dart';
import 'package:blood_donation_app/features/user_management/domain/app_notification.dart';
import 'package:blood_donation_app/util/appstyles.dart';
import 'package:blood_donation_app/util/date_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentication/domain/app_user.dart';

class NotificationsScreen extends ConsumerWidget{
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref){

    final userId= ref.watch(currentUserProvider)!.uid;
    final notificationsAsyncvalue = ref.watch(loadNotificationsProvider(userId));
    ref.listen<AsyncValue>(loadNotificationsProvider(userId), (_, state){
      state.showAlertDialogOnError(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Notifications',
            style: AppStyles.headingTextStyle,)

      ),
      body: AsyncValueWidget<List<AppNotification>>(value: notificationsAsyncvalue, data: (notifications){
        return notifications.isEmpty ? const Center(child: Text('No Notifications Yet')) : ListView.builder(itemCount: notifications.length,itemBuilder: (ctx,index){
        final notification =notifications[index];
        final userDataAsync = ref.watch(loadUserInformationProvider(notification.donorId));
        return AsyncValueWidget<AppUser>(value: userDataAsync, data: (userData){
          return ListTile(
            title: Text(userData.name),
            subtitle: Text(notification.text),
            leading: userData.type == 'Donor' ? Image.asset('assets/donor.png',height: 50,width: 50) : Image.asset('assets/recipient.jpg',height: 50,width: 50),
              trailing: Text(formattedDate(notification.date)),
          );
        }
        );
        }
        );
      }
      ),
    );
  }
}