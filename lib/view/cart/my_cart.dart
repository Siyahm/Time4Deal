import 'package:flutter/material.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/utils/app_utils.dart';
import 'package:time4deal/widgets/custome_app_bar.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        leadingWidget: IconButton(
            onPressed: () {
              AppUtils.popFunction(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        trailing: IconButton(
          splashRadius: 15,
          onPressed: () async {
            // await GoogleSignIn().signOut();
          },
          icon: const Icon(Icons.search),
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('My cart screen'),
        ),
      ),
    );
  }
}
