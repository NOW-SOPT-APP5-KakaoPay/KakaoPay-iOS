//
//  MenuCollectionViewCell.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import UIKit

import SnapKit
import Then

final class MenuCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties

    
    // MARK: - UI Components
    
    private let menuImage = UIImageView()
    private let menuLabel = UILabel()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension MenuCollectionViewCell {
    func setupStyle() {
        menuLabel.do {
            $0.font = .appleRegular(size: 13)
            $0.textColor = .kakaoGray600
        }
    }
    
    func setupHierarchy() {
        
    }
    
    func setupLayout() {
        
    }
}

extension MenuCollectionViewCell {
    func bindData(forModel : ) {
        menuImage.image =
    }
}
