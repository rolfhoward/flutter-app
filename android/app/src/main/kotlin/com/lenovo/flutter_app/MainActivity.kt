package com.lenovo.flutter_app

import android.os.Bundle
import com.lenovo.flutter_app.bridge.FlutterApiBridge
import com.lenovo.flutter_app.utils.MD5Utils
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        //Flutter和Android原生通讯
        FlutterApiBridge.registerWith(this.registrarFor(FlutterApiBridge.CHANNEL));
    }



}
