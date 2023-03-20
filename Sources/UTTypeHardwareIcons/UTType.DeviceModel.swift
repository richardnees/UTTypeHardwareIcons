import Cocoa
import UniformTypeIdentifiers

extension UTType {
    /// Convenience type alias mapping DeviceModel to String
    public typealias DeviceModel = String

    /// Initializes an instance of UTType.DeviceModel
    /// - Parameter deviceModel: Apple Device Model Code, e.g.. Mac14,6 or iPhone14,8
    /// - Returns: Return nil if lookup of Device Model fails
    public init?(deviceModel: UTType.DeviceModel) {
        let tag = UTTagClass(rawValue: "com.apple.device-model-code")
        
        guard
            let reference = UTTypeReference(tag: deviceModel, tagClass: tag.rawValue, conformingTo: nil),
            let type = UTType(reference.identifier),
            !type.identifier.hasPrefix("dyn.")
        else {
            return nil
        }
                
        self = type
    }
}

extension UTType.DeviceModel {
    /// Apple Device Model Code for current hardware
    public static var current: UTType.DeviceModel {
        var size = 0
        sysctlbyname("hw.model", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0,  count: Int(size))
        sysctlbyname("hw.model", &machine, &size, nil, 0)
        let modelString = String(cString: machine)
        let returnString: String

        // Handle Virtualization
        if modelString.hasPrefix("VMware") {
            returnString = "MacBookPro18,1"
        } else {
            returnString = modelString
        }

        return returnString
    }
}
