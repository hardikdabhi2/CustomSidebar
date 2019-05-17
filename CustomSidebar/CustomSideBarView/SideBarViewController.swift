//
//  SideBarViewController.swift
//  CustomSidebar
//
//  Created by Hardik on 17/05/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import UIKit

let delay = 0.2


protocol SideBarViewDelegate:class{
    func sidebarMenuTapped(index:Int)
}

struct Menu {
    var titleName:String?
    var imageName:String?
}

class SideBarViewController: UIViewController,UIGestureRecognizerDelegate{
    var mainView = UIView()
    var arrayMenu = [Menu]()
    weak var delegate:SideBarViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(wasTapped(sender:)))
            tap.numberOfTapsRequired = 1 // Default value
            tap.delegate = self
         self.mainView.isUserInteractionEnabled = true
         self.mainView.addGestureRecognizer(tap)
         self.fillTheArray()
        self.createSideBar()
    }
    
    private func fillTheArray(){
        self.arrayMenu = [
                            Menu.init(titleName: "Home", imageName:"arrow"),
                            Menu.init(titleName: "Order", imageName:"back"),
                            Menu.init(titleName: "Setting", imageName:"searchSong"),
                            Menu.init(titleName: "Chat", imageName:"shuffle"),
                            Menu.init(titleName: "Other", imageName:"searchSong"),
                            ]
    }
    
    
    //MARK: - Gesture Recognizer Delegate
    
    @objc func wasTapped(sender: UITapGestureRecognizer) {
        print("tapped")
        self.hideSidebar()
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if(touch.view == self.mainView){
            return true
        }
        else{
            return false
        }
    }
    
    private func createSideBar(){
        
        self.mainView.frame = CGRect(x:-(Constant.width), y:0, width:Constant.width, height: Constant.height)
        self.mainView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        let menuBarView = UIView()
        menuBarView.frame = CGRect(x:0, y: 0, width:Constant.width - 100, height:Constant.height)
        menuBarView.backgroundColor = UIColor.white
        
        //Create first top view
        
        let menuViewWidth = menuBarView.frame.size.width
        
        let viewHeader = UIView()
        viewHeader.frame = CGRect(x: 0, y: 0, width:menuViewWidth, height:150)
        viewHeader.backgroundColor = UIColor.orange
        menuBarView.addSubview(viewHeader)
        
        //Create Menu list view with scrollview
        
        //First Add Scrollview
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y:150, width:menuViewWidth, height:Constant.height-150)
        menuBarView.addSubview(scrollView)
        
        //Create view With All Buttons and all things
        
        for i in 0..<self.arrayMenu.count{
            let view1 = UIView()
            view1.frame = CGRect(x: 0, y:(i*45), width:Int(menuViewWidth), height: 45)
            view1.backgroundColor = UIColor.gray
            let iconImage = UIImageView()
            iconImage.frame = CGRect(x: 8, y:10, width: 25, height: 25)
            iconImage.image = UIImage(named:self.arrayMenu[i].imageName!)
            let labelTitle = UILabel()
            labelTitle.frame = CGRect(x:38, y: 10, width:menuViewWidth - 38, height: 25)
            labelTitle.text = self.arrayMenu[i].titleName!
            
            let button = UIButton()
            button.frame = view1.bounds
            button.tag = i
            button.addTarget(self, action: #selector(butonTap), for:.touchUpInside)
            view1.addSubview(button)
            
            view1.addSubview(iconImage)
            view1.addSubview(labelTitle)
            
            scrollView.addSubview(view1)
        }
        
        self.mainView.addSubview(menuBarView)
        self.view.addSubview(self.mainView)
    }
    
    @objc func butonTap(sender:UIButton){
        self.hideSidebar();
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            if(self.delegate != nil){
                self.delegate?.sidebarMenuTapped(index:sender.tag)
            }
        }
    }
    
    func showSideBar(){
        UIView.animate(withDuration: delay, animations: {
            self.mainView.frame = CGRect(x:0, y:0, width:Constant.width, height: Constant.height)
        })
    }
    func hideSidebar(){
        UIView.animate(withDuration: delay, animations: {
            self.mainView.frame = CGRect(x:-(Constant.width), y:0, width:Constant.width, height: Constant.height)
        })
    }
    
}
