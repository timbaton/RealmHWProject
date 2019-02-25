
//
//  TestUser.swift
//  TestRealm
//
//  Created by Ильдар Залялов on 25/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit

@objcMembers
class TestUser: NSObject {
    
   dynamic var name = String()
   dynamic var age: Int = 0
    
    override var description: String {
        
        return "\nName - \(name), Age - \(age)"
    }
    
    override class func automaticallyNotifiesObservers(forKey key: String) -> Bool {
        
        if key == "name" {
            return false
        }
        else {
            return super.automaticallyNotifiesObservers(forKey: key)
        }
    }
}
