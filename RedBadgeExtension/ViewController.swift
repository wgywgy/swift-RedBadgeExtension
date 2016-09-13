//
//  ViewController.swift
//  RedBadgeExtension
//
//  Created by wuguanyu on 16/7/4.
//  Copyright © 2016年 dejauu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let aView: UIView = {
        let aView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        aView.backgroundColor = UIColor.yellowColor()
        aView.badgeColor = UIColor.greenColor()
        aView.showBadge()
        return aView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(aView)
        
        let delayInSeconds = 3.0
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delayInSeconds * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) { [weak self] in
            guard let `self` = self else { return }
            self.aView.hideBadge()
        }
    }
}