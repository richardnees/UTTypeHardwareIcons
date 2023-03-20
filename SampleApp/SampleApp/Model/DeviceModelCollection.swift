import Foundation
import UniformTypeIdentifiers
import UTTypeHardwareIcons

extension [UTType.DeviceModel] {
    var uniqued: [UTType.DeviceModel] {
        guard let index = self.firstIndex(of: UTType.DeviceModel.current) else { return self }
        var uniqued: [UTType.DeviceModel] = self
        uniqued.remove(at: index)
        return uniqued
    }
}

struct DeviceModelCollection {
    let name: String
    let devices: [UTType.DeviceModel]
}

extension DeviceModelCollection: Identifiable {
    var id: UUID {
        UUID()
    }
}

extension [DeviceModelCollection] {
    func filter(query: String) -> [DeviceModelCollection] {
        guard !query.isEmpty else { return self }
        var filteredCollections: [DeviceModelCollection] = []
        
        self.forEach { collection in
            let devices = collection.devices.filter {
                $0.localizedCaseInsensitiveContains(query) ||
                (UTType(deviceModel: $0)?.localizedDescription ?? "").localizedCaseInsensitiveContains(query)
            }
            if devices.count > 0 {
                filteredCollections.append(DeviceModelCollection(name: collection.name, devices: devices))
            }
        }

        return filteredCollections
    }
}

extension DeviceModelCollection {
    static var all: [DeviceModelCollection] {
        return [
            DeviceModelCollection(
                name: "Macs",
                devices: [
                    "Mac13,1",
                    "Mac13,2",
                    "Mac14,2",
                    "Mac14,3",
                    "Mac14,5",
                    "Mac14,6"
                ].uniqued
            ),
            DeviceModelCollection(
                name: "Mac Pro",
                devices: [
                    "MacPro1,1",
                    "MacPro2,1",
                    "MacPro3,1",
                    "MacPro4,1",
                    "MacPro5,1",
                    "MacPro6,1",
                    "MacPro7,1",
                ].uniqued
            ),
            DeviceModelCollection(
                name: "MacBook Air",
                devices: [
                    "MacBookAir1,1",
                    "MacBookAir2,1",
                    "MacBookAir3,1",
                    "MacBookAir4,1",
                    "MacBookAir5,1",
                    "MacBookAir6,1",
                    "MacBookAir7,1",
                    "MacBookAir8,1",
                    "MacBookAir9,1",
                    "MacBookAir10,1",
                ].uniqued
            ),
            DeviceModelCollection(
                name: "MacBook Pro",
                devices: [
                    "MacBookPro1,1",
                    "MacBookPro2,1",
                    "MacBookPro3,1",
                    "MacBookPro4,1",
                    "MacBookPro5,1",
                    "MacBookPro6,1",
                    "MacBookPro7,1",
                    "MacBookPro8,1",
                    "MacBookPro9,1",
                    "MacBookPro10,1",
                    "MacBookPro11,1",
                    "MacBookPro12,1",
                    "MacBookPro13,1",
                    "MacBookPro14,1",
                    "MacBookPro14,2",
                    "MacBookPro14,3",
                    "MacBookPro15,1",
                    "MacBookPro15,2",
                    "MacBookPro15,3",
                    "MacBookPro15,4",
                    "MacBookPro16,1",
                    "MacBookPro16,2",
                    "MacBookPro16,3",
                    "MacBookPro16,4",
                    "MacBookPro17,1",
                    "MacBookPro18,1",
                    "MacBookPro18,2",
                    "MacBookPro18,3",
                    "MacBookPro18,4",
                ].uniqued
            ),
            DeviceModelCollection(
                name: "iMac",
                devices: [
                    "PowerMac4,5",
                    "PowerMac4,2",
                    "PowerMac6,1",
                    "PowerMac6,3",
                    "PowerMac8,1",
                    "PowerMac8,2",
                    "PowerMac12,1",
                    "iMac4,1",
                    "iMac5,1",
                    "iMac6,1",
                    "iMac7,1",
                    "iMac8,1",
                    "iMac9,1",
                    "iMac10,1",
                    "iMac11,1",
                    "iMac11,2",
                    "iMac11,3",
                    "iMac12,1",
                    "iMac12,2",
                    "iMac13,1",
                    "iMac13,2",
                    "iMac13,3",
                    "iMac14,1",
                    "iMac14,2",
                    "iMac14,3",
                    "iMac14,4",
                    "iMac15,1",
                    "iMac16,1",
                    "iMac17,1",
                    "iMac18,1",
                    "iMac19,1",
                    "iMac20,1",
                    "iMac21,1",
                    "iMac21,2",
                ].uniqued
            ),
            DeviceModelCollection(
                name: "iPhone",
                devices: [
                    "iPhone1,1",
                    "iPhone2,1",
                    "iPhone3,1",
                    "iPhone4,1",
                    "iPhone5,1",
                    "iPhone6,1",
                    "iPhone6,2",
                    "iPhone7,1",
                    "iPhone7,2",
                    "iPhone8,1",
                    "iPhone8,2",
                    "iPhone9,1",
                    "iPhone9,2",
                    "iPhone10,1",
                    "iPhone10,2",
                    "iPhone10,3",
                    "iPhone10,4",
                    "iPhone10,5",
                    "iPhone10,6",
                    "iPhone11,2",
                    "iPhone11,4",
                    "iPhone11,6",
                    "iPhone11,8",
                    "iPhone12,1",
                    "iPhone12,3",
                    "iPhone12,5",
                    "iPhone12,8",
                    "iPhone13,1",
                    "iPhone13,2",
                    "iPhone13,3",
                    "iPhone13,4",
                    "iPhone14,2",
                    "iPhone14,3",
                    "iPhone14,4",
                    "iPhone14,5",
                    "iPhone14,6",
                    "iPhone14,7",
                    "iPhone14,8",
                ].uniqued
            ),
            DeviceModelCollection(
                name: "iPad",
                devices: [
                    "iPad1,1",
                    "iPad2,1",
                    "iPad3,1",
                    "iPad4,1",
                    "iPad5,1",
                    "iPad7,1",
                    "iPad8,1",
                ].uniqued
            ),
        ]
    }
}
