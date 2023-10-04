@objc(NativeModulesPractice)
class NativeModulesPractice: NSObject {

    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }


    @objc func plus(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a+b)
    }

    @objc func simpleMethodReturns(
        _ callback: RCTResponseSenderBlock
    ) {
        callback(["CustomMethods.simpleMethodReturns()"])
    }

    @objc func simpleMethodWithParams(
        _ param: String,
        callback: RCTResponseSenderBlock
    ) {
        callback(["CustomMethods.simpleMethodWithParams('\(param)')"])
    }

    @objc func simpleMethodWithObj(
        _ param: [String: Any],
        callback: RCTResponseSenderBlock
    ) {
        callback(["CustomMethods.simpleMethodWithParams('\(param)')"])
    }

    @objc func resolvePromise(
        _ resolve: RCTPromiseResolveBlock,
        rejecter reject: RCTPromiseRejectBlock
    ) -> Void {
        resolve("CustomMethods.resolvePromise()")
    }

    @objc func rejectPromise(
        _ resolve: RCTPromiseResolveBlock,
        rejecter reject: RCTPromiseRejectBlock
    ) -> Void {
        reject("0", "CustomMethods.rejectPromise()", nil)
    }

    @objc func constantsToExport() -> [String: Any]! {
        return ["someKey": "someValue"]
    }

}
