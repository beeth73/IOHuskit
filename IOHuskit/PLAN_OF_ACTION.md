# IOHuskit: Plan of Action 🚀

This document outlines the step-by-step roadmap to conquering the macOS hardware telemetry layers.

---

## Phase 1: Core Architecture & UI 
*   [x] **Project Initialization:** Set up standard macOS SwiftUI project template.
*   [x] **Security Configuration:** Disable **App Sandbox** in Target Settings to enable global background system monitoring.
*   [x] **The Postgres-Style Menu:** Transition from the buggy custom SwiftUI Popover window to a 100% native, bulletproof AppKit `.menu` layout.
*   [x] **Settings Persistence:** Link menu toggles directly to `@AppStorage` (`UserDefaults`) to preserve user settings on reboot.

## Phase 2: The Trackpad Brain 🧠 (Current Focus)
*   [x] **Telemetry Hook:** Implement `TrackpadManager` utilizing `NSEvent` global/local event monitors.
*   [x] **The Slap Monitor:** Decode hard clicks using a force-touch pressure threshold of `>= 0.8`.
*   [x] **The Petting Monitor:** Implement a "gentle stroke" detection algorithm using slow-scrolling (`.scrollWheel`) telemetry as a proxy for multitouch.
*   [ ] **System Permissions Check:** Grant Xcode and IOHuskit **Accessibility** and **Input Monitoring** privileges in macOS System Settings (to be completed upon restart).
*   [ ] **Audio Engine Integration:** Complete and connect `AudioManager` to trigger `slap.wav` and `stroke.mp3` with zero-latency.

## Phase 3: Environmental Controls 🌌
*   [ ] **Hinge Telemetry (`LidManager`):** Explore IOKit and SMC power manager domains to calculate lid closure velocity.
*   [ ] **Ambient Telemetry (`EnvironmentManager`):** Tap into the Mac's ambient light sensor (ALS) to log direct lux spikes for Vampire Mode.

## Phase 4: Vision & Boundaries 👁️
*   [ ] **Camera Capture Session (`VisionManager`):** Set up a light, low-frequency camera capture frame loop.
*   [ ] **Proximity Processing:** Use Apple's Vision framework to measure the bounding box of the closest face, triggering personal space protocols if it takes up too much of the screen.

## Phase 5: Polish & Distribution 📦
*   [ ] **Asset Gathering:** Compile clean, humorous `.mp3`/`.wav` audio elements.
*   [ ] **QA Battery Profile:** Stress-test CPU cycles and memory overhead to ensure background monitoring does not heat up the Mac or drain the battery.
*   [ ] **GitHub Release:** Package the final standalone `.app` for distribution.