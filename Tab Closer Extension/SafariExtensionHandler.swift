//
//  SafariExtensionHandler.swift
//  Tab Closer Extension
//
//  Created by Ruoyu Li on 10/31/19.
//  Copyright © 2019 Ruoyu Li. All rights reserved.
//

import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    override func popoverViewController() -> SFSafariExtensionViewController {
        return SafariExtensionViewController.shared
    }

}
