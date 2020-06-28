#import <React/RCTBridgeModule.h>
#import <HomeKit/HomeKit.h>
#import "React/RCTEventEmitter.h"



@interface RCT_EXTERN_MODULE(Homekit, RCTEventEmitter)


RCT_EXTERN_METHOD(addHome:(NSString *)name withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(removeHome:(NSString *)name withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(renameHome:(NSString *)newName oldName:(NSString *)oldName withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(addZone:(NSString *)name toHome:(NSString *)toHome withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(removeZone:(NSString *)name fromHome:(NSString *)fromHome withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(renameZone:(NSString *)oldName oldName:(NSString *)oldName inHome:(NSString *)inHome withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)


RCT_EXTERN_METHOD(addRoomToHome:(NSString *)name toHome:(NSString *)toHome withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(addRoomToZone:(NSString *)name toZone:(NSString *)toZone inHome:(NSString *)inHome withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(removeRoomFromZone:(NSString *)name fromZone:(NSString *)fromZone inHome:(NSString *)inHome withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(removeRoomFromHome:(NSString *)name fromHome:(NSString *)fromHome  withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(renameRoom:(NSString *)oldName inHome:(NSString *)inHome  withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(addAccessoryToHome:(NSString *)accessoryName toHome:(NSString *)toHome  withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(removeAccessoryFromHome:(NSString *)accessoryName fromHome:(NSString *)fromHome  withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(assignAccessoryToRoom:(NSString *)accessoryName roomName:(NSString *)roomName homeName:(NSString *)homeName  withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(renameAccessory:(NSString *)oldName newName:(NSString *)newName withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(startSearchingForNewAccessories)
RCT_EXTERN_METHOD(stopSearchingForNewAccessories)


@end
