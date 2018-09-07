//
//  NoDataOverlayerView.swift
//  FileMail
//
//  Created by wuwulailai on 2017/5/27.
//  Copyright © 2017年 wuwulailai. All rights reserved.
//

import UIKit
import Log
class NoDataOverlayerView: OverlayerView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!

    static func createWith(image: UIImage?, message: String?) -> NoDataOverlayerView? {
        
        let overlayerView: NoDataOverlayerView? = Bundle.main.loadNibNamed("NoDataOverlayerView", owner: nil , options: nil)?.first as? NoDataOverlayerView
        overlayerView?.setup(image: image, message: message)
        if (overlayerView == nil) {
            Log.debug("NoDataOverlayerView 创建失败")
        }
        return overlayerView
    }
    
    func setup(image: UIImage?, message: String?) -> Void {
        self.imageView.image = image
        self.descriptionLabel.text = message
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Log.debug("\(String(describing: self.imageView.image)),\(String(describing: self.descriptionLabel.text))")
    }
}
