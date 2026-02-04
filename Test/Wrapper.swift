import SwiftUI
import UniformTypeIdentifiers

struct DraggableColor: Transferable, Hashable, Codable {
    let rgba: [Double]

    var color: Color {
        Color(
            red: rgba[0],
            green: rgba[1],
            blue: rgba[2],
            opacity: rgba[3]
        )
    }

    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .data)
    }
}
