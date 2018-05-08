//
//  ListaCarrosViewController.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/11/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class ListaCarrosViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableView : UITableView!
    
    var carros: Array<Carro> = []
    
    init() {
        super.init(nibName: "ListaCarrosViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Título
        self.title = "Carros"
        
        // delegate
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Registra o CarroCell.xib como UITableViewCell da tabela
        let xib = UINib(nibName: "CarroCell", bundle:nil)
        self.tableView.register(xib, forCellReuseIdentifier: "cell")
        
        self.carros = CarroService.getCarros()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Se a variável opcional está inicializada, retorna a quantidade de carros
        return self.carros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Cria a célula desta linha
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! CarroCell
        
        let linha = (indexPath as NSIndexPath).row
        
        // Objeto do tipo carro
        let carro = self.carros[linha]
        
        cell.cellNome.text = carro.nome
        cell.cellDesc.text = carro.desc
        cell.cellImg.image = UIImage(named: carro.url_foto)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let linha = (indexPath as NSIndexPath).row
        
        let carro = self.carros[linha]
        
        //        Alerta.alerta("Selecionou o carro: " + carro.nome, viewController: self)
        
        let vc = DetalhesCarroViewController()
        vc.carro = carro
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    
//    override func supportedInterfaceOrientations() -> Int  {
//        var iPad = Utils.isIpad()
//        if(iPad) {
//            // iPad suporta todas as orientações
//            return Int(UIInterfaceOrientationMask.All.toRaw())
//        } else {
//            // iPhone: apenas vertical
//            return Int(UIInterfaceOrientationMask.Portrait.rawValue)
//        }
//    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask  {
        // Apenas vertical
        return UIInterfaceOrientationMask.portrait
    }
}
