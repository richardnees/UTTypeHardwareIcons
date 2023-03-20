import XCTest
import Cocoa
import UniformTypeIdentifiers
@testable import UTTypeHardwareIcons

final class NSImageTests: XCTestCase {
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}

    func test_current() throws {
        let model: UTType.DeviceModel = .current
        let image = NSImage(deviceModel: model)

        XCTAssertNotNil(image, "model : \(model), image : \((image != nil) ? "found" : "not found")")
    }

    func test_invalid_model_returns_empty_image() throws {
        let model: UTType.DeviceModel = "ÆØÅ"
        let image = NSImage(deviceModel: model)

        XCTAssertNil(image)
    }
}
