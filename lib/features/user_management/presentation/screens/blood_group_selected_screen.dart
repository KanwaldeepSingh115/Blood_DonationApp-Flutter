import 'package:blood_donation_app/common_widgets/async_value_ui.dart';
import 'package:blood_donation_app/common_widgets/async_value_widget.dart';
import 'package:blood_donation_app/features/user_management/data/firestore_repository.dart';
import 'package:blood_donation_app/features/user_management/presentation/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../util/appstyles.dart';
import '../../../../util/size_config.dart';
import '../../../authentication/domain/app_user.dart';

class BloodGroupSelectedScreen extends ConsumerWidget{
  const BloodGroupSelectedScreen(this.bloodGroup,{super.key});

  final String bloodGroup;

  @override
  Widget build(BuildContext context,WidgetRef ref){

    SizeConfig.init(context);

    final donorsAsyncValue = ref.watch(loadSpecificBloodGroupDonorsProvider(bloodGroup));

    ref.listen<AsyncValue>(loadSpecificBloodGroupDonorsProvider(bloodGroup), (_, state){
      state.showAlertDialogOnError(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Blood Group: $bloodGroup',
        style: AppStyles.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: AsyncValueWidget<List<AppUser>>(value: donorsAsyncValue, data: (donors){
              return donors.isEmpty
                  ? const Center(
                child: Text('No Donors yet!'),
              )
                  : ListView.builder(
                  itemCount: donors.length,
                  itemBuilder: (ctx,index){
                    return UserItem(donors[index]);
                  }
                  );
            },
            ),
            ),
          ],
        ),
      ),
    );
  }
}