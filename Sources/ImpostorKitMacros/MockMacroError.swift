//
//  File.swift
//  
//
//  Created by Jimmy Sambuo on 5/2/24.
//

public enum MockMacroError: Error, CustomStringConvertible {
    case noArgumentsFound
    case secondIssue
    case notAProtocol(String)
    
    public var description: String {
        switch self {
        case .noArgumentsFound:
            return "#mock must have one argument"
        case .secondIssue:
            return "#mock something second issue"
        case .notAProtocol(let type):
            return "Invalid argument: \(type)"
        }
    }
}
