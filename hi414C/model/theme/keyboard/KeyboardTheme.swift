//
//  KeyboardTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

struct KeyboardTheme {
    var view: ViewTheme
    var key: Key
    
    struct Key {
        var `default`: ViewTheme
        var decrypted: ViewTheme
        var ABC: ViewTheme
        var BS: ViewTheme
        var CR: ViewTheme
    }
}
