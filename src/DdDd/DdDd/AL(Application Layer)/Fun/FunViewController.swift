//
//  CameraViewController.swift
//  DdDd
//
//  Created by wubaolai on 2018/8/21.
//  Copyright © 2018年 wubaolai. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class FunViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "有趣"
        // Do any additional setup after loading the view.
        setupSubView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return ThemeManager.instance.statusBarStyle
    }
 
    // MARK: - set UIView
    private func setupSubView() {
        view.addSubview(renderView)
        renderView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate lazy var renderView: UIView = {
        let renderView = UIView()
        return renderView
    }()
    

}

// MARK: - UINavigationControllerDelegate
extension FunViewController: UINavigationControllerDelegate {
}

