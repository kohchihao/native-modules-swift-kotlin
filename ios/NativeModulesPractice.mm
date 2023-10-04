#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(NativeModulesPractice, NSObject)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(plus:(float)a withB:(float)b
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(simpleMethodReturns: (RCTResponseSenderBlock) callback)

RCT_EXTERN_METHOD(simpleMethodWithParams:(NSString *) param
                  callback: (RCTResponseSenderBlock)callback)

RCT_EXTERN_METHOD(simpleMethodWithObj:(NSDictionary<NSString *, id> *)param
                  callback:(RCTResponseSenderBlock)callback)

RCT_EXTERN_METHOD(resolvePromise: (RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject)

RCT_EXTERN_METHOD(rejectPromise: (RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject)

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

@end
