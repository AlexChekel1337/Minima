//
// LazyDependencyTests.swift
// Minima
//
// Created by Alexandr Chekel on 28.02.2023.
// Copyright © 2023 Alexandr Chekel. All rights reserved.
//

import XCTest
@testable import Minima

private let testStringValue: String = "foo"

private extension Dependencies {
    static var stringDependencyAccessCount: Int = 0

    var stringDependency: String {
        Self.stringDependencyAccessCount += 1
        return testStringValue
    }
}

private class MyTestCaseClass {
    @LazyDependency(\.stringDependency) var stringDependency
}

class LazyDependencyTests: XCTestCase {
    override func setUp() {
        Dependencies.stringDependencyAccessCount = 0
    }

    // Tests that value was not injected because it was never accessed.
    func testLazyDependencyInjectionWithoutAccess() {
        let expectedValue = Dependencies.stringDependencyAccessCount
        _ = MyTestCaseClass()
        XCTAssertEqual(Dependencies.stringDependencyAccessCount, expectedValue)
    }

    // Tests that value was actually injected after accessing it for the first time.
    func testLazyDependencyInjection() {
        let expectedValue = Dependencies.stringDependencyAccessCount + 1
        let instance = MyTestCaseClass()
        _ = instance.stringDependency
        XCTAssertEqual(Dependencies.stringDependencyAccessCount, expectedValue)
    }

    // Tests that injected value is the same as value declared as dependency.
    func testLazilyInjectedValueEqual() {
        let instance = MyTestCaseClass()
        XCTAssertEqual(instance.stringDependency, testStringValue)
    }
}
