//
//  Dao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.05.2021.
//

import Foundation

struct Dao<T: Decodable & Encodable> {
    
    public static func store(key: String, content: T) {
        if let encoded = try? JSONEncoder().encode(content) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    public static func find(key: String) -> T? {
        if let stored = UserDefaults.standard.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode(T.self, from: stored) {
                return decoded
            }
        }
        return .none
    }
}
