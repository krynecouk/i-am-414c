//
//  HelpModalDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 29.06.2021.
//

struct HelpModalDao {
    static var key: String = "414C_HelpModalClosed"
    
    public static func store(closed: Bool) {
        Dao.store(key: key, content: closed)
    }
    
    public static func find() -> Bool {
        Dao.find(key: key) ?? false
    }
}
