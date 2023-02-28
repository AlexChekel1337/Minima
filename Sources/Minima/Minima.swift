//
// Minima.swift
// Minima
//
// Created by Alexandr Chekel on 27.02.2023.
// Copyright © 2023 Alexandr Chekel. All rights reserved.
//

import Foundation

/// Dependency store. See dependency declaration example in the "Discussion" block.
/// ```
/// extension Dependencies {
///     var integerDependency: Int { ... }
///     var settingsService: SettingsService { ... }
/// }
/// ```
/// To inject a dependency use `Dependency` property wrapper:
/// ```
/// @Dependency(\.integerDependency) private var integerDependency
/// @Dependency(\.settingsService) private var settingsService
/// ```
public struct Dependencies {
    public static let common = Self()
}

@propertyWrapper
public struct Dependency<D> {
    public private(set) var wrappedValue: D

    public init(_ keyPath: KeyPath<Dependencies, D>) {
        wrappedValue = Dependencies.common[keyPath: keyPath]
    }
}
