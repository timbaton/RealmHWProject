//
//  MainScreenOutput.swift
//  TestRealm
//
//  Created by Тимур Бадретдинов on 16/03/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

protocol MainScreenOutput {
    
    func onCreateFolderClicked()
    
    func getAllFiles(curDirectory: String) -> [String]
}
