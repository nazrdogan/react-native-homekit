#import <React/RCTBridgeModule.h>
#import <HomeKit/HomeKit.h>

@interface RCT_EXTERN_MODULE(Homekit, NSObject)


RCT_EXTERN_METHOD(addHome:(NSString *)name withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(removeHome:(NSString *)name withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(renameHome:(NSString *)newName oldName:(NSString *)oldName withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(addZone:(NSString *)name toHome:(NSString *)toHome withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(removeZone:(NSString *)name fromHome:(NSString *)fromHome withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(renameZone:(NSString *)oldName oldName:(NSString *)oldName inHome:(NSString *)inHome withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)


@end
