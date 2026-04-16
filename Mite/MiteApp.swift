import SwiftUI

@main
struct MiteApp: App {
    var body: some Scene {
        MenuBarExtra("Mite", systemImage: "checklist"){
            MenuBarView()
        }
    }
}
