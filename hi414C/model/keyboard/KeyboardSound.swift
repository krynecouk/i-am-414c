//
//  KeyboardSound.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 08.06.2021.
//

import AudioToolbox

struct KeyboardSound {
    public static func play(_ type: KeyboardSoundType) {
        AudioServicesPlaySystemSoundWithCompletion(type.rawValue) {}
    }
}

enum KeyboardSoundType: UInt32 {
    case click = 1123
    case delete = 1155
    case modifier = 1156
}
