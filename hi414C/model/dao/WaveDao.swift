//
//  WaveDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

class WaveDao {
    static var key: String = "414C_Wave"
    
    public static func store(_ hint: Bool) {
        Dao.store(key: key, content: hint)
    }
    
    public static func find() -> Bool? {
        Dao.find(key: key)
    }
}
