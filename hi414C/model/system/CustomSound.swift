//
//  CustomSound.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 08.06.2021.
//

import AVFoundation

class CustomSound {
    static var audioPlayer:AVAudioPlayer?
    
    static func play(_ type: CustomSoundType) {
        guard let soundURL = Bundle.main.url(forResource: type.rawValue, withExtension: nil) else {
            fatalError("Unable to find \(type.rawValue) in bundle")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}

enum CustomSoundType: String {
    case foo = "FOO"
}
