//
//  MenuBarView.swift
//  Mite
//
//  Created by 谷川 木穣 on 2026/04/16.
//

import SwiftUI

struct MenuBarView: View {
    @State private var windowControllers: [MiteWindowController] = []
    
    var body: some View {
        Button("新規リスト"){
            let controller = MiteWindowController()
            controller.showWindow(nil)
            windowControllers.append(controller)
        }
        
        Divider()
        
        Button("終了"){
            NSApplication.shared.terminate(nil)
        }
    }
}
