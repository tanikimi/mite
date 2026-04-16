import SwiftUI

struct TodoRowView: View {
    @Binding var item: TodoItem
    var onDelete: () -> Void
    
    var body: some View {
        HStack {
            // チェックボックス
            Button {
                item.isCompleted.toggle()
            } label: {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(item.isCompleted ? .secondary : .primary)
            }
            .buttonStyle(.plain)
            
            // タイトル
            Text(item.title)
                .strikethrough(item.isCompleted)
                .foregroundStyle(item.isCompleted ? .secondary : .primary)
            
            Spacer()
            
            // 削除ボタン
            Button {
                onDelete()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.secondary)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 4)
    }
}
