import 'dart:async';

import 'package:lecture_4/domain/model.dart';

import '../base/BaseViewModel.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';



class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controller
  final StreamController streamController = StreamController<SlideViewObject>();
  late final List<SliderObject> listSlider;

  int currentIndex = 0;

  //inputs
  @override
  void dispose() {
    streamController.close();
  }

  @override
  void start() {
    listSlider = _getSliderData();
    postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = currentIndex++; // +1
    if (nextIndex >= listSlider.length) {
      currentIndex = 0; // infinite loop to go to first item inside the slider
    }
    postDataToView();
    return currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = currentIndex--; // -1
    if (previousIndex == -1) {
      currentIndex =
          listSlider.length - 1; // infinite loop to go to the length of slider list
    }
    postDataToView();
    return currentIndex;
  }

  @override
  void onPageChange(int index) {
    currentIndex = index;
    postDataToView();

  }

  @override
  Sink get inputSliderViewObject => streamController.sink;

  @override
  Stream<SlideViewObject> get outputSliderViewObject =>
      streamController.stream.map((slideViewObject) => slideViewObject);

  List<SliderObject> _getSliderData() =>
      [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4)
      ];

  void postDataToView() {
    inputSliderViewObject.add(SlideViewObject(listSlider[currentIndex], listSlider.length, currentIndex));
  }
}

// input mean the orders that our view model will receive from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); // when user  clicks on right arrow or swipe
  void goPrevious(); // when user clicks on left arror or swipe
  void onPageChange(int index);

  Sink get inputSliderViewObject;
}

// output mean the data or results that will be sent from out view model to our view
abstract class OnBoardingViewModelOutputs {
  // will be implement it later
  Stream<SlideViewObject> get outputSliderViewObject;
}

class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SlideViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
