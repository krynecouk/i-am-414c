//
//  FontDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

class FontDao {
    static var key: String = "414C_Font"
    
    public static func store(_ size: FontSize) {
        Dao.store(key: key, content: size)
    }
    
    public static func find() -> FontSize? {
        Dao.find(key: key)
    }
}
