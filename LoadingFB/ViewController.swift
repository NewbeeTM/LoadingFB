//
//  ViewController.swift
//  LoadingFB
//
//  Created by apple on 2019/12/21.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let addTextLabel: UILabel = {
        let label = UILabel()
        label.text = "NewbeeTM"
        label.font = UIFont.systemFont(ofSize: 88, weight: .regular)
        label.textColor = UIColor(white: 1, alpha: 0.9)     // Mau dam
        label.textAlignment = .center
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "NewbeeTM"
        label.font = UIFont.systemFont(ofSize: 88, weight: .regular)
        label.textColor = UIColor(white: 1, alpha: 0.1)     // Mau nhat
        label.textAlignment = .center
        return label
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override var prefersStatusBarHidden: Bool { return true }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupShimmeringText()
        setupImage()
    }

    // Shimmering Text
    fileprivate func setupShimmeringText() {
        view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        
        view.addSubview(textLabel)
        view.addSubview(addTextLabel)
        textLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        addTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        
        let gradient = CAGradientLayer()
        gradient.frame = textLabel.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0]
        let angle = -60 * CGFloat.pi / 180
        gradient.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        addTextLabel.layer.mask = gradient
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.repeatCount = Float.infinity
        animation.autoreverses = false
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        gradient.add(animation, forKey: "shimmerKey")
    }
    
    // Shimmering Image
    fileprivate func setupImage() {
        let bgImageView = UIImageView(image: #imageLiteral(resourceName: "fb_bg"))
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.frame = view.frame
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "fb"))
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.frame
        
        view.addSubview(imageView)
        view.addSubview(bgImageView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor, UIColor.clear.cgColor,
            UIColor.black.cgColor, UIColor.black.cgColor,
            UIColor.clear.cgColor, UIColor.clear.cgColor
        ]
        gradientLayer.locations = [0, 0.2, 0.4, 0.6, 0.8, 1]
        
        let angle = -60 * CGFloat.pi / 180
        let rotationTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
        gradientLayer.transform = rotationTransform
        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view.frame
        
        bgImageView.layer.mask = gradientLayer
        
        gradientLayer.transform = CATransform3DConcat(gradientLayer.transform, CATransform3DMakeScale(3, 3, 0))
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.repeatCount = Float.infinity
        animation.autoreverses = false
        animation.fromValue = -3.0 * view.frame.width
        animation.toValue = 3.0 * view.frame.width
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        gradientLayer.add(animation, forKey: "shimmerKey")
    }

}

