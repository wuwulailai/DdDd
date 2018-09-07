//
//  OverlayerView.swift
//  FileMail
//
//  Created by wuwulailai on 2017/5/27.
//  Copyright © 2017年 wuwulailai. All rights reserved.
//

import UIKit
import Log

class OverlayerView: UIView {

    var showFrame: CGRect?

    func showOn(view: UIView) -> Void {
        if self.showFrame != nil {
            self.frame = self.showFrame!
        } else {
            self.frame = view.bounds
        }
        self.isOpaque = false
        
        
        DispatchQueue.main.async {
            view.addSubview(self)
        }
//        self.alpha = 0.1
//        UIView.animate(withDuration: 0.3) {
//            self.alpha = 1.0
//        }
        Log.debug("showOn: \(self)")
    }
    
    func dismiss() -> Void {
        DispatchQueue.main.async {
            Log.debug("dismiss: \(self)")
            self.removeFromSuperview()
        }
    }

}
