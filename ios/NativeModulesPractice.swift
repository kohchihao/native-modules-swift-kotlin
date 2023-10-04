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
        //"2023-10-06T06:45:00.000Z"
        DispatchQueue.main.async {
            let event = Event(
                title: RCTConvert.nsString(config["title"]) ?? "",
                startDate: RCTConvert.nsString(config["startDate"]) ?? "" ,
                endDate: RCTConvert.nsString(config["endDate"]) ?? "",
                location: RCTConvert.nsString(config["location"]) ?? nil,
                isAllDay: RCTConvert.bool(config["isAllDay"]),
                notes: RCTConvert.nsString(config["notes"]) ?? nil,
                url: RCTConvert.nsString(config["url"]) ?? nil
            )
            self.eventCalendarManager.addEventToCalendar(event: event)
        }

    }

    @objc func checkAndRequestCalendarAccessIfPossible(
        _ resolve: @escaping RCTPromiseResolveBlock,
        rejecter reject:@escaping RCTPromiseRejectBlock
    ) -> Void {
        self.eventCalendarManager.checkAndRequestCalendarAccessIfPossible(resolver: resolve, rejecter: reject)
    }





    @objc func constantsToExport() -> [String: Any]! {
        return ["someKey": "someValue"]
    }

}

