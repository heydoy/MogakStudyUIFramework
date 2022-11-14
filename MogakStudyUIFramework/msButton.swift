//
//  msButtons.swift
//  MogakStudyUIFramework
//
//  Created by Doy Kim on 2022/11/09.
//

import UIKit


public protocol ButtonStatusColor {
    var borderColor: CGColor { get }
    var backgroundColor: UIColor { get }
    var titleColor: UIColor { get }
}
public struct InactiveButton: ButtonStatusColor {
    public init() {}
    public var borderColor: CGColor = UIColor.msColor.gray004.cgColor
    public var backgroundColor: UIColor = .msColor.white
    public var titleColor: UIColor = .msColor.black
}
public struct FillButton: ButtonStatusColor {
    public init() {}
    public var borderColor: CGColor = UIColor.msColor.brandGreen.cgColor
    public var backgroundColor: UIColor = .msColor.brandGreen
    public var titleColor: UIColor = .white
}
public struct OutlineButton: ButtonStatusColor {
    public init() {}
    public var borderColor: CGColor = UIColor.msColor.brandGreen.cgColor
    public var backgroundColor: UIColor = UIColor.msColor.white
    public var titleColor: UIColor = .msColor.brandGreen
}
public struct CancelButton: ButtonStatusColor {
    public init() {}
    public var borderColor: CGColor = UIColor.msColor.gray002.cgColor
    public var backgroundColor: UIColor = .msColor.gray002
    public var titleColor: UIColor = .msColor.black
}
public struct DisableButton: ButtonStatusColor {
    public init() {}
    public var borderColor: CGColor = UIColor.msColor.gray006.cgColor
    public var backgroundColor: UIColor = .msColor.gray006
    public var titleColor: UIColor = .msColor.gray003
}


public enum ButtonHeight: CGFloat {
    case h48 = 48
    case h40 = 40
    case h32_Icon = 32
}

public enum ButtonIcon {
    case noIcon
    case xIcon
}

open class msButton: UIButton {
    // MARK: - Initialiser
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required public init(status: ButtonStatusColor) {
        super.init(frame: CGRect.zero)
        
        backgroundColor = status.backgroundColor
        layer.borderWidth = 1
        layer.borderColor = status.borderColor
        layer.cornerRadius = 8
        clipsToBounds = true
        setTitleColor(status.titleColor, for: .normal)

    }
    
}
