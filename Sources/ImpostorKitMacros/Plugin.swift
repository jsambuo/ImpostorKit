//
//  File.swift
//  
//
//  Created by Jimmy Sambuo on 5/2/24.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct MyMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        MockMacro.self,
    ]
}
