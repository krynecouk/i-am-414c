//
//  ThemesSelect.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

import SwiftUI

struct ThemesSelect: View {
    var body: some View {
        Group {
            HelpColorButton("Orange", .orange)
            HelpColorButton("Green", .green)
            HelpColorButton("Blue", .blue)
            HelpColorButton("LightOrange", .light_orange)
            HelpColorButton("LightGreen", .light_green)
            HelpColorButton("LightBlue", .light_blue)
        }
        Group {
            HelpColorButton("Orangina", .orangina)
            HelpColorButton("Forest", .forest)
            HelpColorButton("Ice", .ice)
        }
        Group {
            HelpColorButton("Vintage", .vintage)
            HelpColorButton("Melon", .melon)
            HelpColorButton("Sea", .sea)
            
            HelpColorButton("Sunset", .sunset)
            HelpColorButton("GreenGold", .green_gold)
            HelpColorButton("Pastel", .pastel)
            
            HelpColorButton("BananaSky", .bananaSky)
            HelpColorButton("Swamp", .swamp)
            HelpColorButton("Gray", .gray)
        }
    }
}
