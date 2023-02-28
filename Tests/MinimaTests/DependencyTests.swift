//
// DependencyTests.swift
// Minima
//
// Created by Alexandr Chekel on 28.02.2023.
// Copyright © 2023 Alexandr Chekel. All rights reserved.
//

import XCTest
@testable import Minima

private let testIntValue: Int = 42

private extension Dependencies {
    static var intDependencyAccessCount: Int = 0

    var intDependency: Int {
        Self.intDependencyAccessCount += 1
        return testIntValue
    }
}

private class MyTestCaseClass {
    @Dependency(\.intDependency) var intDependency
}

class DependencyTests: XCTestCase {
    override func setUp() {
        Dependencies.intDependencyAccessCount = 0
    }

    // Tests that value was injected upon initialization with ever accessing it.
    func testDependencyInjectionUponInitialization() {
        let expectedValue = Dependencies.intDependencyAccessCount + 1
        _ = MyTestCaseClass()
        XCTAssertEqual(Dependencies.intDependencyAccessCount, expectedValue)
    }

    // Tests that injected value is the same as value declared as dependency.
    func testInjectedValueEqual() {
        let instance = MyTestCaseClass()
        XCTAssertEqual(instance.intDependency, testIntValue)
    }
}
