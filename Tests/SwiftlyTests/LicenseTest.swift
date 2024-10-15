import Foundation
@testable import Swiftly
import XCTest

private func lstrip(_ str: String) -> String {
    guard let startIndex = str.firstIndex(where:
        { $0 != " " && $0 != "\n" && $0 != "\r" })
    else {
        return ""
    }
    return String(str[startIndex...])
}

private func getLine(_ str: String) -> String {
    guard let endIndex = str.firstIndex(where: { $0 == "\n" })
    else {
        return str
    }
    return String(str[..<endIndex])
}


final class LicenseTests: SwiftlyTests {
    func testLicense() async throws {
        var license = try self.parseCommand(License.self, ["license"])
        let output = try await license.runWithMockedIO(quiet: true)
        XCTAssertEqual(lstrip(getLine(output[0])), "Apache License")
    }
}
