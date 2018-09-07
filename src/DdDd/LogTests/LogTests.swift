//
//  EvergreenTests.swift
//  EvergreenTests
//
//  Created by Nils Fischer on 30.09.14.
//  Copyright (c) 2014 viWiD Webdesign & iOS Development. All rights reserved.
//

import XCTest
@testable import Log

class LoggerTests: StenographyTestCase {
    
    func testDefaultLoggerIdentity() {
        let defaultLogger = Log.defaultLogger
        XCTAssert(defaultLogger === Log.defaultLogger, "Subsequent default logger queries return different objects")
        XCTAssert(defaultLogger === Logger.defaultLogger(), "Logger.defaultLogger() class method does not return Log.defaultLogger object")
        XCTAssert(defaultLogger === Logger.loggerForKeyPath(defaultLogger.keyPath), "Key path query does not return default logger object")
        for keyPath in ["Default", "", "."] {
            XCTAssert(defaultLogger === Logger.loggerForKeyPath(Logger.KeyPath(string: keyPath)), "Query with key path string '\(keyPath)' does not return default logger object")
        }
        XCTAssert(defaultLogger === Logger.loggerForKeyPath(Logger.KeyPath(components: [])), "Query with empty key path does not return default logger object")
    }
    
    func testHierarchy() {
        let defaultLogger = Log.defaultLogger
        for keyPath in ["Default.FirstParent", "SecondParent", ".ThirdParent"] {
            XCTAssert(Logger.loggerForKeyPath(Logger.KeyPath(string: keyPath)).parent === defaultLogger, "Logger for key path string '\(keyPath)' is not a child of the default logger")
        }
        let parentLogger = defaultLogger.child("Parent")
        XCTAssert(parentLogger.parent === defaultLogger, "childForKeyPath() instance method does not establish parent relationship.")
        defaultLogger.logLevel = .none
        XCTAssert(parentLogger.effectiveLogLevel == defaultLogger.logLevel, "Logger with no explicit log level does not inherit parent's log level")
        let childLogger = Logger.loggerForKeyPath("Parent.Child")
        XCTAssert(childLogger.parent === parentLogger, "Child logger created by key path 'Parent.Child' is not a child of 'Parent' logger")
    }
    
    func testDetachedLogger() {
        let detachedLogger = Logger(key: "Detached", parent: nil)
        XCTAssert(detachedLogger.parent == nil, "Newly initialized logger is not detached from logger hierarchy.")
    }
    
    func testLogLevels() {
        let debug = LogLevel.debug
        for description in ["debug", "DEBUG", "Debug"] {
            let logLevelFromDescription = LogLevel(description: description)
            XCTAssert(logLevelFromDescription != nil, "Can't initialize log level from description \(description).")
            XCTAssert(logLevelFromDescription == debug, "Log level \(logLevelFromDescription!) initialized from description \(description) does not match \(debug).")
        }
        var logLevels: [LogLevel] = []
        var i = 0
        while let logLevel = LogLevel(rawValue: i) {
            logLevels.append(logLevel)
            let logLevelFromDescription = LogLevel(description: logLevel.description)
            XCTAssert(logLevelFromDescription != nil, "Can't initialize log level from description \(logLevel.description).")
            XCTAssert(logLevelFromDescription == logLevel, "Log level \(logLevelFromDescription!) initialized from description \(logLevel.description) does not match \(logLevel).")
            let logLevelFromUppercaseDescription = LogLevel(description: logLevel.description.uppercased())
            XCTAssert(logLevelFromUppercaseDescription != nil, "Can't initialize log level from description \(logLevel.description.uppercased()).")
            XCTAssert(logLevelFromUppercaseDescription == logLevel, "Log level \(logLevelFromUppercaseDescription!) initialized from description \(logLevel.description) does not match \(logLevel).")
            i += 1
        }
        XCTAssert(logLevels.sorted(by: <) == logLevels, "Log levels initialized by sequencial raw values are not ordered by comparison operator.")
    }
    
    #if !os(Linux)
    func testErrorTypeLogging() {
        let error = NSError(domain: "error_domain", code: 0, userInfo: nil)
        Log.verbose("Something failed", error: error)
    }
    #endif
    
    static var allTests : [(String, (LoggerTests) -> () throws -> Void)] {
        return [
            ("testDefaultLoggerIdentity",    testDefaultLoggerIdentity),
            ("testHierarchy",                testHierarchy),
            ("testDetachedLogger",            testDetachedLogger),
            ("testLogLevels",                testLogLevels),
        ]
    }
}
