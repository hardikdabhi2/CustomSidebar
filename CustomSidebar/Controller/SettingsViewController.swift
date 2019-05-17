//
//  SettingsViewController.swift
//  CustomSidebar
//
//  Created by Hardik on 17/05/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import UIKit

class SettingsViewController: SideBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.delegate = AppDelegate.share
        // Do any additional setup after loading the view.
    }
    @IBAction func BtnAction(_ sender:UIButton)
    {
        super.showSideBar()
    }
    @IBAction func btnActionTest(_ sender:UIButton)
    {
        let testVC = SB.main.instantiateViewController(withIdentifier:Segue.testVC)
        self.navigationController?.pushViewController(testVC, animated: true)
    }
    
}
