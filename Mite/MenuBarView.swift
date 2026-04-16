//
//  MenuBarView.swift
//  Mite
//
//  Created by 谷川 木穣 on 2026/04/16.
//

import SwiftUI

struct MenuBarView: View {
    var body: some View {
        Button("新規リスト"){
            // ここにウィンドウ生成処理
        }
        
        Divider()
        
        Button("終了"){
            NSApplication.shared.terminate(nil)
        }
    }
}
