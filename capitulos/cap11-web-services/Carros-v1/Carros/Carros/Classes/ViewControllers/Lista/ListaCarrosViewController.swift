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
    @IBOutlet var progress : UIActivityIndicatorView!
    
    var carros: Array<Carro> = []
    
    // Tipo do carro
    var tipo = "classicos"
    
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
        // Para o scroll começar na posição do TableView
        self.automaticallyAdjustsScrollViewInsets = false;

        // Registra o CarroCell.xib como UITableViewCell da tabela
        let xib = UINib(nibName: "CarroCell", bundle:nil)
        self.tableView.register(xib, forCellReuseIdentifier: "cell")
        
        // Botao Refresh na navigation bar
        let btAtualizar = UIBarButtonItem(title: "Atualizar", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ListaCarrosViewController.atualizar))
        self.navigationItem.rightBarButtonItem = btAtualizar

        // Busca carros
        self.buscarCarros()
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
        
        print("url \(carro.url_foto)")
        cell.cellImg.setUrl(carro.url_foto, cache: true)
        
        // Busca a imagem (problema de performance aqui)
//        let data = NSData(contentsOfURL: NSURL(string: carro.url_foto)!)
//        if(data != nil) {
//            let image = UIImage(data: data!)
//            cell.cellImg.image = image
//        }
        
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
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask  {
        // Apenas vertical
        return UIInterfaceOrientationMask.portrait
    }
    
    @IBAction func alterarTipo(_ sender: UISegmentedControl) {
        let idx = sender.selectedSegmentIndex
        
        switch (idx) {
        case 0:
            self.tipo = "classicos"
        case 1:
            self.tipo = "esportivos"
        default:
            self.tipo = "luxo"
        }

        // Buscar os carros pelo tipo selecionado (classico, esportivo, luxo)
        self.buscarCarros()
    }
    
    func atualizar() {
        buscarCarros()
    }
    
    func buscarCarros() {

        self.progress.startAnimating()

        // Cria a URL e Request
        let http = URLSession.shared
        let url = URL(string:"http://www.livroiphone.com.br/carros/carros_"+tipo+".json")!
        let request = URLRequest(url: url)
        
        // Faz a requisicao HTTP
        let task = http.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            if let error = error {
                // Erro
                Alerta.alerta("Não foi possível consultar os carros: " + error.localizedDescription, viewController: self)
            } else {
                // Recebeu os dados
                if let data = data {
                    // Passa o Data (NSData) para o service fazer o parser
                    self.carros = CarroService.parserJson(data)
                    
                    // Atualiza a interface na UI Thread.
                    DispatchQueue.main.sync(execute: {
                        // Atualiza o TableView
                        self.tableView.reloadData()
                        // Para a animação.
                        self.progress.stopAnimating()
                    })
                }
            }
        })
        task.resume()
    }
}
