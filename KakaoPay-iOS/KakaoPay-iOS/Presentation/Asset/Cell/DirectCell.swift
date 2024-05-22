//
//  DirectCell.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class DirectCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let iconImageView = UIImageView()
    private let menuLabel = UILabel()
    private let arrowImageView = UIImageView()

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

extension DirectCell {
    
    //MARK: - Private Method
    
    private func setupStyle() {
        backgroundColor = .kakaoWhite
        
        menuLabel.do {
            $0.font = .appleSemiBold(size: 14)
            $0.textColor = .kakaoBlack
            $0.textAlignment = .center
        }
        
        arrowImageView.do {
            $0.image = .icArrowGray500
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            iconImageView,
            menuLabel,
            arrowImageView
        )
    }
    
    private func setupLayout() {
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
        }
        
        menuLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImageView.snp.trailing).offset(3)
        }
    
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(7)
        }
    }
    
    //MARK: - Method
    
    func configureCell(_ data: DirectModel) {
        iconImageView.image = data.iconImage
        menuLabel.text = data.menu
    }
}
