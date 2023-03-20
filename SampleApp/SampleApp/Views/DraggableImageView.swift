import SwiftUI
import UniformTypeIdentifiers

struct DraggableImageView: View {
    let name: String
    let nsImage: NSImage

    var body: some View {
        Image(nsImage: nsImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: nsImage.size.width, height: nsImage.size.height)
            .onDrag {
                let data = nsImage.tiffRepresentation
                let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(name).appendingPathExtension("tiff")
                try? data?.write(to: url)

                let provider = NSItemProvider(item: url as NSSecureCoding?, typeIdentifier: UTType.fileURL.identifier)
                provider.suggestedName = url.lastPathComponent
                provider.previewImageHandler = { (handler, _, _) -> Void in
                    handler?(data as NSSecureCoding?, nil)
                }
                return provider
            } preview: {
                Image(nsImage: nsImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
            }

    }
}

struct DraggableImageView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableImageView(name: "Test", nsImage: NSImage(deviceModel: .current) ?? NSImage())
    }
}
