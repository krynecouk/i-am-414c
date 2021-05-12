//
//  ASCIIDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.05.2021.
//

class ASCIIDao {
    static var key: String = "ASCIISymbols"
    
    public static func store(_ symbols: Set<ASCIISymbol>) {
        Dao.store(key: key, content: symbols)
    }
    
    public static func find() -> Set<ASCIISymbol>? {
        Dao.find(key: key)
    }
}
