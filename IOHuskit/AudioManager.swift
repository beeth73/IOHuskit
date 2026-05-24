//
//  AudioManager.swift
//  IOHuskit
//
//  Created by Bhushan Ladgaonkar on 24/05/26.
//


import Foundation
import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    
    // We pre-load the players into memory for zero-latency playback!
    private var slapPlayer: AVAudioPlayer?
    private var strokePlayer: AVAudioPlayer?

    private init() {
        preloadSounds()
    }

    private func preloadSounds() {
        // We will look for files named "slap.wav" and "stroke.mp3" in our app bundle
        if let slapURL = Bundle.main.url(forResource: "slap", withExtension: "wav") {
            slapPlayer = try? AVAudioPlayer(contentsOf: slapURL)
            slapPlayer?.prepareToPlay()
        }
        
        if let strokeURL = Bundle.main.url(forResource: "stroke", withExtension: "mp3") {
            strokePlayer = try? AVAudioPlayer(contentsOf: strokeURL)
            strokePlayer?.prepareToPlay()
        }
    }

    func playSlap() {
        guard let player = slapPlayer else { return }
        
        // If the sound is already playing, rewind it to the beginning so you can spam-slap!
        if player.isPlaying {
            player.currentTime = 0
        }
        player.play()
    }

    func playStroke() {
        guard let player = strokePlayer else { return }
        
        // If they stroke again, restart the moan
        if player.isPlaying {
            player.currentTime = 0
        }
        player.play()
    }
}