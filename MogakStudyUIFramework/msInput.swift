//
//  msInput.swift
//  MogakStudyUIFramework
//
//  Created by Doy Kim on 2022/11/13.
//

import UIKit

public protocol InputStatusColor {
    var borderColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var titleColor: UIColor { get }
}
public struct InactiveInput: InputStatusColor {
    public init() {}
    public var borderColor: UIColor = UIColor.msColor.gray003
    public var backgroundColor: UIColor = .msColor.white
    public var titleColor: UIColor = .msColor.gray007
}
public struct FocusInput: InputStatusColor {
    public init() {}
    public var borderColor: UIColor = UIColor.msColor.systemFocus
    public var backgroundColor: UIColor = .msColor.white
    public var titleColor: UIColor = .msColor.black
}
public struct ActiveInput: InputStatusColor {
    public init() {}
    public var borderColor: UIColor = UIColor.msColor.gray003
    public var backgroundColor: UIColor = .msColor.white
    public var titleColor: UIColor = .msColor.black
}
public struct DisableInput: InputStatusColor {
    public init() {}
    public var borderColor: UIColor = UIColor.msColor.gray003
    public var backgroundColor: UIColor = .msColor.gray003
    public var titleColor: UIColor = .msColor.gray007
}

open class msInput: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required public init(status: InputStatusColor) {
        super.init(frame: CGRect.zero)
        
        backgroundColor = status.backgroundColor
        textColor = status.titleColor
        layer.cornerRadius = 4
        addBottomBorder(color: status.borderColor)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

extension UITextField {
    internal func addBottomBorder(color: UIColor) {
        let height: CGFloat = 1.0
        let bottomBorderView = UIView()
        bottomBorderView.backgroundColor = color
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomBorderView)
        NSLayoutConstraint.activate(
            [
                bottomBorderView.leadingAnchor.constraint(equalTo: leadingAnchor),
                bottomBorderView.trailingAnchor.constraint(equalTo: trailingAnchor),
                bottomBorderView.bottomAnchor.constraint(equalTo: bottomAnchor),
                bottomBorderView.heightAnchor.constraint(equalToConstant: height)
            ]
        )
    }
}
