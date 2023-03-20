import XCTest
import UniformTypeIdentifiers
@testable import UTTypeHardwareIcons

final class UTTypeDeviceModelTests: XCTestCase {
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}

    func test_current() throws {
        let model: UTType.DeviceModel = .current
        XCTAssertNotNil(model)
    }

    func test_macBookPro10_1() throws {
        let deviceModel: UTType.DeviceModel = "MacBookPro10,1"
        guard let type: UTType = UTType(deviceModel: deviceModel) else {
            XCTFail("Unable to instantiate UTType with DeviceModel MacBookPro10,1")
            return
        }
        XCTAssertEqual(type.identifier, "com.apple.macbookpro-15-retina-display")
    }

    func test_invalid_model_returns_nil() throws {
        let deviceModel: UTType.DeviceModel = "ÆØÅ"
        let type: UTType? = UTType(deviceModel: deviceModel)
        XCTAssertNil(type)
    }
}

