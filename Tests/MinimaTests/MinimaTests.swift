//
// MinimaTests.swift
// Minima
//
// Created by Alexandr Chekel on 28.02.2023.
// Copyright © 2023 Alexandr Chekel. All rights reserved.
//

import XCTest
@testable import Minima

private class MyTestCaseClass {
    @Dependency(\.integerDependency) var integerDependency
}

class MinimaTests: XCTestCase {
    func testInjection() {
        let testInstance = MyTestCaseClass()
        XCTAssertEqual(testInstance.integerDependency, testIntValue)
    }
}
