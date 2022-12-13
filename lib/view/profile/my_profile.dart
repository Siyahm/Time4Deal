import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/profile_controller/profile_contoller.dart';
import 'package:time4deal/helpers/app_padding.dart';
import 'package:time4deal/utils/app_pop_up.dart';
import 'package:time4deal/view/profile/widgets/list_tile.dart';
import 'package:time4deal/widgets/custom_app_bar_trailing.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // final profileController =
    //     Provider.of<ProfileController>(context, listen: false);
    return Scaffold(
      appBar: const CustomeAppBar(
        leadingWidget: SizedBox(),
        trailing: CustomAppbarTrailing(),
      ),
      body: Padding(
        padding: AppPadding.horizPadding15,
        child: Column(
          children: [
            Consumer<ProfileController>(
              builder: (context, value, child) => ProfileItems(
                icon: Icons.logout,
                title: 'Log out',
                onTap: () => AppPopUp().showDialogueBox(
                  context,
                  'Do you want to log out ?',
                  () {
                    value.logOut(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
