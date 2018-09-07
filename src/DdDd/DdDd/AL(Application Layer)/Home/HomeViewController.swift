//
//  HomeViewController.swift
//  DdDd
//
//  Created by wubaolai on 2018/8/21.
//  Copyright © 2018年 wubaolai. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "推荐"
        // Do any additional setup after loading the view.
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.width.equalTo(100)
        }

        button.rx.tap
            .subscribeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
            let albumListController = AlbumListController.init(collectionViewLayout: UICollectionViewFlowLayout.init())
            albumListController.selectDoneBlock = { [weak albumListController] (albumController, selectedFiles) in
                albumListController?.navigationController?.popViewController(animated: true)
            }
            self?.navigationController?.pushViewController(albumListController, animated: true)
        }).disposed(by: bag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return ThemeManager.instance.statusBarStyle
    }
  
    private lazy var  button: UIButton = {
        let button  = UIButton()
        button.setTitle("照片列表", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        return button
    }()
    
}

