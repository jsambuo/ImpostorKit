import SwiftSyntax

public struct MockGenerator {
    
    public static func generateMock(for protocolName: String) -> ExprSyntax {
        let mockString = generateMockString(for: protocolName)
        let syntax = ExprSyntax(stringLiteral:
        """
        {
            \(mockString)
            return Mock\(protocolName)()
        }()
        """)
        return syntax
//        let syntax = DeclSyntax(stringLiteral: mock)
//        return [syntax]
    }

    // Generate a mock class for a specified protocol
    public static func generateMockString(for protocolName: String) -> String {
        let identifier = TokenSyntax.identifier("Mock\(protocolName)")
        
        // Create the class declaration syntax
        let classDecl = makeClassDeclSyntax(identifier: identifier, protocolName: protocolName)
        
        // Convert the syntax node to a Swift source string
        let sourceCode = classDecl.description
        return sourceCode
    }

    // Helper function to create a class declaration syntax node
    private static func makeClassDeclSyntax(identifier: TokenSyntax, protocolName: String) -> ClassDeclSyntax {
        let classKeyword = TokenSyntax.keyword(.struct,
                                               trailingTrivia: .spaces(1))
        let inheritanceClause = makeInheritanceClause(protocolName: protocolName)

        // Class modifiers (e.g., public)
        let modifiers = DeclModifierListSyntax([
            //DeclModifierSyntax(name: TokenSyntax.keyword(.public, trailingTrivia: .spaces(1)))
        ])

        // Create the class declaration
        let classDecl = ClassDeclSyntax(modifiers: modifiers,
                                        classKeyword: classKeyword,
                                        name: identifier,
                                        inheritanceClause: inheritanceClause,
                                        memberBlock: makeMemberBlock())

        return classDecl
    }

    // Helper function to create an inheritance clause
    private static func makeInheritanceClause(protocolName: String) -> InheritanceClauseSyntax {
        let colon = TokenSyntax.colonToken(trailingTrivia: .spaces(1))
        
        // Inherited types
        let inheritedTypes = InheritedTypeListSyntax([
            InheritedTypeSyntax(type: IdentifierTypeSyntax(name: .identifier(protocolName)))
        ])

        let inheritanceClause = InheritanceClauseSyntax(colon: colon,
                                                        inheritedTypes: inheritedTypes)

        return inheritanceClause
    }

    // Helper function to create a member declaration block
    private static func makeMemberBlock() -> MemberBlockSyntax {
        let leftBrace = TokenSyntax.leftBraceToken(trailingTrivia: .spaces(1))
        let rightBrace = TokenSyntax.rightBraceToken(trailingTrivia: .spaces(1))
        
//        let modifiers = DeclModifierListSyntax([
//            DeclModifierSyntax(name: TokenSyntax.keyword(.public, trailingTrivia: .spaces(1)))
//        ])
//        let attributes = AttributeListSyntax([
//        ])
        let body = CodeBlockItemListSyntax([
//            CodeBlockItemSyntax(item: .stmt(.)))
        ])
        let members = MemberBlockItemListSyntax([
//            MemberBlockItemSyntax(decl: MemberDeclSyntax)
            MemberBlockItemSyntax(decl: FunctionDeclSyntax(name: .identifier("aoeu", leadingTrivia: .spaces(1)),
                                                           signature: FunctionSignatureSyntax(parameterClause: FunctionParameterClauseSyntax(parameters: [])),
                                                           body: CodeBlockSyntax(statements: body),
                                                           trailingTrivia: .spaces(1))),
        ]) // Adjust here to add actual member declarations

        let memberDeclBlock = MemberBlockSyntax(leftBrace: leftBrace,
                                                    members: members, 
                                                rightBrace: rightBrace)

        return memberDeclBlock
    }
}
