//
//  DetalhesCarroViewController.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/11/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class DetalhesCarroViewController: UIViewController, UISplitViewControllerDelegate {

    @IBOutlet var img : DownloadImageView!
    @IBOutlet var tDesc : UITextView!
    
    @IBOutlet var btMapa : UIButton!
    @IBOutlet var btVideo : UIButton!
    
    var carro: Carro?
    
    init() {
        super.init(nibName: "DetalhesCarroViewController", bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let c = carro {
            updateCarro(c)

            // Insere o botão na navigation bar
            let btDeletar = UIBarButtonItem(title: "Deletar", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetalhesCarroViewController.onClickDeletar))
            self.navigationItem.rightBarButtonItem = btDeletar
        }
    }

    // Copia os valores do carro para a view
    func updateCarro(_ c: Carro) {

        self.carro = c

        self.title = c.nome

        self.tDesc.text = c.desc;

        self.img.setUrl(c.url_foto)
    }

    // Controlar a troca de orientação (vertical/horizontal)
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        if(Utils.isIphone()) {
            if(size.width > size.height) {
            print("Horizontal")
            tDesc.isHidden = true
            btMapa.isHidden = true
            btVideo.isHidden = true

            // Horizontal: Esconde tudo
            if((self.tabBarController) != nil) {
                self.tabBarController!.tabBar.isHidden = true
            }
            self.navigationController!.navigationBar.isHidden = true
        } else {
            print("Vertical")
            
            // Vertical: Mostra tudo
            if((self.tabBarController) != nil) {
                self.tabBarController!.tabBar.isHidden = false
            }
            self.navigationController!.navigationBar.isHidden = false
            
            tDesc.isHidden = false
            btMapa.isHidden = false
            btVideo.isHidden = false
        }
        
        // Atualiza o status da action bar
        self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    @objc func onClickDeletar() {
        let alert = UIAlertController(title: "Confirma?", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: {(alert: UIAlertAction) in self.deletar()}))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.destructive, handler: {(alert: UIAlertAction) in }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func deletar() {
        let db = CarroDB()
        db.delete(self.carro!)
        Alerta.alerta("Carro excluído com sucesso.", viewController: self, action:
            { (UIAlertAction) -> Void in
                
                self.goBack()
                
        })
        
    }
    
    func goBack() {
        // Fecha esta tela
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func visualizarMapa(_ bt: UIButton) {
        let vc = MapViewController()
        vc.carro = self.carro
        if(Utils.isIphone()) {
            // Abre o view controller pelo navigation
            self.navigationController!.pushViewController(vc, animated: true)
        } else {
            print("Mostra no popover")
            
            PopoverUtil.show(self,viewController:vc, sourceView: bt, width:600, height:500)
        }
    }
    
    @IBAction func visualizarVideo(_ bt: UIButton) {
//        let vc = VideoViewController()
//        vc.carro = self.carro
//        self.navigationController.pushViewController(vc, animated: true)

        let videoUtil = VideoUtil()
        let url = self.carro!.url_video.url()
        print("video")
        print(url)
        videoUtil.playUrlFullScreen(url, viewController: self)
    }
    
    // SplitView
    func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewControllerDisplayMode) {
        
        let vertical = displayMode == UISplitViewControllerDisplayMode.primaryHidden;
        
        if(vertical) {
            // Insere o botão na navigation bar
            let btPopover = UIBarButtonItem(title: "Lista", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DetalhesCarroViewController.onClickPopover))
            self.navigationItem.leftBarButtonItem = btPopover
        } else {
            self.navigationItem.leftBarButtonItem = nil
        }
        
    }
    
    @IBAction func onClickPopover(_ bt: UIButton) {
        // Mostra o view controller no popover
        let bt = self.navigationItem.leftBarButtonItem!
        let vc = ListaCarrosViewController()
        // Mostra o popover ancorado no botão da navigation bar
        PopoverUtil.show(self, viewController: vc, source: bt, width: 400, height: 800)

    }
}
















