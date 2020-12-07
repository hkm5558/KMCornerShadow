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
        let colors = [
            UIColor(red:42/255.0, green:122/255.0, blue:255/255.0, alpha: 1.000),
            UIColor(red:45/255.0, green:213/255.0, blue:140/255.0, alpha: 1.000),
            UIColor(red:255/255.0, green:91/255.0, blue:40/255.0, alpha: 1.000),
            UIColor(red:255/255.0, green:186/255.0, blue:0/255.0, alpha: 1.000)
        ]
        bannerView.banners = (colors).map({ (color) in
            return KMBannerView.Banner(image: nil, url: nil, color: color)
        })
        bannerView.pageControl.activeSize = CGSize(width: 30, height: 10)
        bannerView.pageControl.inactiveSize = CGSize(width: 10, height: 10)
        bannerView.pageControl.activeColor = UIColor(red:42/255.0, green:122/255.0, blue:255/255.0, alpha: 1.000)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

