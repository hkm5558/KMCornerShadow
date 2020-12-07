//
//  UIView+KMCornerShadow.swift
//  KMCornerShadow
//
//  Created by KM on 2019/5/10.
//

import UIKit

public extension UIView {
    func km_ApplyShadow() {
        guard let aSuperView = superview else {
            return
        }
        guard let shadow = aSuperView.viewWithTag(shadowTag) as? KMShadowView else {
            createShadowView()
            km_ApplyShadow()
            return
        }
        shadow.updateShadowSetting(targetView: self)
        shadow.updateShadowPath()
    }
    fileprivate var shadowTag: Int {
        return KMShadowView.shadowTag + self.hash
    }
    fileprivate func createShadowView() {
        let view = KMShadowView()
        view.tag = shadowTag
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        view.clipsToBounds = false
        view.backgroundColor = .clear//.white

        superview?.insertSubview(view, belowSubview: self)
        let constraints = [
            NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.5),
            NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -0.5),
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.5),
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -0.5),
            ]
        superview?.addConstraints(constraints)
    }

    func createShadow(cornerRadius: CGFloat, shadowRadius: CGFloat, shadowOpacity: Float, shadowColor: UIColor, shadowOffset: CGSize? = nil) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowColor = shadowColor.cgColor
        if let offset = shadowOffset {
            self.layer.shadowOffset = offset
        }
    }
}

fileprivate class KMShadowView: UIView {
    static var shadowTag: Int = "KMShadowView".hash
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
