//
// Minima.swift
// Minima
//
// Created by Alexandr Chekel on 27.02.2023.
// Copyright © 2023 Alexandr Chekel. All rights reserved.
//

import Foundation

/// Dependency store. Extend it to provide a list of dependencies available to inject
/// using `@Dependency` or `@LazyDependency` property wrappers.
/// ```
/// extension Dependencies {
///     var integerDependency: Int { ... }
///     var settingsService: SettingsService { ... }
/// }
public struct Dependencies {
    public static let common = Self()
}

/// Property wrapper that performs injection of specified dependency upon initialization
/// of parent object.
@propertyWrapper
public struct Dependency<D> {
    public private(set) var wrappedValue: D

    public init(_ keyPath: KeyPath<Dependencies, D>) {
        wrappedValue = Dependencies.common[keyPath: keyPath]
    }
}

/// Property wrapper that performs injection of specified dependency upon first access.
@propertyWrapper
public struct LazyDependency<D> {
    public lazy var wrappedValue: D = resolver()

    private let resolver: () -> D

    public init(_ keyPath: KeyPath<Dependencies, D>) {
        resolver = {
            Dependencies.common[keyPath: keyPath]
        }
    }
}
