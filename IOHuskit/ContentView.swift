import SwiftUI

struct ContentView: View {
    // Our @AppStorage variables (Saves to hard drive)
    @AppStorage("isSensoryModeEnabled") private var isSensoryModeEnabled = false
    @AppStorage("isDrumModeEnabled") private var isDrumModeEnabled = false
    @AppStorage("isAngryLidEnabled") private var isAngryLidEnabled = false
    @AppStorage("isVampireModeEnabled") private var isVampireModeEnabled = false
    @AppStorage("isPersonalSpaceEnabled") private var isPersonalSpaceEnabled = false

    var body: some View {
        ZStack {
            // Liquid Glass Base Gradient
            LinearGradient(
                colors: [Color.blue.opacity(0.15), Color.purple.opacity(0.15)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .blur(radius: 20)

            VStack(spacing: 6) {
                // Futuristic Header
                HStack {
                    Text("IOHuskit")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.9))
                    Spacer()
                    Image(systemName: "cpu")
                        .foregroundStyle(.purple)
                        .symbolEffect(.pulse) // Subtle animation!
                }
                .padding(.bottom, 8)
                .padding(.horizontal, 4)

                // Perfectly Aligned Toggles
                Group {
                    GlassToggle(title: "Sensory Trackpad", icon: "hand.tap.fill", isOn: $isSensoryModeEnabled)
                    GlassToggle(title: "Trackpad Drum Kit", icon: "hifispeaker.fill", isOn: $isDrumModeEnabled)
                    GlassToggle(title: "Angry Lid Sensor", icon: "macbook.and.iphone", isOn: $isAngryLidEnabled)
                    GlassToggle(title: "Vampire Mode", icon: "moon.fill", isOn: $isVampireModeEnabled)
                    GlassToggle(title: "Personal Space", icon: "eye.fill", isOn: $isPersonalSpaceEnabled)
                }

                Divider()
                    .background(Color.white.opacity(0.1))
                    .padding(.vertical, 8)

                // Liquid Quit Button
                Button(action: {
                    NSApplication.shared.terminate(nil)
                }) {
                    HStack {
                        Text("Quit IOHuskit")
                        Spacer()
                        Image(systemName: "power")
                    }
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundColor(.red.opacity(0.9))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .background(Color.red.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
                .buttonStyle(.plain)
            }
            .padding(16)
        }
        .background(.ultraThinMaterial)
                .frame(width: 270, height: 350) // <--- Add "height: 350" here!
    }
}

// MARK: - Custom Component
// This struct ensures our icons and text are mathematically aligned.
struct GlassToggle: View {
    var title: String
    var icon: String
    @Binding var isOn: Bool

    var body: some View {
        HStack(spacing: 12) {
            // By giving the icon a strict width of 24, all text starts at the exact same pixel
            Image(systemName: icon)
                .font(.system(size: 15))
                .frame(width: 24, alignment: .center)
                .foregroundColor(isOn ? .white : .primary.opacity(0.6))
            
            Text(title)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(isOn ? .white : .primary.opacity(0.9))
            
            Spacer()
            
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .toggleStyle(.switch)
                .tint(.purple) // Accents the liquid glass aesthetic
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        // Adds a glowing highlight when turned on
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(isOn ? Color.white.opacity(0.1) : Color.clear)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(isOn ? Color.white.opacity(0.15) : Color.clear, lineWidth: 1)
        )
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isOn)
    }
}

#Preview {
    ContentView()
}
