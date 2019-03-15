//
//  MainScreenConf.swift
//  TestRealm
//
//  Created by Тимур Бадретдинов on 16/03/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation
import UIKit

class MainScreenConf: NSObject {
    
        @IBOutlet weak var viewController: UIViewController!
        
        override func awakeFromNib() {
            
            // method for connecting View with Presenter
            configure()
        }
        
        func configure() {
            
            guard let view = viewController as? MainScreenViewController
                else { fatalError()}
            
            let presenter = MainScreenPresenter()
            let data: DBManager = DBManagerImpl()
            let strings = Strings()
            
            // connect view, strings and dataManager to presenter
            presenter.view = view
            presenter.dataManager = data
            presenter.strings = strings
            
            
            // connect presenter to View
            view.presenter = presenter
            view.strings = strings
        }
}
