package com.wifimodule

import android.content.Context
import android.net.wifi.WifiConfiguration
import android.net.wifi.WifiManager

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

class WifiModule//constructor
(private val reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
    private val wifiManager: WifiManager


    init {
        wifiManager = this.reactContext.getSystemService(Context.WIFI_SERVICE) as WifiManager

    }

    //Mandatory function getName that specifies the module name
    override fun getName(): String {
        return "Wifi"
    }

    //Custom function that we are going to export to JS
    @ReactMethod
    fun enableWifi(isEnable: Boolean?) {
        val wifiManager = this.reactContext.getSystemService(Context.WIFI_SERVICE) as WifiManager
        wifiManager.isWifiEnabled = isEnable!!
    }

    @ReactMethod
    fun connect(ssid: String, password: String) {

        val conf = WifiConfiguration()
        conf.SSID = "\"" + ssid + "\""
        conf.preSharedKey = "\"" + password + "\""
        //        conf.allowedKeyManagement.set(WifiConfiguration.KeyMgmt.);
        wifiManager.addNetwork(conf)
        val list = wifiManager.configuredNetworks
        for (i in list) {
            if (i.SSID != null && i.SSID == "\"" + ssid + "\"") {
                wifiManager.disconnect()
                wifiManager.enableNetwork(i.networkId, true)
                wifiManager.reconnect()
                break
            }
        }

    }
}
