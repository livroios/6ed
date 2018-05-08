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
    
    @IBOutlet var progress: UIActivityIndicatorView!
    
    @IBOutlet var segmentControl: UISegmentedControl!

    // Array com a sintaxe '?' de objeto opcional no Swift
    var carros: Array<Carro>?
    
    // Tipo do carro
    var tipo = "classicos"
    
    // Se é para fazer cache do banco de dados
    var cache = true

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
        
        // Recupera o tipo salvo nas preferências
        let idx = Prefs.getInt("tipoIdx")
        let s = Prefs.getString("tipoString")
        if let s = s {
            // Como a String é opcional precisamos testar antes
            self.tipo = s
        }
        // Atualiza o índice no segment control
        self.segmentControl.selectedSegmentIndex = idx

        if(Utils.isIpad() && Utils.isPortrait()) {
            print("ipad vert")
            self.buscarCarros()
        }
    }
    
    override func viewDidAppear(_ animated: Bool)  {
        super.viewDidAppear(animated)
    
        // Busca carros
        self.buscarCarros()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Se a variável opcional está inicializada, retorna a quantidade de carros
        return self.carros != nil ? self.carros!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Cria a célula desta linha
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! CarroCell

        let linha = (indexPath as NSIndexPath).row
        
        // Objeto do tipo carro
        let carro = self.carros![linha]

        cell.cellNome.text = carro.nome
        cell.cellDesc.text = carro.desc

        // URL
        cell.cellImg.setUrl(carro.url_foto)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let linha = (indexPath as NSIndexPath).row
        
        let carro = self.carros![linha]

        if(Utils.isIphone()) {
            // Faz a navegação
            let vc = DetalhesCarroViewController()
            vc.carro = carro
            self.navigationController!.pushViewController(vc, animated: true)
        } else {
            // Atualiza os detalhes na direita
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let detalhes = appDelegate.detalhesController!
            detalhes.updateCarro(carro)
        }
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
        
        // Salva o tipo nas preferências
        Prefs.setInt(idx, chave: "tipoIdx")
        Prefs.setString(tipo, chave: "tipoString")

        // Buscar os carros pelo tipo selecionado (classico, esportivo, luxo)
        self.buscarCarros()
    }
    
    @objc func atualizar() {
        // Não faz cache, para forçar o web service
        cache = false

        buscarCarros()
    }
    
    func buscarCarros() {

        self.progress.startAnimating()

        let funcaoRetorno = { (_ carros:Array<Carro>?, error:Error?) -> Void in
            
            if let error = error {
                
                Alerta.alerta("Erro: " + error.localizedDescription, viewController: self)
                
            } else if let carros = carros {

                self.carros = carros
                
                // Atualiza o TableView
                self.tableView!.reloadData()
                
                if(Utils.isIpad() && carros.count > 0) {
                    // Seta o primeiro carro na direita
                    let c = carros[0]
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    let detalhes = appDelegate.detalhesController!
                    detalhes.updateCarro(c)
                }
            }

            self.progress.stopAnimating()
        }

        CarroService.getCarrosByTipo(tipo, cache:self.cache , callback:funcaoRetorno)

        // Faz cache da próxima vez
        cache = true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask  {
        if(Utils.isIphone()) {
            // iPhone: Apenas vertical
            return UIInterfaceOrientationMask.portrait
        } else {
            // iPad: Tudo
            return UIInterfaceOrientationMask.all
        }
    }
}
