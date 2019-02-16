import XCTest
@testable import FFCLog

final class FFCLogTests: XCTestCase {

    func testOffLevel() {
        let level = Level.off

        let error = TestOutputStream()
        let info = TestOutputStream()

        let log = FFCLog(thresholdLevel: level, errorOut: error, infoOut: info)

        log.log("info", level: .info)
        log.log("debug", level: .debug)
        log.log("error", level: .error)
        log.log("fatal", level: .fatal)

        XCTAssertEqual(error.logs, ["info", "debug", "error", "fatal"])
        XCTAssertEqual(info.logs, [])
    }

    func testFatalLevel() {
        let level = Level.fatal

        let error = TestOutputStream()
        let info = TestOutputStream()

        let log = FFCLog(thresholdLevel: level, errorOut: error, infoOut: info)

        log.log("info", level: .info)
        log.log("debug", level: .debug)
        log.log("error", level: .error)
        log.log("fatal", level: .fatal)

        XCTAssertEqual(error.logs, ["info", "debug", "error"])
        XCTAssertEqual(info.logs, ["fatal"])
    }

    func testErrorLevel() {
        let level = Level.error

        let error = TestOutputStream()
        let info = TestOutputStream()

        let log = FFCLog(thresholdLevel: level, errorOut: error, infoOut: info)

        log.log("info", level: .info)
        log.log("debug", level: .debug)
        log.log("error", level: .error)
        log.log("fatal", level: .fatal)

        XCTAssertEqual(error.logs, ["info", "debug"])
        XCTAssertEqual(info.logs, ["error", "fatal"])
    }

    func testDebugLevel() {
        let level = Level.debug

        let error = TestOutputStream()
        let info = TestOutputStream()

        let log = FFCLog(thresholdLevel: level, errorOut: error, infoOut: info)

        log.log("info", level: .info)
        log.log("debug", level: .debug)
        log.log("error", level: .error)
        log.log("fatal", level: .fatal)

        XCTAssertEqual(error.logs, ["info"])
        XCTAssertEqual(info.logs, ["debug", "error", "fatal"])
    }

    func testInfoLevel() {
        let level = Level.info

        let error = TestOutputStream()
        let info = TestOutputStream()

        let log = FFCLog(thresholdLevel: level, errorOut: error, infoOut: info)

        log.log("info", level: .info)
        log.log("debug", level: .debug)
        log.log("error", level: .error)
        log.log("fatal", level: .fatal)

        XCTAssertEqual(error.logs, [])
        XCTAssertEqual(info.logs, ["info", "debug", "error", "fatal"])
    }

    func testAllLevel() {
        let level = Level.all

        let error = TestOutputStream()
        let info = TestOutputStream()

        let log = FFCLog(thresholdLevel: level, errorOut: error, infoOut: info)

        log.log("info", level: .info)
        log.log("debug", level: .debug)
        log.log("error", level: .error)
        log.log("fatal", level: .fatal)

        XCTAssertEqual(error.logs, [])
        XCTAssertEqual(info.logs, ["info", "debug", "error", "fatal"])
    }


    static var allTests = [
        ("testInfoLevel", testInfoLevel),
    ]
}

class TestOutputStream: LogOutputStream {

    var logs: [String] = []

    func write(_ string: String) {
        logs.append(string)
    }

}
