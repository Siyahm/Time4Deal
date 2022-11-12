import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time4deal/controller/onbording_controller/onbording_provider.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/helpers/app_text_styles.dart';
import 'package:time4deal/helpers/sized_boxes.dart';
import 'package:time4deal/routes/rout_names.dart';
import 'package:time4deal/view/on_boarding/utils/onbording_item_list.dart';
import 'package:time4deal/widgets/long_elevated_button.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onbordingProvidr = Provider.of<OnbordingProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
          controller: onbordingProvidr.onbordingController,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: size.height * 0.92,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(onBordingContentList[index].image!),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        onBordingContentList[index].bodyText!,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subTitle,
                      ),
                      SizedBoxes.heightBox20,
                      SizedBox(
                        width: size.width * 0.7,
                        child: LongElevatedButton(
                            color: AppColors.themeColor,
                            onPressed: () {
                              if (index < 2) {
                                onbordingProvidr.onbordingController
                                    .jumpToPage(index + 1);
                              } else {
                                Navigator.of(context).pushReplacementNamed(
                                    RouteNames.signInScreen);
                              }
                            },
                            child: Text(
                              onBordingContentList[index].buttonText1!,
                              style: AppTextStyles.buttonTextBlack,
                            )),
                      ),
                      SizedBoxes.heightBox10,
                      SizedBox(
                        width: size.width * 0.7,
                        child: LongElevatedButton(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.themeColor, width: 1.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(35),
                            ),
                          ),
                          color: AppColors.transperantColor,
                          onPressed: () {
                            if (index < 2) {
                              onbordingProvidr.onbordingController
                                  .jumpToPage(3);
                            } else {
                              Navigator.of(context).pushReplacementNamed(
                                  RouteNames.signUpScreen);
                            }
                          },
                          child: Text(
                            onBordingContentList[index].buttonText2!,
                            style: AppTextStyles.buttonTextYellow,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      )
                    ],
                  ),
                ),

                // Positioned(
                //   bottom: size.height * 0.1,

                //   child:
                // ),
              ],
            );
          }),
    );
  }
}
