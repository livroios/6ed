//
//  ViewController.swift
//  HelloVideo
//
//  Created by Ricardo Lecheta on 7/5/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
                            
    @IBOutlet var videoView : UIView!
    
    let videoUtil = VideoUtil()
    
    init() {
        super.init(nibName: "ViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func play() {
        // Reproduz o vídeo (vamos deixar a URL fixa para testar)
        print("play")
        
        let url = URL(string:"http://www.livroiphone.com.br/carros/esportivos/ferrari_ff.mp4")

        // File
//        self.videoUtil.playUrl(url, view: videoView)

        // Full screen
        self.videoUtil.playUrlFullScreen(url, viewController: self)
        
        // Notificações para monitorar o fim do player
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.videoFim),
            name: NSNotification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"), object: nil)
        
    }

    @objc func videoFim() {
        print("Fim do Vídeo")
    }
    
    @IBAction func pause() {
        print("pause")
        self.videoUtil.pause()
    }
    
    @IBAction func stop() {
        print("stop")
        self.videoUtil.stop()
    }


}

