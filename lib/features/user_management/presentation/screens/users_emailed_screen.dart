import 'package:blood_donation_app/common_widgets/async_value_ui.dart';
import 'package:blood_donation_app/common_widgets/async_value_widget.dart';
import 'package:blood_donation_app/features/user_management/data/firestore_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/appstyles.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../../authentication/domain/app_user.dart';

class UsersEmailedScreen extends ConsumerWidget{
  const UsersEmailedScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref){

    final userId= ref.watch(currentUserProvider)!.uid;
    final emailedAsyncvalue = ref.watch(loadEmailedUserIdsProvider(userId));
    ref.listen<AsyncValue>(loadEmailedUserIdsProvider(userId), (_, state){
      state.showAlertDialogOnError(context);
    });


    return Scaffold(
      appBar: AppBar(title: Text('Emailed Users', style: AppStyles.headingTextStyle,
    ),
      ),
      body: AsyncValueWidget<List<String>>(
          value: emailedAsyncvalue, data: (idList){
            return idList.isEmpty ? const Center(child: Text('No one emailed yet')) : ListView.builder(itemCount: idList.length,itemBuilder: (ctx,index){
              final uId= idList[index];
              final userDataAsync = ref.watch(loadUserInformationProvider(uId));
              return AsyncValueWidget<AppUser>(value: userDataAsync, data: (userData){
          return ListTile(
            title: Text(userData.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userData.email),
              Text('Blood Group: ${userData.bloodGroup}'),
            ],
            ),
                leading: userData.type == 'Donor' ? Image.asset('assets/donor.png',height: 50,width: 50) : Image.asset('assets/recipient.jpg',height: 50,width: 50),
              trailing: Text(userData.type,style: AppStyles.normalTextStyle.copyWith(color: Colors.black),
              ),
          );
        }
        );

            },
            );
      }),
    );
  }
}