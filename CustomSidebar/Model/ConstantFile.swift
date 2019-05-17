//
//  ConstantFile.swift
//  CustomSidebar
//
//  Created by Hardik on 17/05/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
    static let height = UIScreen.main.bounds.size.height
    static let width = UIScreen.main.bounds.size.width
}
struct SB {
    static let main = UIStoryboard(name: "Main", bundle:nil)
}
struct Segue{
    static let chatVC = "chatVC"
    static let orderVC = "orderVC"
    static let otherVC = "otherVC"
    static let mainVC = "mainVC"
    static let setingVC = "settingVC"
    static let testVC = "testVC"
}
