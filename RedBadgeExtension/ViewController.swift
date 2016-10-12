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
        aView.backgroundColor = UIColor.yellow
        aView.badgeColor = UIColor.red
        aView.showBadge()
        return aView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(aView)
        
        let delayInSeconds = 3.0
        let delayTime = DispatchTime.now() + Double(Int64(delayInSeconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) { [weak self] in
            guard let `self` = self else { return }
            self.aView.hideBadge()
        }
    }
}
