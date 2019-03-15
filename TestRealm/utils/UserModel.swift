//
//  UserModel.swift
//  TestRealm
//
//  Created by Ильдар Залялов on 25/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class UserModel: Object {
    
    dynamic var id = 0
    dynamic var name = String()
    dynamic var age = 0

}
