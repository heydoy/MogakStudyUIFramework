//
//  msColor.swift
//  MogakStudyUIFramework
//
//  Created by Doy Kim on 2022/11/09.
//

import Foundation
import UIKit

extension UIColor {
    
    public struct msColor {
        // Black & White
        public static let white = UIColor(hexString: "#FFFFFF")!
        public static let black = UIColor(hexString: "#333333")!
        // Brand Color
        public static let brandGreen = UIColor(hexString: "#49DC92")!
        public static let brandWhiteGreen = UIColor(hexString: "#CDF4E1")!
        public static let brandYellowGreen = UIColor(hexString: "#B2EB61")!
        
        // Grayscale
        public static let gray001 = UIColor(hexString: "#F7F7F7")!
        public static let gray002 = UIColor(hexString: "#EFEFEF")!
        public static let gray003 = UIColor(hexString: "#E2E2E2")!
        public static let gray004 = UIColor(hexString: "#D1D1D1")!
        public static let gray005 = UIColor(hexString: "#BDBDBD")!
        public static let gray006 = UIColor(hexString: "#AAAAAA")!
        public static let gray007 = UIColor(hexString: "#888888")!
        
        // SystemColor
        public static let systemSuccess = UIColor(hexString: "#628FE5")!
        public static let systemError = UIColor(hexString: "#E9666B")!
        public static let systemFocus = UIColor(hexString: "#333333")!
    }
}

// 16진수를 UIColor
extension UIColor {
    convenience init(hex16: UInt16) {
            let alpha = CGFloat((hex16 >> 12) & 0xf) / 0xf
            let red = CGFloat((hex16 >> 8) & 0xf) / 0xf
            let green = CGFloat((hex16 >> 4) & 0xf) / 0xf
            let blue = CGFloat(hex16 & 0xf) / 0xf
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
        convenience init (hex32: UInt32) {
            let alpha = CGFloat((hex32 >> 24) & 0xff) / 0xff
            let red = CGFloat((hex32 >> 16) & 0xff) / 0xff
            let green = CGFloat((hex32 >> 8) & 0xff) / 0xff
            let blue = CGFloat(hex32 & 0xff) / 0xff
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
        convenience init?(hexString: String) {
            if !hexString.hasPrefix("#") {
                return nil
            }
            var hexStr = hexString
            hexStr.remove(at: hexStr.startIndex)
            switch hexStr.count {
            case 3:
                hexStr = "f" + hexStr
                fallthrough
            case 4:
                guard let hex16 = UInt16(hexStr, radix: 16) else {
                    return nil
                }
                self.init(hex16: hex16)
            case 6:
                hexStr = "ff" + hexStr
                fallthrough
            case 8:
                guard let hex32 = UInt32(hexStr, radix: 16) else {
                    return nil
                }
                self.init(hex32: hex32)
            default:
                return nil
            }
        }
}
