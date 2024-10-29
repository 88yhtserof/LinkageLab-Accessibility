//
//  GradientTopBackgroundView.swift
//  IssueCard
//
//  Created by 링키지랩 on 10/29/24.
//

import UIKit

final class GradientTopBackgroundView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureGradient()
    }
}

private extension GradientTopBackgroundView {
    func configureGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        let colors = [UIColor.white.withAlphaComponent(0.1).cgColor, UIColor.white.cgColor]
        gradientLayer.colors = colors
        gradientLayer.locations = [0.25, 0.45]
        layer.addSublayer(gradientLayer)
    }
}
