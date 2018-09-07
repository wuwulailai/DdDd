//
//  DashboardViewController.swift
//  DdDd
//
//  Created by wubaolai on 2018/8/21.
//  Copyright © 2018年 wubaolai. All rights reserved.
//

import UIKit
import RxSwift

public class DashboardViewController : UITabBarController {
    private let bag = DisposeBag()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC   = UINavigationController(rootViewController: HomeViewController())
        let cameraVC = UINavigationController(rootViewController: CameraViewController())
        let mineVC   = UINavigationController(rootViewController: MineViewController())
        
        self.viewControllers = [homeVC, cameraVC, mineVC]
    }
}

