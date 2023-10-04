import EventKit
import EventKitUI

@objc(NativeModulesPractice)
class NativeModulesPractice: NSObject {

    let eventCalendarManager = EventsCalendarManager()


    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }


    @objc func plus(_ a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
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

    @objc func presentCalendar(
        _ config: [String: Any],
        resolver resolve: RCTPromiseResolveBlock,
        rejecter reject:RCTPromiseRejectBlock
    ) -> Void {
        DispatchQueue.main.async {
            let event = Event(title: "HelloWorld", startDate: "2023-10-06T06:45:00.000Z", endDate: "2023-10-06T08:45:00.000Z")
            self.eventCalendarManager.addEventToCalendar(event: event)
        }

    }

    @objc func constantsToExport() -> [String: Any]! {
        return ["someKey": "someValue"]
    }

}

