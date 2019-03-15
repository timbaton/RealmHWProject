//
//  DBManager.swift
//  TestRealm
//
//  Created by Ильдар Залялов on 25/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation
import RealmSwift

protocol DBManager {
    
    func save(user: House)
    
    func obtainHouses() -> [House]
    
    func removeObject(object: Object)
    
    func clearAll()
}

class DBManagerImpl: DBManager {
    
    fileprivate lazy var mainRealm: Realm = try! Realm(configuration: .defaultConfiguration)
    
    func clearAll() {
        
        try! mainRealm.write {
            mainRealm.deleteAll()
        }
    }
    
    func save(user: House) {
        
       try! mainRealm.write {
            
            mainRealm.add(user)
        }
    }
    
    func removeObject(object: Object) {
        
        try! mainRealm.write {
            mainRealm.delete(object)
        }
    }
    
    func updateObject(object: Object) {
        
        
    }
    func obtainHouses() -> [House] {
        
        let models = mainRealm.objects(House.self)
        
        return Array(models)
    }
}
