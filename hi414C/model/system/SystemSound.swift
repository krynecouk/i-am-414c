//
//  SystemSound.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 08.06.2021.
//

import AudioToolbox

struct SystemSound {
    public static func play(_ type: SystemSoundType) {
        AudioServicesPlaySystemSoundWithCompletion(type.rawValue) {}
    }
}

enum SystemSoundType: UInt32 {
    case click = 1123
    case delete = 1155
    case modifier = 1156
    case simToolkitNegativeACK = 1053
}
