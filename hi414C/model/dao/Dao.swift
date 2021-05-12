//
//  Dao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.05.2021.
//

import Foundation

protocol Dao {
    associatedtype T: Decodable & Encodable
    static var key: String { get }
    static func store(_ content: T)
    static func find() -> T?
}

extension Dao {
    public static func store(_ content: T) {
        if let encoded = try? JSONEncoder().encode(content) {
            UserDefaults.standard.set(encoded, forKey: self.key)
        }
    }
    
    public static func find() -> T? {
        if let stored = UserDefaults.standard.data(forKey: self.key) {
            if let decoded = try? JSONDecoder().decode(T.self, from: stored) {
                return decoded
            }
        }
        return .none
    }
}
