//
//  SafariExtensionViewController.swift
//  Tab Closer Extension
//
//  Created by Gary Li on 10/31/19.
//  Copyright © 2019 Ruoyu Li. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:320, height:240)
        return shared
    }()

}
