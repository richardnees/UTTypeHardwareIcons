import XCTest
import SwiftUI
import UniformTypeIdentifiers
@testable import UTTypeHardwareIcons

final class ImageTests: XCTestCase {
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}

    func test_current() throws {
        let model: UTType.DeviceModel = .current
        let image = Image(deviceModel: model)

        XCTAssertNotNil(image)
    }

    func test_invalid_model_returns_empty_image() throws {
        let model: UTType.DeviceModel = "ÆØÅ"
        let image = Image(deviceModel: model)

        XCTAssertNil(image)
    }
}
