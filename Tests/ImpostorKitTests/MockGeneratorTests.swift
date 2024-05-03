//
//  MockGeneratorTests.swift
//  ImpostorKitTests
//
//  Created by Jimmy Sambuo on 5/2/24.
//

import XCTest
@testable import ImpostorKit
import ImpostorKitMacros

final class MockGeneratorTests: XCTestCase {
    
    
    
    func testBlah() {
        let blah: SampleProtocol = {
            class MockSampleProtocol: SampleProtocol {
                func fetchData() -> String {
                    ""
                }
                
                func calculateValue() -> Int {
                    3
                }
            }
            return MockSampleProtocol()
        }()
        
        XCTAssertEqual(blah.calculateValue(), 3)
    }
    
    func testBlah2() {
        let blah: SampleProtocol = {
            struct MockSampleProtocol: SampleProtocol {
                func fetchData() -> String {
                    ""
                }
                
                func calculateValue() -> Int {
                    4
                }
            }
            return MockSampleProtocol()
        }()
        
        XCTAssertEqual(blah.calculateValue(), 4)
    }
    
    func testaoeu() {
        let blah = MockGenerator.generateMock(for: "SampleProtocol")
        XCTAssertEqual(blah, "public  struct MockSampleProtocol: SampleProtocol{ } ")
    }
    
    func testHHHH() {
        func getChildren<T>(typea: T.Type) -> String {
            let b = NSProtocolFromString("ImpostorKitTests.SampleProtocol")
            let mirror = Mirror(reflecting: typea)
            let a = type(of: typea)
            let subjectType = mirror.subjectType
            return mirror.description
        }
        let blah = getChildren(typea: SampleProtocol.self)
        XCTAssertEqual(blah, "")
    }
}
