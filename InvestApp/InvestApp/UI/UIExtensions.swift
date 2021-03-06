//
//  UIExtensions.swift
//  InvestApp
//
//  Created by Victor tavares on 08/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {

    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

extension UIFont {

    public class func fontDIN(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "DINPro", size: fontSize)!
    }
    
    public class func fontAwesome(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "Font Awesome 5 Free", size: fontSize)!
    }
}

extension UIColor {
    
    public class func appPrimaryColor() -> UIColor {
        return UIColor(red: 204/255, green: 40/255, blue: 15/255, alpha: 1.0)
    }
}

