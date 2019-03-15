//
//  MainScreenPresenter.swift
//  TestRealm
//
//  Created by Тимур Бадретдинов on 16/03/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

class MainScreenPresenter: MainScreenOutput {
    
    var view: MainScreenInput!
    var strings: Strings!
    var dataManager: DBManager!
    
    let documentsPath1 = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
    
    func getAllFiles(curDirectory: String) -> [String] {
        var allFiles: [String] = []
        //get all directories
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let path = documentsPath1.appendingPathComponent("data")
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: path!, includingPropertiesForKeys: nil)
            print(fileURLs)
            
            // process files
            for files in fileURLs {
                allFiles.append(files.lastPathComponent)
            }
//            allFiles = fileURLs
        } catch {
            print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
        }
        return allFiles
    }
    
    func onCreateFolderClicked() {
        view.showMessage(text: "clicked!")
        
        let documentDirectoryFileUrl = documentsPath1.appendingPathComponent("data")?.appendingPathComponent("hello")
        
                let logsPath = documentsPath1.appendingPathComponent("data")
                let logsPath2 = documentsPath1.appendingPathComponent("set")
                do
                {
                    try FileManager.default.createDirectory(atPath: documentDirectoryFileUrl!.path, withIntermediateDirectories: true, attributes: nil)
                    try FileManager.default.createDirectory(atPath: logsPath2!.path, withIntermediateDirectories: true, attributes: nil)
                    let dirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true) as? [String]
                    print(dirs?[0])
        
                }
                catch let error as NSError
                {
                    NSLog("Unable to create directory \(error.debugDescription)")
                }
    }
}
