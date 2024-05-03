//
//  MockMacro.swift
//  ImpostorKit
//
//  Created by Jimmy Sambuo on 5/1/24.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import Foundation

public struct MockMacro: ExpressionMacro {
    public static func expansion(of node: some FreestandingMacroExpansionSyntax,
                                 in context: some MacroExpansionContext) throws -> ExprSyntax {
        guard let argument = node.arguments.first?.expression else {
            throw MockMacroError.noArgumentsFound
        }
        guard let typeName = argument.as(MemberAccessExprSyntax.self)?.base?.as(DeclReferenceExprSyntax.self)?.baseName.text else {
            throw MockMacroError.secondIssue
        }
        
        guard isProtocol(type: typeName) else {
            throw MockMacroError.notAProtocol(typeName)
        }

        let mock = MockGenerator.generateMock(for: typeName)
        return mock
    }

    public static func isProtocol(type: String) -> Bool {
        true
    }
}
