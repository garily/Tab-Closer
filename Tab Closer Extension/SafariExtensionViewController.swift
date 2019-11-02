//
//  SafariExtensionViewController.swift
//  Tab Closer Extension
//
//  Created by Ruoyu Li on 10/31/19.
//  Copyright © 2019 Ruoyu Li. All rights reserved.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:200, height:124)
        return shared
    }()
    
    @IBAction func closeTabsToLeft(_ sender: NSButton) {
        NSLog("closeTabsToLeft() triggered");
        closeTabs(closeToLeft: true)
        dismissPopover()
    }
    
    @IBAction func closeTabsToRight(_ sender: NSButton) {
        NSLog("closeTabsToRight() triggered");
        closeTabs(closeToLeft: false)
        dismissPopover()
    }
    
    func closeTabs(closeToLeft: Bool) {
        SFSafariApplication.getActiveWindow { (activeWindow: SFSafariWindow?) in
            if let window = activeWindow {
                window.getActiveTab { (activeTab: SFSafariTab?) in
                    if let _activeTab = activeTab {
                        window.getAllTabs { (allTabs: [SFSafariTab]) in
                            for tab in (closeToLeft ? allTabs : allTabs.reversed()) {
                                if tab == _activeTab {
                                    break;
                                }
                                tab.close();
                            }
                        }
                    }
                    else {
                        NSLog("No active tab found, aborting attempt to close tabs")
                        return
                    }
                }
            }
        }
    }

}
