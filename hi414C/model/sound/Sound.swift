//
//  Sound.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 08.06.2021.
//

import AVFoundation

class Sound {
    private static let sounds: [SoundType: Sound] = [
        .click: Sound(.click),
        .modifier: Sound(.modifier),
        .delete: Sound(.delete),
        .error: Sound(.error),
        .tiny_click: Sound(.tiny_click),
        .discover: Sound(.discover),
        .computing: Sound(.computing, infinite: true)
    ]
    
    let primary: AVAudioPlayer
    let secondary: AVAudioPlayer
    let type: SoundType
    
    init(_ type: SoundType, infinite: Bool = false) {
        self.type = type
        self.primary = AVAudioPlayer.from(type)
        self.secondary = AVAudioPlayer.from(type)
        if infinite {
            self.primary.numberOfLoops = -1
            self.secondary.numberOfLoops = -1
        }
    }
    
    func play() {
        DispatchQueue.global().async {
            if self.primary.isPlaying {
                self.secondary.play()
            } else {
                self.primary.play()
            }
        }
    }
    
    func stop() {
        DispatchQueue.global().async {
            self.primary.stop()
            self.secondary.stop()
        }
    }
    
    public static func of(_ type: SoundType) -> Sound {
        return sounds[type]!
    }
    
    public static func of(_ type: SoundType?) -> Sound? {
        if let type = type {
            return Sound.of(type)
        }
        return .none
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
    case error = "dulled_toggle.wav"
    case tiny_click = "tiny_click.wav"
    case discover = "higher_toggle.wav"
    case computing = "computing.wav"
}
