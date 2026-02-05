import SwiftUI

struct ContentView: View {
    let colors: [DraggableColor] = [
        .init(rgba: [1, 0, 0, 1]),
        .init(rgba: [1, 0.5, 0, 1]),
        .init(rgba: [1, 1, 0, 1]),
        .init(rgba: [0, 1, 0, 1]),
        .init(rgba: [0, 0, 1, 1]),
        .init(rgba: [0.5, 0, 0.5, 1])
    ]

    @State private var slotColors: [DraggableColor?] = Array(repeating: nil, count: 4)
    @State private var targetedIndex: Int?

    var body: some View {
        VStack(spacing: 40) {

            // Palette
            // Palette
            HStack(spacing: 20) {
                ForEach(colors, id: \.self) { draggable in
                    Circle()
                        .fill(draggable.color)
                        .frame(width: 30, height: 30)
                        .contentShape(Circle())          // ← ADD THIS
                        .draggable(draggable) {          // ← CHANGE THIS
                            Circle()
                                .fill(draggable.color)
                                .frame(width: 60, height: 60)
                        }
                }
            }

            // Slots
            HStack(spacing: 30) {
                ForEach(0..<4, id: \.self) { index in
                    Circle()
                        .fill(slotColors[index]?.color ?? Color.gray.opacity(0.2))
                        .overlay(
                            Circle()
                                .stroke(
                                    targetedIndex == index ? .blue : .gray,
                                    lineWidth: 4
                                )
                        )
                        .frame(width: 80, height: 80)
                        .dropDestination(for: DraggableColor.self) { items, _ in
                            slotColors[index] = items.first
                            return true
                        } isTargeted: { isTargeted in
                            targetedIndex = isTargeted ? index : nil
                        }
                }
            }
        }
        .padding()
    }
}
