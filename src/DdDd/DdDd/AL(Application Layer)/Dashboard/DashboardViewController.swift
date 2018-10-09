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
        homeVC.tabBarItem.image = #imageLiteral(resourceName: "mine_tab_icon")
        
        let funVC    = UINavigationController(rootViewController: FunViewController())
        funVC.tabBarItem.title = "有趣"
        funVC.tabBarItem.image = #imageLiteral(resourceName: "mine_tab_icon")
        
        let mineVC   = UINavigationController(rootViewController: MineViewController())
        mineVC.tabBarItem.title = "我的"
        mineVC.tabBarItem.image = #imageLiteral(resourceName: "mine_tab_icon")
        self.viewControllers = [homeVC, funVC, mineVC]
    }
}

