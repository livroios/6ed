//
//  VideoViewController.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/29/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    var carro: Carro?
    
    @IBOutlet var webView : UIWebView!
    
    let videoUtil = VideoUtil()
    
    init() {
        super.init(nibName: "VideoViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(self.carro != nil) {
            let url = self.carro!.url_video.url()
            
            // 1) Vídeo com WebView
            //var request = NSURLRequest(URL:url)
            //self.webView.loadRequest(request)

            //2) Reproduz o vídeo sobre uma view de marcação
            //self.videoUtil.playUrl(url, view: self.webView)
            
            // Local
            //self.videoUtil.playFile("ferrari_ff.mp4", view: self.webView)
            
            // 3) Reproduz o vídeo tem tela cheia
            self.videoUtil.playUrlFullScreen(url, viewController: self)
            
            // 4) Player nativo
            //UIApplication.sharedApplication().openURL(url)
            
            NotificationCenter.default.addObserver(self, selector: #selector(VideoViewController.videoFim), name:NSNotification.Name(rawValue: "MPMoviePlayerPlaybackDidFinishNotification"), object: nil)

            NotificationCenter.default.addObserver(self, selector: #selector(VideoViewController.videoFim), name: NSNotification.Name(rawValue: "MPMoviePlayerDidExitFullscreenNotification"), object: nil)
        }
    }
    
    @objc func videoFim() {
        print("Fim do Vídeo")
        // Vamos aproveitar e fechar este controller porque o vídeo já terminou
        self.navigationController!.popViewController(animated: true)
    }
}
