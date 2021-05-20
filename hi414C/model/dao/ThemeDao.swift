//
//  ThemeDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

class ThemeDao {
    static var key: String = "414C_Theme"
    
    public static func store(_ type: ThemeType) {
        Dao.store(key: key, content: type)
    }
    
    public static func find() -> ThemeType? {
        Dao.find(key: key)
    }
}
