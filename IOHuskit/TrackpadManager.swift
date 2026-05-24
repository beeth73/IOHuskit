import AppKit
import SwiftUI
import Combine

class TrackpadManager: ObservableObject {
    static let shared = TrackpadManager()
    private var eventMonitor: Any?

    private init() {}

    func startMonitoring() {
        let mask: NSEvent.EventTypeMask = [.leftMouseDown, .pressure, .scrollWheel]
        
        eventMonitor = NSEvent.addGlobalMonitorForEvents(matching: mask) { event in
            self.analyzeTouch(event)
        }
        
        NSEvent.addLocalMonitorForEvents(matching: mask) { event in
            self.analyzeTouch(event)
            return event
        }
        
        print("👁️ TrackpadManager: Listening for events...")
    }

    private func analyzeTouch(_ event: NSEvent) {
        // Now reading the ACTUAL toggle states from your menu bar!
        let isSensoryModeOn = UserDefaults.standard.bool(forKey: "isSensoryModeEnabled")
        let isDrumModeOn = UserDefaults.standard.bool(forKey: "isDrumModeEnabled")

        // 📥 LIVE DIAGNOSTIC: This will print whenever the trackpad detects any interaction!
        // It tells you exactly what type of event was captured, and if the toggles are ON or OFF.
        print("📥 Raw Event: \(event.type) | Sensory Toggle: \(isSensoryModeOn) | Drum Toggle: \(isDrumModeOn)")

        // 💥 SLAP LOGIC (Using pressure / hard clicks)
        if event.type == .pressure || event.type == .leftMouseDown {
            let pressure = event.pressure
            if pressure >= 0.8 && isDrumModeOn {
                print("💥 SLAP DETECTED! Pressure: \(String(format: "%.2f", pressure))")
            }
        }
        // 🫦 GENTLE STROKE LOGIC (Using 2-finger scrolling)
        else if event.type == .scrollWheel && isSensoryModeOn {
            let speedX = abs(event.scrollingDeltaX)
            let speedY = abs(event.scrollingDeltaY)
            
            if (speedX > 0 && speedX < 4) || (speedY > 0 && speedY < 4) {
                print("🫦 GENTLE STROKE DETECTED... SpeedX: \(String(format: "%.1f", speedX)) SpeedY: \(String(format: "%.1f", speedY))")
            }
        }
    }
    
    func stopMonitoring() {
        if let monitor = eventMonitor {
            NSEvent.removeMonitor(monitor)
            eventMonitor = nil
            print("🛑 TrackpadManager: Stopped listening.")
        }
    }
}
