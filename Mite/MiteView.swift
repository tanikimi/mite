import SwiftUI

struct MiteView: View {
    @State private var items: [TodoItem] = []
    @State private var newItemTitle: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            // タイトルバー
            HStack {
                Text("新しいリスト")
                    .font(.headline)
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            
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
    }
    
    private func addItem() {
        let trimmed = newItemTitle.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        items.append(TodoItem(title: trimmed))
        newItemTitle = ""
    }
}
