//
//  SoundRecordUtil.swift
//  HelloMusica
//
//  Created by Ricardo Lecheta on 7/5/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import Foundation
import AVFoundation

class SoundRecordUtil : NSObject, AVAudioRecorderDelegate {
    
    var soundRecorder :AVAudioRecorder?

    // Inicia e para gravação
    func start(_ file: String) -> URL! {
        
        let audioSession = AVAudioSession.sharedInstance()

        do {
            // Inicia a sessão
            try audioSession.setActive(true)
        } catch let error as NSError {
            print("Error \(error)")
            return nil
        }
        
        do {
            // Cria a gravação do som no arquivo especificado
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch let error as NSError {
            print("Error \(error)")
            return nil
        }

        // Cria a URL com o caminho do arquivo para gravação
        let path = NSTemporaryDirectory() + "/" + file
        print("Gravar file: \(path)")
        let url = URL(string: path)!
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000.0,
            AVNumberOfChannelsKey: 1 as NSNumber,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ] as [String : Any]
        
        do {
            // Cria a gravação do som no arquivo especificado
            self.soundRecorder = try AVAudioRecorder(url: url, settings: settings)
        } catch let error as NSError {
            print("Error \(error)")
            return nil
        }
        self.soundRecorder!.delegate = self
        
        // Inicia a gravação
        self.soundRecorder!.prepareToRecord()
        self.soundRecorder!.record()
        
        return url
    }
    
    func stop() {
        // Para a gravação
        self.soundRecorder!.stop()
        let audioSession = AVAudioSession.sharedInstance()
        do {
            // Inicia a sessão
            try audioSession.setActive(false)
        } catch let error as NSError {
            print("Error \(error)")
        }
    }
    
    // Fim da gravação
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Fim da gravação, sucesso \(flag)")
    }
}
