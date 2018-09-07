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
        homeVC.tabBarItem.title = "相册"
        let cameraVC = UINavigationController(rootViewController: CameraViewController())
        cameraVC.tabBarItem.title = "相机"
        let mineVC   = UINavigationController(rootViewController: MineViewController())
        mineVC.tabBarItem.title = "我的"
        self.viewControllers = [homeVC, cameraVC, mineVC]
    }
}

