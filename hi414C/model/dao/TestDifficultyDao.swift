//
//  TestDifficultyDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 31.05.2021.
//

struct TestDifficultyDao {
    static var key: String = "414C_TestDifficulty"
    
    public static func store(_ difficulty: TestDifficulty) {
        Dao.store(key: key, content: difficulty)
    }
    
    public static func find() -> TestDifficulty? {
        Dao.find(key: key)
    }
}
