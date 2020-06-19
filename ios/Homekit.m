#import <React/RCTBridgeModule.h>
#import <HomeKit/HomeKit.h>

@interface RCT_EXTERN_MODULE(Homekit, NSObject)


RCT_EXTERN_METHOD(addHome:(NSString *)name withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(removeHome:(NSString *)name withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

@end
