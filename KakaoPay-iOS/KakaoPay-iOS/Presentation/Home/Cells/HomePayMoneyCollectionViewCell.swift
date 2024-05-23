//
//  HomePayMoneyCollectionViewCell.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import UIKit

import SnapKit
import Then

final class HomePayMoneyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let image = UIImageView()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension HomePayMoneyCollectionViewCell {
    func setStyle() {
        image.image = .imgFirst
    }
    
    func setHierarchy() {
        contentView.addSubview(image)
    }
    
    func setLayout() {
        image.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}
