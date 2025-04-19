import 'package:blood_donation_app/common_widgets/async_value_ui.dart';
import 'package:blood_donation_app/common_widgets/async_value_widget.dart';
import 'package:blood_donation_app/features/authentication/data/auth_repository.dart';
import 'package:blood_donation_app/routes/routes.dart';
import 'package:blood_donation_app/util/appstyles.dart';
import 'package:blood_donation_app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class MainDrawer extends ConsumerWidget{
const MainDrawer({super.key});

@override
Widget build(BuildContext context,WidgetRef ref){
  
  final userId= ref.watch(currentUserProvider)!.uid;
  final userDataAsync= ref.watch(loadUserInformationProvider(userId));

  ref.listen<AsyncValue>(loadUserInformationProvider(userId), (_, state){
    state.showAlertDialogOnError(context);
  });

return AsyncValueWidget(value: userDataAsync, data: (userData){
  return SafeArea(
    child: Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppStyles.mainColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png',height: 50,width: 50,fit: BoxFit.cover,
                ),
                Text('Blood Donation App',style: AppStyles.titleTextStyle,
                ),
                Text(
                  userData.name,
                  style: AppStyles.normalTextStyle,
                ),
                Text(
                  userData.email,
                  style: AppStyles.normalTextStyle,
                ),
              ],
            ),
          ),
          ),
          Expanded(child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppStyles.mainColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
                style: BorderStyle.solid,
                width:2,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.home,
                          color: Colors.black,
                          size:30
                      ),
                      title: Text('Home',style: AppStyles.headingTextStyle.copyWith(fontSize: 17.0),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.main.name);
                      },
                    ),

                    ListTile(
                      leading: const Icon(Icons.check_circle,
                          color: Colors.black,
                          size:30
                      ),
                      title: Text('Donors Emailed',style: AppStyles.headingTextStyle.copyWith(fontSize: 17.0),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.emailedUsers.name);
                      },
                    ),

                    ListTile(
                      leading: const Icon(Icons.handshake,
                          color: Colors.black,
                          size:30
                      ),
                      title: Text('Same BG as me',style: AppStyles.headingTextStyle.copyWith(fontSize: 17.0),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.bloodGroupSelected.name,
                        extra: userData.bloodGroup,
                        );
                      },
                    ),

                    const Divider(color: Colors.white,
                      height: 2,
                    ),

                    Text(
                      'Blood Groups',
                      style: AppStyles.normalTextStyle,
                    ),

                    ListTile(
                      leading: Image.asset('assets/apositive.jpg',height: 30.0,width: 30.0,),
                      title: Text('A Positive',
                        style: AppStyles.headingTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.bloodGroupSelected.name,
                            extra: 'A+');
                      },
                    ),

                    ListTile(
                      leading: Image.asset('assets/anegative.jpg',height: 30.0,width: 30.0,),
                      title: Text('A Negative',
                        style: AppStyles.headingTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.bloodGroupSelected.name,
                            extra: 'A-');
                      },
                    ),


                    ListTile(
                      leading: Image.asset('assets/bpositive.jpg',height: 30.0,width: 30.0,),
                      title: Text('B Positive',
                        style: AppStyles.headingTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.bloodGroupSelected.name,
                            extra: 'B+');
                      },
                    ),


                    ListTile(
                      leading: Image.asset('assets/bnegative.jpg',height: 30.0,width: 30.0,),
                      title: Text('B Negative',
                        style: AppStyles.headingTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.bloodGroupSelected.name,
                            extra: 'B-');
                      },
                    ),

                    ListTile(
                      leading: Image.asset('assets/abpositive.jpg',height: 30.0,width: 30.0,),
                      title: Text('AB Positive',
                        style: AppStyles.headingTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.bloodGroupSelected.name,
                            extra: 'AB+');
                      },
                    ),


                    ListTile(
                      leading: Image.asset('assets/abnegative.jpg',height: 30.0,width: 30.0,),
                      title: Text('AB Negative',
                        style: AppStyles.headingTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.bloodGroupSelected.name,
                            extra: 'AB-');
                      },
                    ),

                    ListTile(
                      leading: Image.asset('assets/opositive.jpg',height: 30.0,width: 30.0,),
                      title: Text('O Positive',
                        style: AppStyles.headingTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.bloodGroupSelected.name,
                            extra: 'O+');
                      },
                    ),

                    ListTile(
                      leading: Image.asset('assets/onegative.jpg',height: 30.0,width: 30.0,),
                      title: Text('O Negative',
                        style: AppStyles.headingTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.bloodGroupSelected.name,
                            extra: 'O-');
                      },
                    ),


                    const Divider(color: Colors.white,
                      height: 2,
                    ),

                    Text(
                      'Actions',
                      style: AppStyles.normalTextStyle,
                    ),

                    ListTile(
                      leading: const Icon(Icons.notifications,
                          color: Colors.black,
                          size:30
                      ),
                      title: Text('Notifications',style: AppStyles.headingTextStyle.copyWith(fontSize: 17.0),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.notifications.name);
                      },
                    ),

                    ListTile(
                      leading: const Icon(Icons.account_circle,
                          color: Colors.black,
                          size:30
                      ),
                      title: Text('My Account',style: AppStyles.headingTextStyle.copyWith(fontSize: 17.0),
                      ),
                      onTap: (){
                        context.goNamed(AppRoutes.account.name);
                      },
                    ),


                    const Divider(color: Colors.white,
                      height: 2,
                    ),

                    Text(
                      'Communicate',
                      style: AppStyles.normalTextStyle,
                    ),

                    ListTile(
                      leading: const Icon(Icons.info,
                          color: Colors.black,
                          size:30
                      ),
                      title: Text('About',style: AppStyles.headingTextStyle.copyWith(fontSize: 17.0),
                      ),
                      onTap: (){
                        //context.goNamed(AppRoutes.main.name);
                      },
                    ),


                    ListTile(
                      leading: const Icon(Icons.share,
                          color: Colors.black,
                          size:30
                      ),
                      title: Text('Share',style: AppStyles.headingTextStyle.copyWith(fontSize: 17.0),
                      ),
                      onTap: (){
                        //context.goNamed(AppRoutes.main.name);
                      },
                    ),

                    ListTile(
                      leading: const Icon(Icons.edit_note,
                          color: Colors.black,
                          size:30
                      ),
                      title: Text('Rate on Google Play',style: AppStyles.headingTextStyle.copyWith(fontSize: 17.0),
                      ),
                      onTap: (){
                        //context.goNamed(AppRoutes.main.name);
                      },
                    ),

                  ],

                ),
              ),
            ),

          ),
          ),
        ],
      ),
    ),
  );
});
}
}
