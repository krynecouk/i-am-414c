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
        .dulled: Sound(.dulled),
        .tiny: Sound(.tiny),
        .high: Sound(.high),
        .computing: Sound(.computing)
    ]
    
    var audioPlayer:AVAudioPlayer
    var secondAudioPlayer: AVAudioPlayer
    var type: SoundType
    
    init(_ type: SoundType) {
        self.type = type
        self.audioPlayer = AVAudioPlayer.from(type)
        self.secondAudioPlayer = AVAudioPlayer.from(type)
    }
    
    func play() {
            DispatchQueue.global().async {
                if self.audioPlayer.isPlaying {
                    self.secondAudioPlayer.play()
                } else {
                    self.audioPlayer.play()

                }
            }
    }
    
    func stop() {
            DispatchQueue.global().async {
                self.audioPlayer.stop()
                self.secondAudioPlayer.stop()
            }
    }
    
    public static func of(_ type: SoundType) -> Sound {
        return sounds[type]!
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
