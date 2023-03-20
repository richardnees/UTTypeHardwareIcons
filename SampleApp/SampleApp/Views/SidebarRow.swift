import SwiftUI
import UniformTypeIdentifiers

struct SidebarRow: View {
    private let iconSize = CGSize(width: 24, height: 24)

    let model: UTType.DeviceModel
    
    var body: some View {
        NavigationLink(value: model) {
            HStack {
                Image(deviceModel: model, size: iconSize)
                VStack(alignment: .leading) {
                    Text(UTType(deviceModel: model)?.localizedDescription ?? "Unknown Model")
                    Text(model)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationDestination(for: UTType.DeviceModel.self) { model in
            DeviceDetailView(model: model)
        }
    }
}

struct SidebarRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            SidebarRow(model: .current)
            SidebarRow(model: "iPhone1,1")
        }
    }
}
