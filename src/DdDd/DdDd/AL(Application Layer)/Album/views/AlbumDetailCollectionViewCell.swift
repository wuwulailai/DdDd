//
//  AlbumDetailCollectionViewCell.swift
//  FileMail
//
//  Created by wuwulailai on 2017/5/13.
//  Copyright © 2017年 wuwulailai. All rights reserved.
//

import UIKit
import Photos
import Log

class AlbumDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var disableView: UIView!
    
    var localIdentify: String?
    
    var onClick: ((_ cell: AlbumDetailCollectionViewCell, _ button: UIButton) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func selectAction(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
        Log.debug("selectAction")
        if nil != onClick {
            onClick! (self, sender)
        }
    }
}
