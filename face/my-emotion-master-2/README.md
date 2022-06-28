# My Emotion

A flutter app face detection and emotion, can detect if you're smiling, big smiley, sad or if there is not face on the screen.
News feactures will be add as soon as possible

Here is a demo video



## Getting Started

This project was developed using these package:
1. google_ml_kit : A Flutter plugin to use Google's standalone ML Kit for Android and iOS
2. camera : A Flutter plugin for iOS and Android allowing access to the device cameras
3. Getx : A Flutter package to state manager

To learn more about how to use google_ml_kit check out the documentaction [google_ml_kit](https://pub.dev/packages/google_ml_kit)

I hope this project help you some way
Feel free to contribe with this.

## Contribuitions
Your feedback will be well appreciated. 
Feel free to contribute 😁

[Linkedin](https://www.linkedin.com/in/ant%C3%B3nio-nicolau-5b7557181/)

[Youtube Channel](https://www.youtube.com/channel/UCEWMpqJBIAjO3Lholi6VsDA)


<br/><br/><br/><br/><br/>

수정

android/app/main/AndroidManifest.xml<br/>
 - android:exported="true"<br/>
 <br/><br/>
android/app/build.gradle<br/>
 -implementation 'androidx.work:work-runtime-ktx:2.7.1'<br/>
 -sdk를 31로 모두 바꿈 <br/>

 <br/><br/>
android/build.gradle<br/>
- ext.kotlin_version = '1.6.21' 수정<br/><br/>
pubspec.yaml<br/>
- camera:<br/>
    git:<br/>
      url: https://github.com/flutter/plugins<br/>
      path: packages/camera/camera<br/>
      ref: 9e46048ad2e1f085c1e8f6c77391fa52025e681f<br/>
      
flutter upgrade해줌
