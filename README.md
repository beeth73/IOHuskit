# IOHuskit 🐾

An interactive, mischievous macOS background utility that bridges the gap between hardware telemetry and behavioral humor. By intercepting Mac-specific sensor data, IOHuskit transforms everyday laptop physics into playful, expressive, and humorous interactions.

Inspired by historic viral utilities like *SlapMac* and trackpad scales, IOHuskit operates as a highly optimized, battery-conscious system menu bar application.

## Current & Planned Features

*   🥁 **Trackpad Drum Kit:** Force-clicking (slapping) the trackpad triggers high-impact drum kit audio.
*   🫦 **Sensory Trackpad:** Gently petting the trackpad (two-finger scroll) triggers a soft, interactive vocal feedback.
*   🤬 **Angry Lid (Hinge Sensor):** Rapidly slamming the laptop lid closed triggers a defensive *"Handle with care, you moron!"* warning.
*   🧛‍♂️ **Vampire Mode (Light Sensor):** Sudden exposure to harsh sunlight triggers a dramatic *"it sure burns out here..."* voice line (limited to once a day).
*   🛑 **Personal Space Enforcer (Vision Proximity):** Utilizing Apple's Vision framework to detect when someone is leaning too close to the screen, issuing a friendly boundary check.

## System Architecture

To ensure zero-lag execution and bulletproof system reliability, IOHuskit adopts a highly disciplined, multi-layered architecture:
*   **The Interface:** Built using Apple's native AppKit Menu architecture (similar to Postgres.app) for maximum reliability and a 100% native system look.
*   **The Core Engine:** Run via modular, decoupled managers (`TrackpadManager`, `AudioManager`, etc.) utilizing `NSEvent` monitoring.
*   **Sandbox-Free Execution:** Operates outside the App Sandbox to negotiate raw system-level events (specifically targeting force-touch pressure and scroll velocity).