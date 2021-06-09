//
//  CustomSound.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 08.06.2021.
//

import AVFoundation

class CustomSound {
    static var audioPlayer:AVAudioPlayer?
    
    static let sounds: [CustomSoundType:URL] = [
        //.error:URL.from(.error),
        .click:URL.from(.click),
        .modifier:URL.from(.modifier),
        .delete: URL.from(.delete)
    ]
    
    static func play(_ type: CustomSoundType) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sounds[type]!)
            audioPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension URL {
    static func from(_ type: CustomSoundType) -> URL {
        Bundle.main.url(forResource: type.rawValue, withExtension: nil)!
    }
}

enum CustomSoundType: String {
    //case error = "error.aif"
    case click = "heartbeat_one_toggle.wav"
    case modifier = "heartbeat_two_toggle.wav"
    case delete = "heartbeat_three_toggle.wav"
}
