
import SwiftUI

struct SettingsView: View {
    @State private var enableNotifications = true
    @State private var darkMode = false

    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Toggle("Enable Notifications", isOn: $enableNotifications)
                Toggle("Dark Mode", isOn: $darkMode)
            }
        } label: {
            Label("Settings", systemImage: "gearshape")
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
