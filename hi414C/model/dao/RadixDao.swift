//
//  RadixDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.05.2021.
//

struct RadixDao {
    static var key: String = "414C_Radix"
    
    public static func store(_ radix: EquationRadix) {
        Dao.store(key: key, content: radix)
    }
    
    public static func find() -> EquationRadix? {
        Dao.find(key: key)
    }
}
