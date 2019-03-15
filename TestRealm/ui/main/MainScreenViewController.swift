//
//  ViewController.swift
//  TestRealm
//
//  Created by Ильдар Залялов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import UIKit
import RealmSwift

class MainScreenViewController: UIViewController, MainScreenInput {

    
    var presenter: MainScreenOutput!
    var strings: Strings!
    var curDirect = ""
    let user = UserModel()
    let dbManager: DBManager = DBManagerImpl()
    var notificatioToken: NotificationToken?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAllPackages()
    }
    
    func getAllPackages() {
        var files = presenter.getAllFiles(curDirectory: curDirect)
        print(files)
    }
   
    @IBAction func itemPressed(_ sender: Any) {
        //create directory
        
        presenter.onCreateFolderClicked()
//    
    }
    
    // MARK: - notifications
    
    /// отображение алерт диалога
    ///
    /// - Parameter text: текст сообщения
    func showMessage(text: String) {
        let alert = UIAlertController(title: strings.alert_title, message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: strings.alert_ok, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

