//
//  Utils.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/5/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import UIKit

class Utils {
    
    class func isIphone() -> Bool {
        let iPhone = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
        return iPhone
    }
    
    class func isIpad() -> Bool {
        let iPad = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
        return iPad
    }
    
    class func isLandscape() -> Bool {
        let orientation = UIDevice.current.orientation
        let landscape = orientation == UIDeviceOrientation.landscapeLeft || orientation == UIDeviceOrientation.landscapeRight
        return landscape
    }
    
    class func isPortrait() -> Bool {
        let orientation = UIDevice.current.orientation
        let portrait = orientation == UIDeviceOrientation.portrait
        return portrait
    }
}
