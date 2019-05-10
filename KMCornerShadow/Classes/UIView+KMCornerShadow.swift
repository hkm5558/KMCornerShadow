//
//  UIView+KMCornerShadow.swift
//  KMCornerShadow
//
//  Created by KM on 2019/5/10.
//

import UIKit

public extension UIView {
    public func km_ApplyCornerShadow() {
        guard let aSuperView = superview else {
            return
        }
        guard let shadow = aSuperView.viewWithTag(KMCornerShadowView.shadowViewTag) as? KMCornerShadowView else {
            createShadowView()
            km_ApplyCornerShadow()
            return
        }
        shadow.updateShadowSetting(targetView: self)
        shadow.updateShadowPath()
    }
    fileprivate func createShadowView() {
        let view = KMCornerShadowView()
        view.tag = KMCornerShadowView.shadowViewTag
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.clipsToBounds = false
        view.backgroundColor = .white
        
        superview?.insertSubview(view, belowSubview: self)
        let constraints = [
            NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            ]
        superview?.addConstraints(constraints)
    }
}
fileprivate class KMCornerShadowView: UIView {
    static var shadowViewTag: Int = 9527
    var offset: CGSize = .zero
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShadowPath()
    }
    func updateShadowPath() {
        let size = bounds.size
        guard size.equalTo(.zero) == false else {
            return
        }
        let path = UIBezierPath(rect: CGRect(x: offset.width, y: offset.height, width: size.width, height: size.height)).cgPath
        layer.shadowPath = path
    }
    func updateShadowSetting(targetView: UIView) {
        offset = targetView.layer.shadowOffset
        layer.cornerRadius = targetView.layer.cornerRadius
        layer.shadowRadius = targetView.layer.shadowRadius
        layer.shadowOpacity = targetView.layer.shadowOpacity
        layer.shadowColor = targetView.layer.shadowColor
    }
}
