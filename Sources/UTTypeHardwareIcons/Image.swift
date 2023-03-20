import SwiftUI
import UniformTypeIdentifiers

extension Image {
    /// SwiftUI Image instance from UTType.DeviceModel
    /// - Parameters:
    ///   - deviceModel: Apple Device Model Code, e.g.. Mac14,6 or iPhone14,8
    ///   - size: The _desired_ size. It looks up the best size representation which might differ in autual size
    /// - Returns: Returns nil if device model is not found
    public init?(deviceModel: UTType.DeviceModel, size: CGSize = .init(width: 32, height: 32)) {
        guard let nsImage = NSImage(deviceModel: deviceModel, size: size) else {
            return nil
        }
        self = Image(nsImage: nsImage)
    }
}
