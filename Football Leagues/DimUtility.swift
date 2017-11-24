//
//  DimUtility.swift
//  Football Leagues
//
//  Created by Mohammad Shaker on 11/24/17.
//  Copyright © 2017 Mohammad Shaker. All rights reserved.
//

import UIKit

let ScreenSize: CGRect = UIScreen.main.bounds
let ScreenWidth = ScreenSize.width
let ScreenHeight = ScreenSize.height

class DimUtility {
    
    private static var dimView: UIView! = UIView()
    
    class func setDimViewStyles() {
        dimView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        dimView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    }
    
    class func addDimView() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.rootViewController!.view.addSubview(dimView)
    }
    
    class func removeDimView() {
        dimView.removeFromSuperview()
    }
    
}
