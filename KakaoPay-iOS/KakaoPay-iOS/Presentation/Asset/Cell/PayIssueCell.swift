//
//  PayIssueCell.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class PayIssueCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let imageView = UIImageView()
    private let discriptionLabel = UILabel()
    private let titleLabel = UILabel()
    private let labelStackView = UIStackView()

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

extension PayIssueCell {
    
    //MARK: - Private Method
    
    private func setupStyle() {
        backgroundColor = .kakaoWhite
        makeRounded(radius: 20)
        
        discriptionLabel.do {
            $0.font = .appleSemiBold(size: 14)
            $0.textColor = .kakaoGray600
            $0.textAlignment = .center
        }
        
        titleLabel.do {
            $0.font = .appleSemiBold(size: 15)
            $0.textColor = .kakaoBlack
            $0.textAlignment = .center
        }
        
        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 6
            $0.alignment = .center
        }
    }
    
    private func setupHierarchy() {
        addSubviews( imageView, labelStackView)
        labelStackView.addArrangedSubviews(discriptionLabel, titleLabel)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(20)
            $0.width.height.equalTo(80)
        }
        
        labelStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(12)
        }
    }
    
    //MARK: - Method
    
    func configureCell(_ data: PayIssueModel) {
        imageView.image = data.image
        discriptionLabel.text = data.discription
        titleLabel.text = data.title
    }
}
