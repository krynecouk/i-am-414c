//
//  ASCIITestSettings.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.03.2021.
//

struct ASCIITestSettings {
    var symbol: SymbolSettings
    var test: TestSettings
    
    struct SymbolSettings {
        var figlet: FigletSettings
    }
    
    struct TestSettings {
        var active: Active
        var passive: Passive
        
        struct Active {
            var figlet: FigletSettings
        }
        
        struct Passive {
            var figlet: FigletSettings
        }
    
    }

}
