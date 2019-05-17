//
//  ViewController.swift
//  CustomSidebar
//
//  Created by Hardik on 17/05/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import UIKit

class ViewController: SideBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        super.delegate = AppDelegate.share
    }
    
    @IBAction func BtnAction(_ sender:UIButton)
    {
     super.showSideBar()
    }
    
}

