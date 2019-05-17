//
//  ChatViewController.swift
//  CustomSidebar
//
//  Created by Hardik on 17/05/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import UIKit

class ChatViewController: SideBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.delegate = AppDelegate.share
        // Do any additional setup after loading the view.
    }
    @IBAction func BtnAction(_ sender:UIButton)
    {
        super.showSideBar()
    }
}
