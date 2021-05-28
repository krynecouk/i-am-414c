//
//  TestDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.05.2021.
//

struct TestDao {
    static var key: String = "414C_TestLevel"
    
    public static func store(_ level: Int) {
        Dao.store(key: key, content: level)
    }
    
    public static func find() -> Int? {
        Dao.find(key: key)
    }
}
