//
//  ViewController.swift
//  TestRealm
//
//  Created by Ильдар Залялов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let user = TestUser()
    let dbManager: DBManager = DBManagerImpl()
    var notificatioToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //KVC
    
        user.addObserver(self, forKeyPath: #keyPath(TestUser.name), options: [.new, .old], context: nil)
        
        user.willChangeValue(forKey: #keyPath(TestUser.name))
        user.setValue("Lews", forKey: "name")
        
        
//        dbManager.clearAll()
        
        let model = UserModel()
        model.name = "Ruslan"
        model.age = 18
        model.id = 1
        
        let house = House()
        house.users.append(model)
        
        dbManager.save(user: house)
        
        notificatioToken = model.observe({ (change) in
            
            switch change {
            case .change(let changes):
                print("Changes: \(changes)")
            case .deleted:
                print("Deleted")
                
            default: break
            }
        })
        
        let realm = try! Realm(configuration: .defaultConfiguration)
        
        try! realm.write {
            model.name = "Egor"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let models = dbManager.obtainHouses()
        
        print("\(models)")
        
        let model = UserModel()
        model.name = "Ruslan1234"
        model.age = 18
        model.id = 2
        
        let house = House()
        house.users.append(model)
        
        dbManager.save(user: house)
        
//        if let lastModel = models.last {
//            dbManager.removeObject(object: lastModel)
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let models = dbManager.obtainHouses()
        
        print("\(models)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        user.removeObserver(self, forKeyPath: #keyPath(TestUser.name))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard keyPath == #keyPath(TestUser.name) else { return }
        
        print("Old value: \(change![.oldKey])")
        print("New value: \(change![.newKey])")
    }
    
    @IBAction func itemPressed(_ sender: Any) {
        
        user.didChangeValue(forKey: #keyPath(TestUser.name))
    }
}

