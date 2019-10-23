//
//  WifiModule.swift
//  WifiModule
//
//  Created by Dhruv on 21/10/19.
//  Copyright © 2019 Facebook. All rights reserved.
//
//
//  WifiModule.swift
//  SmartViewDeploy
//
//  Created by Dhruv on 22/10/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation
import NetworkExtension
import SystemConfiguration

@objc(WifiModule)
class WifiModule: NSObject{
  private var count = 0

  @objc
  func connect(_ ssid: String, passphrase password: String, isWep isWEP: Bool,
                resolver resolve: @escaping RCTPromiseResolveBlock, rejecter reject:  @escaping RCTPromiseRejectBlock){
    if #available(iOS 11.0, *) {
      let configuration = NEHotspotConfiguration(ssid: ssid as String, passphrase: password as String, isWEP: isWEP)
        configuration.joinOnce = true

        NEHotspotConfigurationManager.shared.apply(configuration, completionHandler: { error in
            if error != nil {
                reject("nehotspot_error", "Error while configuring WiFi", error)
            } else {
                resolve(nil)
            }
        })
    } else {
        reject("ios_error", "Not supported in iOS<11.0", nil)
    }
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

