//
//  Sound.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 08.06.2021.
//

import AVFoundation

class Sound {
    static var audioPlayer:AVAudioPlayer?
    
    static let sounds: [SoundType: URL] = [
        .click: URL.from(.click),
        .modifier: URL.from(.modifier),
        .delete: URL.from(.delete),
        .dulled: URL.from(.dulled),
        .tiny: URL.from(.tiny),
        .high: URL.from(.high),
        .computing: URL.from(.computing)
    ]
    
    static func play(_ type: SoundType) {
            DispatchQueue.global().async {
                audioPlayer = AVAudioPlayer.from(type)
                audioPlayer?.play()
            }
    }
}

extension AVAudioPlayer {
    static func from(_ type: SoundType) -> AVAudioPlayer {
        try! AVAudioPlayer(contentsOf: URL.from(type))
    }
}

extension URL {
    static func from(_ type: SoundType) -> URL {
        Bundle.main.url(forResource: type.rawValue, withExtension: nil)!
    }
}

enum SoundType: String {
    case click = "heartbeat_one_toggle.wav"
    case modifier = "heartbeat_two_toggle.wav"
    case delete = "heartbeat_three_toggle.wav"
    case dulled = "dulled_toggle.wav"
    case tiny = "tiny_click.wav"
    case high = "higher_toggle.wav"
    case computing = "computing.wav"
}
