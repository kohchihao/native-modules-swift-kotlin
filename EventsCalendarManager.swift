//
//  EventsCalendarManager.swift
//  react-native-native-modules-practice
//
//  Created by Marcus Koh on 4/10/23.
//

import Foundation
import EventKit
import EventKitUI

class EventsCalendarManager: NSObject {


    var eventStore: EKEventStore!

    override init() {
        eventStore = EKEventStore()
    }

    // Request access to the Calendar
    private func requestCalendarAccess(
        resolver resolve: @escaping RCTPromiseResolveBlock,
        rejecter reject: @escaping RCTPromiseRejectBlock
    ) {
        if #unavailable(iOS 17) {
            eventStore.requestAccess(to: .event) { (accessGranted, error) in
                if (accessGranted) {
                    resolve(accessGranted)
                } else {
                    resolve(accessGranted)
                }
            }
        }
    }

    // Get Calendar auth status
    private func getCalendarAuthorizationStatus() -> EKAuthorizationStatus {
        return EKEventStore.authorizationStatus(for: .event)
    }

    func checkAndRequestCalendarAccessIfPossible(
        resolver resolve: @escaping RCTPromiseResolveBlock,
        rejecter reject: @escaping RCTPromiseRejectBlock
    ) {
        let status = getCalendarAuthorizationStatus();
        print("status",status.rawValue);
        switch status {
        case .authorized, .fullAccess, .writeOnly:
            print("auth full write")
            resolve(true)
            break
        case .denied, .restricted:
            print("denied restricted")
            resolve(false)
            break

        case .notDetermined:
            print("not determined")
            requestCalendarAccess(resolver: resolve, rejecter: reject)
            break

        @unknown default:
            resolve(false)
        }
    }

    // Add event to Calendar
    func addEventToCalendar(event: Event) {
        let ekEvent = generateEvent(event: event)

        let controller = EKEventEditViewController()
        controller.eventStore = eventStore
        controller.event = ekEvent
        controller.editViewDelegate = self
        let viewController = RCTPresentedViewController();
        viewController?.present(controller, animated: true)
    }

    // Generate the event
    private func generateEvent(event: Event) -> EKEvent {
        let ekEvent = EKEvent(eventStore: eventStore)
        ekEvent.title = event.title
        ekEvent.startDate = RCTConvert.nsDate(event.startDate)
        ekEvent.endDate =  RCTConvert.nsDate(event.endDate)
        ekEvent.location = event.location
        ekEvent.isAllDay = event.isAllDay ?? false
        ekEvent.notes = event.notes
        ekEvent.url = RCTConvert.nsurl(event.url)
        return ekEvent
    }
}

extension EventsCalendarManager: EKEventEditViewDelegate {

    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: {
            if (action == EKEventEditViewAction.saved) {
                print("saved")
            }

            if (action == EKEventEditViewAction.canceled) {
                print("cancelled")
            }

        })


    }
}

