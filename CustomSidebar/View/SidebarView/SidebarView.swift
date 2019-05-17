//
//  SidebarView.swift
//  CustomSidebar
//
//  Created by Hardik on 17/05/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import UIKit


class SidebarView: UIView {
    
    weak var delegat:SidebarViewDelegate?
    
    @IBAction func actionMethodTapGesture()
    {
        print("You tapped")
        UIView.animate(withDuration: 0.25) {
            self.frame.origin.x = -((AppDelegate.share.window?.frame.size.width)!)
        }
    }
    
    func Loadview() -> SidebarView{
        return UINib(nibName:"SidebarView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! SidebarView
    }
    
}

extension SidebarView:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "SideBarCell"
        var cell:SideBarCell? = tableView.dequeueReusableCell(withIdentifier:identifier) as? SideBarCell
        
        if cell == nil{
            let nib:[Any] = Bundle.main.loadNibNamed(identifier, owner: self, options: nil)!
            cell = nib[0] as? SideBarCell
        }
        return cell!
    }
}


@objc protocol SidebarViewDelegate:class{
    func sidebarTappedOnRow(index:Int)
}

