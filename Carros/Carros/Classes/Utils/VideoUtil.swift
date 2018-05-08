//
//  VideoUtil.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/5/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation

class VideoUtil {
    
    var player : AVPlayer?
    var playerViewController : AVPlayerViewController?
    
    // Reproduz o vídeo com um player utilizando uma view como container
    func playFile(_ file: String, view: UIView) {
        
        // Converte o nome do arquivo em NSURL
        let path = Bundle.main.path(forResource: file, ofType: nil)
        
        if(path != nil) {
            let url = URL(fileURLWithPath: path!)
            
            self.playUrl(url, view: view)
        }
    }
    
    // Reproduz o vídeo com um player utilizando uma view como container
    func playUrl(_ url: URL!, view: UIView) {
        // Cria o componente que gerencia o video
        
        if (self.player == nil) {
            self.player = AVPlayer(url: url)
            
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = view.bounds
            
            view.layer.addSublayer(playerLayer)
        }
        
        // Inicia o video
        self.player!.play()
    }
    
    func pause() {
        if let player = player {
            player.pause()
        }
    }
    
    func stop() {
        if let player = player {
            // AVPlayer não possui stop
            player.pause()
        }
    }
    
    // Reproduz o vídeo em tela cheia
    func playFileFullScreen(_ file: String, viewController: UIViewController) {
        // Converte o nome do arquivo em NSURL
        let path = Bundle.main.path(forResource: file, ofType: nil)
        
        if(path != nil) {
            let url = URL(fileURLWithPath: path!)
            
            self.playUrlFullScreen(url, viewController: viewController)
        }
    }
    
    // Reproduz o vídeo em tela cheia
    func playUrlFullScreen(_ url: URL!, viewController: UIViewController) {
        // Cria o controller especializado em reproduzir video
        
        print("playUrlFullScreen url: \(url) ")
        
        if (self.playerViewController == nil) {
            self.player = AVPlayer(url: url)
            self.playerViewController = AVPlayerViewController()
            self.playerViewController!.player = player
            
            viewController.present(self.playerViewController!, animated: true) {
                self.playerViewController!.player!.play()
            }
        }
    }
}
