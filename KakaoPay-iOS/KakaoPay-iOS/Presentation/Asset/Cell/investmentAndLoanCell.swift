//
//  investmentAndLoanCell.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

import SnapKit
import Then

final class investmentAndLoanCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let innerView = UIView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let discriptionLabel = UILabel()
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
    
    override func layoutSubviews() {
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}

// MARK: - Extensions

extension investmentAndLoanCell {
    
    //MARK: - Private Method
    
    private func setupStyle() {
        backgroundColor = .kakaoWhite
        makeRounded(radius: 15)
        
        innerView.do {
            $0.backgroundColor = .kakaoGray200
            $0.makeRounded(radius: 10)
        }
        
        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 6
            $0.alignment = .leading
        }
        
        titleLabel.do {
            $0.font = .appleSemiBold(size: 16)
            $0.textColor = .kakaoBlack
            $0.textAlignment = .center
        }
        
        discriptionLabel.do {
            $0.font = .appleRegular(size: 14)
            $0.textColor = .kakaoGray600
            $0.textAlignment = .center
        }
    }
    
    private func setupHierarchy() {
        addSubview(innerView)
        innerView.addSubviews(imageView, labelStackView)
        labelStackView.addArrangedSubviews(titleLabel, discriptionLabel)
    }
    
    private func setupLayout() {
        innerView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview().inset(8)
        }
        
        imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        
        labelStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(imageView.snp.trailing).offset(11)
        }
    }
    
    //MARK: - Method
    
    func configureCell(_ data: InvestmentAndLoanModel) {
        imageView.image = data.image
        titleLabel.text = data.title
        discriptionLabel.text = data.discription
    }

    func configureCellWithHightlightText(data: InvestmentAndLoanModel, hightlightText: String) {
        imageView.image = data.image
        titleLabel.text = data.title
        titleLabel.asColor(targetString: hightlightText, color: .kakaoOrange)
        discriptionLabel.text = data.discription
    }
}
