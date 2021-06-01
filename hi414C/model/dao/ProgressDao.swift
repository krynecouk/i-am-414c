//
//  ProgressDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.06.2021.
//

struct ProgressDao {
    static var key: String = "414C_Progress"
    
    public static func store(_ progress: Progress) {
        Dao.store(key: key, content: progress)
    }
    
    public static func find() -> Progress? {
        Dao.find(key: key)
    }
}

enum Progress: String, Storable {
    case hex, gameOver
}
