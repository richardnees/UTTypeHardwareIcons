import SwiftUI
import UniformTypeIdentifiers
import UTTypeHardwareIcons

struct DeviceDetailView: View {
    private let iconSize = CGSize(width: 512, height: 512)
    let model: UTType.DeviceModel
    
    var body: some View {
        ScrollView {
            VStack {
                DraggableImageView(name: model, nsImage: NSImage(deviceModel: model, size: iconSize) ?? NSImage())
                Text(model)
                    .font(.title.bold())
            }
        }
    }
}

struct DeviceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceDetailView(model: .current)
    }
}
