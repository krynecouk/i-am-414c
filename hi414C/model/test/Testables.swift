//
//  Testables.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.03.2021.
//

protocol Testables {
    associatedtype Key: Hashable
    associatedtype Value: Testable
    
    static var tests: [Key:[Value]] { get }
    static subscript(key: Key) -> [Value]? { get }
    static subscript(key: Key, level: TestLevel) -> [Value]? { get }
    static subscript(key: Key, type: TestType) -> [Value]? { get }
    static subscript(key: Key, type: TestType, level: TestLevel) -> [Value]? { get }
}

extension Testables {
    static subscript(key: Key) -> [Value]? {
        self.tests[key]
    }
    
    static subscript(key: Key, level: TestLevel) -> [Value]? {
        self.tests[key]?.filter { $0.level == level }
    }
    
    static subscript(key: Key, type: TestType) -> [Value]? {
        self.tests[key]?.filter { $0.type == type }
    }
    
    static subscript(key: Key, type: TestType, level: TestLevel) -> [Value]? {
        self.tests[key]?.filter { $0.type == type && $0.level == level }
    }
}
