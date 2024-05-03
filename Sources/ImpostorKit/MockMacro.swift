//
//  MockMacro.swift
//  ImpostorKit
//
//  Created by Jimmy Sambuo on 5/1/24.
//

import SwiftSyntax

/// A macro that produces a mock implementation of a given protocol.
/// For example, `#mock(CustomDebugStringConvertible.self)` will return some implementation that conforms to `CustomDebugStringConvertible`.
@freestanding(expression)
public macro mock<T>(_: T.Type) -> T = #externalMacro(module: "ImpostorKitMacros", type: "MockMacro")
