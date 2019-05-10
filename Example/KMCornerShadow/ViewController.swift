//
//  ViewController.swift
//  KMCornerShadow
//
//  Created by km on 05/10/2019.
//  Copyright (c) 2019 km. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var bannerView: KMBannerView = {
        let banner = KMBannerView(frame: .init(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 220))
        return banner
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(bannerView)
        let colors = [UIColor(red:0.125, green:0.451, blue:0.984, alpha: 1.000),
                      UIColor(red:0.992, green:0.729, blue:0.173, alpha: 1.000),
                      UIColor(red:0.231, green:0.831, blue:0.561, alpha: 1.000),
                      UIColor(red:0.992, green:0.494, blue:0.325, alpha: 1.000)]
        bannerView.banners = (colors).map({ (color) in
            return KMBannerView.Banner(image: nil, url: nil, color: color)
        })
        bannerView.pageControl.activeSize = CGSize(width: 30, height: 10)
        bannerView.pageControl.inactiveSize = CGSize(width: 10, height: 10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

