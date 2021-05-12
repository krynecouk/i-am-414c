//
//  ASCIIDao.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.05.2021.
//

import Foundation

class ASCIIDao: Dao {
    typealias T = Set<ASCIISymbol>
    static var key: String = "ASCIISymbols"
}
