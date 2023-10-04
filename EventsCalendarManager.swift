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
    private func requestAccess(completion: @escaping EKEventStoreRequestAccessCompletionHandler) {
        eventStore.requestAccess(to: .event) { (accessGranted, error) in
            completion(accessGranted, error)
        }
    }

    // Get Calendar auth status
    private func getAuthorizationStatus() -> EKAuthorizationStatus {
        return EKEventStore.authorizationStatus(for: .event)
    }

    func addEventToCalendar(event: Event) {
        // deal with non-ios17 cases
        
        // ios17 case
        let ekEvent = generateEvent(event: event)
        
        let controller = EKEventEditViewController()
        controller.eventStore = eventStore
        controller.event = ekEvent
        controller.editViewDelegate = self
        let viewController = RCTPresentedViewController();
        viewController?.present(controller, animated: true)
    }

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

