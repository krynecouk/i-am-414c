//
//  GraphDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.05.2021.
//

struct GraphDao {
    static var key: String = "414C_Graph"
    
    public static func store(_ type: GraphType) {
        Dao.store(key: key, content: type)
    }
    
    public static func find() -> GraphType? {
        Dao.find(key: key)
    }
}
