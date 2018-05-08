//
//  SobreViewController.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/11/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

let URL_SOBRE = "http://www.livroiphone.com.br/carros/sobre.htm"

class SobreViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet var webView : UIWebView!
    @IBOutlet var progress : UIActivityIndicatorView!
    
    init() {
        super.init(nibName: "SobreViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Título
        self.title = "Sobre"
        
        // Inicia a animação do activity indicator
        self.progress.startAnimating()
        
        // Carrega a URL no WebView
        let url = URL(string: URL_SOBRE)!
        
        //        let path = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        //        println(path)
        //        let url = NSURL(fileURLWithPath:path!)!
        
        let request = URLRequest(url:url,cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 0)
        self.webView.loadRequest(request)
        
        // delegate
        self.webView.delegate = self
        
        print("go")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        progress.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask  {
        // Apenas vertical
        return UIInterfaceOrientationMask.portrait
    }
    
    
    
}
