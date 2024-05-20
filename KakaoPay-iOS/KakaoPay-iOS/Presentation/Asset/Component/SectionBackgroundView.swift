//
//  SectionBackgroundView.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class SectionBackgroundView: UICollectionReusableView {
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        setupStyle()
    }
}

extension SectionBackgroundView {
    private func setupStyle() {
        backgroundColor = .kakaoWhite
        layer.cornerRadius = 16
        layer.masksToBounds = true
    }
}
