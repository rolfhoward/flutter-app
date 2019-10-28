import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BaseProvider with ChangeNotifier{
  CompositeSubscription compositeSubscription = CompositeSubscription();

  // add [StreamSubscription] to [compositeSubscription]
  // 在 [dispose]的时候进行取消
  addSubscription(StreamSubscription streamSubscription){
    compositeSubscription.add(streamSubscription);
  }

  @override
  void dispose() {
    if (!compositeSubscription.isDisposed) {
      compositeSubscription.dispose();
    }
    super.dispose();
  }
}