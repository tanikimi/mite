import SwiftUI

struct MiteView: View {
    @State private var items: [TodoItem] = []
    @State private var newItemTitle: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                // 自前の閉じるボタン
                Button {
                    // 現在アクティブなウィンドウを閉じる
                    NSApplication.shared.keyWindow?.close()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(.tertiary) // 画像のような控えめなグレーに
                }
                .buttonStyle(.plain)
                
                Text("新しいリスト")
                    .font(.headline)
                    .padding(.leading, 4)
                
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.top, 12)
            .padding(.bottom, 8)
            
            Divider()
            
            Divider()
            
            // TODOリスト
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach($items) { $item in
                        TodoRowView(item: $item) {
                            items.removeAll { $0.id == item.id }
                        }
                    }
                }
                .padding(8)
            }
            
            Divider()
            
            // 入力欄
            HStack {
                TextField("新しいTODOを入力", text: $newItemTitle)
                    .textFieldStyle(.plain)
                    .onSubmit {
                        addItem()
                    }
            }
            .padding(12)
        }
        .frame(width: 300, height: 400)
        .ignoresSafeArea()
    }
    
    private func addItem() {
        let trimmed = newItemTitle.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        items.append(TodoItem(title: trimmed))
        newItemTitle = ""
    }
}
