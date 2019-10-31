//
//  AudioManager.swift
//  ibanez
//
//  Created by Iván Ibáñez Torres on 31/10/2019.
//  Copyright © 2019 Iván Ibáñez Torres. All rights reserved.
//

import Foundation
import AVFoundation

class AudioManager {
    
    var audioPlayer : AVAudioPlayer?
    static let shared = AudioManager()
    
    func playAudio(audioUrl: String){
        let sound = URL(string: audioUrl)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound!)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopAudio(){
        audioPlayer?.stop()
    }
}

