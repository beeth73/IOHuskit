import SwiftUI

@main
struct IOHuskitApp: App {
    // We bind directly to the AppStorage variables here for the native menu!
    @AppStorage("isSensoryModeEnabled") private var isSensoryModeEnabled = false
    @AppStorage("isDrumModeEnabled") private var isDrumModeEnabled = false
    @AppStorage("isAngryLidEnabled") private var isAngryLidEnabled = false
    @AppStorage("isVampireModeEnabled") private var isVampireModeEnabled = false
    @AppStorage("isPersonalSpaceEnabled") private var isPersonalSpaceEnabled = false

    var body: some Scene {
        // Leaving out the style defaults it to the bulletproof native ".menu" style!
        MenuBarExtra("IOHuskit", systemImage: "hand.tap.fill") {
            
            Toggle("Sensory Trackpad", isOn: $isSensoryModeEnabled)
            Toggle("Trackpad Drum Kit", isOn: $isDrumModeEnabled)
            Toggle("Angry Lid Sensor", isOn: $isAngryLidEnabled)
            Toggle("Vampire Mode", isOn: $isVampireModeEnabled)
            Toggle("Personal Space Enforcer", isOn: $isPersonalSpaceEnabled)
            
            Divider()
            
            Button("Quit IOHuskit") {
                NSApplication.shared.terminate(nil)
            }
            .keyboardShortcut("q")
        }
    }
}
