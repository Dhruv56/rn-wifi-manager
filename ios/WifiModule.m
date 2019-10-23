//
//  WifiModule.m
//  WifiModule
//
//  Created by Dhruv on 21/10/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(WifiModule, NSObject)

RCT_EXTERN_METHOD(connect:(NSString *)ssid passphrase:(NSString *)password isWep:(BOOL)isWEP resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)


@end
