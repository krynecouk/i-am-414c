//
//  GameOverDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 05.06.2021.
//

struct GameOverDao {
    static var key: String = "414C_GameOver"
    
    public static func store(_ finished: Bool) {
        Dao.store(key: key, content: finished)
    }
    
    public static func find() -> Bool? {
        Dao.find(key: key)
    }
}
