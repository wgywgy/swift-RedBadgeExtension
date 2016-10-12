//
//  BadgeViewExtension.swift
//  RedBadgeExtension
//
//  Created by wuguanyu on 16/7/4.
//  Copyright © 2016年 dejauu. All rights reserved.
//

import UIKit

private var redDotAssociationKey: UInt8 = 0
private var isBadgeShowedKey: UInt8 = 1
private var badgeColorKey: UInt8 = 2

extension UIView {
    var redDotBadge: UIView! {
        get {
            return objc_getAssociatedObject(self, &redDotAssociationKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &redDotAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var isBadgeShowed: Bool! {
        get {
            return objc_getAssociatedObject(self, &isBadgeShowedKey) as? Bool
        }
        set {
            objc_setAssociatedObject(self, &isBadgeShowedKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var badgeColor: UIColor! {
        get {
            return objc_getAssociatedObject(self, &badgeColorKey) as? UIColor
        }
        set {
            objc_setAssociatedObject(self, &badgeColorKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func initBadgeView() {
        if redDotBadge == nil {
            redDotBadge = UIView()
            redDotBadge.backgroundColor = badgeColor ?? UIColor.red
            redDotBadge.layer.masksToBounds = true
            redDotBadge.isUserInteractionEnabled = false
        }
    }
    
    func showBadge(_ radius: CGFloat = 12, offset: CGPoint = CGPoint(x: -4, y: -4)) {
        initBadgeView()
        redDotBadge.removeFromSuperview()
        self.addSubview(redDotBadge)
        redDotBadge.frame = CGRect(x: offset.x, y: offset.y, width: radius, height: radius)
        redDotBadge.layer.cornerRadius = radius / 2
        isBadgeShowed = true
    }
    
    func hideBadge() {
        redDotBadge.removeFromSuperview()
        isBadgeShowed = false
    }
    
}
