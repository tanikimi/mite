import AppKit
import SwiftUI

class MiteWindowController: NSWindowController {
    convenience init() {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 300, height: 400),
            styleMask: [.titled, .closable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        
        window.title = "新しいリスト"
        window.titlebarAppearsTransparent = true
        window.isMovableByWindowBackground = true
        window.center()
        
        self.init(window: window)
        
        window.contentView = NSHostingView(rootView: MiteView())
    }
}
