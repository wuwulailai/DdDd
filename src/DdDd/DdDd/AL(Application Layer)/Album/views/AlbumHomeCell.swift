//
//  AlbumHomeCell.swift
//  FileMail
//
//  Created by wuwulailai on 2017/8/14.
//  Copyright © 2017年 wuwulailai. All rights reserved.
//

import UIKit
import QuartzCore

class AlbumHomeCell: UICollectionViewCell {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    override func awakeFromNib() {
        albumImageView.layer.cornerRadius = 4.0
        albumImageView.clipsToBounds = true
        super.awakeFromNib()
        // Initialization code
    }

}
