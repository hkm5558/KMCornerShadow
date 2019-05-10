//
//  KMBannerCollectionViewCell.swift
//  KMPageControl_Example
//
//  Created by KM on 2019/5/7.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
class KMBannerCollectionViewCell: UICollectionViewCell {

    lazy var imageView: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFill
        imageV.backgroundColor = .white
//        imageV.backgroundColor = UIColor(red:0.820, green:0.235, blue:0.216, alpha: 1.000)
        imageV.layer.cornerRadius = 8
        imageV.layer.shadowRadius = 3
        imageV.layer.shadowOpacity = 0.7
        imageV.layer.shadowColor = UIColor(red:0.969, green:0.322, blue:0.282, alpha: 1.000).cgColor
        imageV.layer.shadowOffset = .init(width: 0, height: 4)
        return imageV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    func commonInit() {
        initialize_setup()
        initialize_layout()
    }
    func initialize_setup()     {
        contentView.addSubview(imageView)
    }
    func initialize_layout()    {
        let rect = CGRect(x: 20, y: 20, width: UIScreen.main.bounds.width - 40, height: 200 - 40)
        imageView.frame = rect
    }
}

