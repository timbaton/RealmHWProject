//
//  House.swift
//  TestRealm
//
//  Created by Ильдар Залялов on 25/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class House: Object {
    
    var users = List<UserModel>()
}
