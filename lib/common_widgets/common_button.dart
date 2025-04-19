import 'package:blood_donation_app/util/size_config.dart';
import 'package:flutter/material.dart';

import '../util/appstyles.dart';


class CommonButton extends StatefulWidget {
  const CommonButton({
    super.key, required this.onTap,
    required this.title,
    required this.isLoading});

  final String title;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  State<CommonButton> createState() => _CommonButtonState();

}

class _CommonButtonState extends State<CommonButton>{

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        height: SizeConfig.getProportionateHeight(50),
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: AppStyles.mainColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget.isLoading ? const CircularProgressIndicator(): Text(widget.title,style: AppStyles.normalTextStyle),
      ),
    );
  }


}