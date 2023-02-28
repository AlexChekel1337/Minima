# Minima

![Version badge](https://img.shields.io/github/v/release/AlexChekel1337/Minima) ![Build status badge](https://img.shields.io/github/actions/workflow/status/AlexChekel1337/Minima/swift.yml)

Minima is a tiny Dependency Injection library intended for small projects.

## Motivation

After working on bigger projects at work I sort of become addicted to Dependency Injection, so I needed something for my own smaller projects. I like the approach SwiftUI's [`@Environment`](https://developer.apple.com/documentation/swiftui/environment) takes, but it is mostly intended for use inside SwiftUI projects. I needed something like this for my smaller UIKit projects, so here it is. I built this as a Swift Package for myself to keep reusing it in other projects I may start later. 

## Usage

Declare your dependencies using an extension in you target:
```swift
import Minima

extension Dependencies {
    private static let someServiceImplementation = SomeServiceImplementation()
    
    var someService: SomeService {
        // Returns the same instance each time injection happens
        Self.someServiceImplementation
    }
    
    var someOtherService: SomeOtherService {
        // Creates new instance each time injection happens
        SomeOtherServiceImplementation()
    }
    
    var integerDependency: Int {
        42
    }
}
```

Then simply inject these dependencies using `@Dependency` wrapper:
```swift
import Minima

class SomeClass {
    @Dependency(\.someService) private var someService
    @Dependency(\.someOtherService) private var someOtherService
    @Dependency(\.integerDependency) private var integerDependency
}
```
