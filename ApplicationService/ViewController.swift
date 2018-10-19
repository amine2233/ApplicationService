//
//  ViewController.swift
//  ApplicationService
//
//  Created by BENSALA on 19/10/2018.
//  Copyright © 2018 BENSALA. All rights reserved.
//
// https://github.com/AliSoftware/MagicSwiftNoStrings
// https://github.com/AliSoftware/awesome-swift
// https://github.com/AliSoftware/Xcode-Build-Settings-Reference
// https://github.com/AliSoftware/KeyPathObserver
// 

import UIKit

class ViewController: PluggableController {

    override func services() -> [ControllerService] {
        return [
            ChatControllerService(),
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

class ChatControllerService: ControllerService, HasDependencies {
    
    private lazy var service: AuthenticationWorkerType = dependencies.resolveWorker()
    
    func viewDidLoad(_ controller: UIViewController) {
        print("viewDidLoad ChatControllerService")
    }
}

extension ChatControllerService {
    
    func viewWillAppear(_ controller: UIViewController) {
        print("ChatControllerService viewWillAppear")
    }
    
    func viewWillDisappear(_ controller: UIViewController) {
        print("ChatControllerService viewWillDisappear")
    }
}
