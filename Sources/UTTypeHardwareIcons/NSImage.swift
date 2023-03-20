import Cocoa
import UniformTypeIdentifiers

extension NSImage {
    /// NSImage instance from UTType.DeviceModel
    /// - Parameters:
    ///   - deviceModel: Apple Device Model Code, e.g.. Mac14,6 or iPhone14,8
    ///   - size: The _desired_ size. It looks up the best size representation which might differ in autual size
    public convenience init?(deviceModel: UTType.DeviceModel, size: CGSize = .init(width: 24, height: 24)) {
        guard
            let type = UTType(deviceModel: deviceModel),
            let bestRepresentation = NSWorkspace.shared.icon(for: type)
                .bestRepresentation(
                    for: .init(origin: .zero, size: size),
                    context: nil,
                    hints: nil)
        else {
            return nil
        }
        
        self.init(size: size)
        self.addRepresentation(bestRepresentation)
    }
}
