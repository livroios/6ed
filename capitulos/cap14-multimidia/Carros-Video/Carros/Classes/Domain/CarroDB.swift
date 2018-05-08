//
//  CarroDB.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/1/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import Foundation

class CarroDB {
    
    var db: SQLiteHelper
    
    init() {
        self.db = SQLiteHelper(database:"carros.sqlite")
    }
    
    // Cria a tabela carros (apenas se não existe)
    func createTables() {
        let sql = "create table if not exists carro (_id integer primary key autoincrement,nome text, desc text, url_foto text,url_info text,url_video text, latitude text,longitude text, tipo text);"
        
        let result = db.execSql(sql)
        print("createTables executado com sucesso \(result)")
    }
    
    func getCarrosByTipo(_ tipo: String) -> Array<Carro> {
        var carros : Array<Carro> = []
        
        let stmt = db.query("SELECT * FROM carro where tipo = ?",params:[tipo as AnyObject])
        
        while (db.nextRow(stmt)) {
            
            let c = Carro()
            
            c.id           = db.getInt(stmt, index: 0)
            c.nome         = db.getString(stmt, index: 1)
            c.desc         = db.getString(stmt, index: 2)
            c.url_foto     = db.getString(stmt, index: 3)
            c.url_info     = db.getString(stmt, index: 4)
            c.url_video    = db.getString(stmt, index: 5)
            c.latitude     = db.getString(stmt, index: 6)
            c.longitude    = db.getString(stmt, index: 7)
            c.tipo         = db.getString(stmt, index: 8)
            
            carros.append(c)
        }
        
        db.closeStatement(stmt)
        
        return carros
    }
    
    // Salva um novo carro ou atualiza se já existe id
    func save(_ carro: Carro) {
        
        if(carro.id == 0) {
            // Insert
            let sql = "insert or replace into carro (nome,desc,url_foto,url_info,url_video,latitude, longitude, tipo) VALUES (?,?,?,?,?,?,?,?);"
            
            let params = [carro.nome,carro.desc,carro.url_foto,carro.url_info,carro.url_video,carro.latitude, carro.longitude, carro.tipo]
            
            let id = db.execSql(sql, params:params as Array<AnyObject>?)
            
            print("Carro \(carro.nome), id: \(id) salvo com sucesso.")
            
            carro.id = Int(id)
            
        } else {
            // Update
            let sql = "update carro set nome=?,desc=?,url_foto=?,url_info=?,url_video=?,latitude=?, longitude=?, tipo=?) where _id=? VALUES (?,?,?,?,?,?,?,?,?);"
            
            let params = [carro.nome,carro.desc,carro.url_foto,carro.url_info,carro.url_video,carro.latitude, carro.longitude,carro.id] as [Any]
            
            let id = db.execSql(sql, params:params as Array<AnyObject>)
            
            print("Carro \(carro.nome), id: \(id)/\(carro.id) atualizado com sucesso.")
        }
    }
    
    // Deleta o carro
    func delete(_ carro: Carro) {
        let sql = "delete from carro where _id = ?"
        
        let result = db.execSql(sql, params: [carro.id as AnyObject])
        print("delete carro com sucesso \(result)")
    }
    
    // Deleta todos os carros do tipo informado
    func deleteCarrosTipo(_ tipo: String) {
        let sql = "delete from carro where tipo = ?"
        let result = db.execSql(sql, params: [tipo as AnyObject])
        print("delete carros com sucesso \(result)")
    }
    
    func close() {
        // Fecha o banco de dados
        self.db.close()
    }
}
