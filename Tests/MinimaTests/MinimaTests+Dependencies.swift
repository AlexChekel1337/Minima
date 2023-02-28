//
// MinimaTests+Dependencies.swift
// Minima
//
// Created by Alexandr Chekel on 28.02.2023.
// Copyright © 2023 Alexandr Chekel. All rights reserved.
//

import Foundation
@testable import Minima

let testIntValue: Int = 42

extension Dependencies {
    var integerDependency: Int {
        testIntValue
    }
}
