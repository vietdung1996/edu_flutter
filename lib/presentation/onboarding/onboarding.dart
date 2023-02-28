import 'dart:io';

import 'package:flutter/services.dart';
import 'package:lecture_4/presentation/resources/assets_manager.dart';
import 'package:lecture_4/presentation/resources/strings_manager.dart';
import 'package:lecture_4/presentation/resources/values_manager.dart';

import '/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  late final List<SliderObject> _list = _getSliderData();
  int currentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  List<SliderObject> _getSliderData() =>
      [
        SliderObject(
            AppStrings.onBoardingSubTitle1, AppStrings.onBoardingSubTitle1,
            ImageAssets.onBoardingLogo1),
        SliderObject(
            AppStrings.onBoardingSubTitle2, AppStrings.onBoardingSubTitle2,
            ImageAssets.onBoardingLogo2),
        SliderObject(
            AppStrings.onBoardingSubTitle3, AppStrings.onBoardingSubTitle3,
            ImageAssets.onBoardingLogo3),
        SliderObject(
            AppStrings.onBoardingSubTitle4, AppStrings.onBoardingSubTitle4,
            ImageAssets.onBoardingLogo4)
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: PageView.builder(
          controller: pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {

          }),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;

  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .headline1,),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .headline1,),
        ),
        SizedBox(height: AppSize.s60)
      ],
    );
  }
}


class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image)
}
