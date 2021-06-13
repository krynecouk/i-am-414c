//
//  CmdDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.06.2021.
//

struct CmdDao {
    static var key: String = "414C_Cmd"
    
    public static func store(_ cmd: String) {
        Dao.store(key: key, content: cmd)
    }
    
    public static func find() -> String? {
        Dao.find(key: key)
    }
    
    public static func remove() {
        Dao<String>.remove(key: key)
    }
}
