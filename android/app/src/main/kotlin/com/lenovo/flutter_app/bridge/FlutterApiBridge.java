package com.lenovo.flutter_app.bridge;

import android.app.Activity;

import com.lenovo.flutter_app.utils.MD5Utils;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class FlutterApiBridge implements MethodChannel.MethodCallHandler {

    public static String CHANNEL = "com.flutter.api.bridge/plugin";

    static MethodChannel channel;

    private Activity activity;

    private FlutterApiBridge(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        FlutterApiBridge instance = new FlutterApiBridge(registrar.activity());
        //setMethodCallHandler在此通道上接收方法调用的回调
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("getMd5")) {
            //解析参数
            String arg = methodCall.argument("arg");
            String md5 = MD5Utils.Companion.encrypt(arg);
            result.success(md5);
        }
    }
}
