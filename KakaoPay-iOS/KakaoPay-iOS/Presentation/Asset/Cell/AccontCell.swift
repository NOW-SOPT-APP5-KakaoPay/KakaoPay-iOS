//
//  AccontCell.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//


import UIKit

import SnapKit
import Then

final class AccontCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let bankImage = UIImageView()
    private let accountNickName = UILabel()
    private let showMoney = UILabel()
    private let labelStackView = UIStackView()
    private let transferButton = UIButton()
    
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

extension AccontCell {
    
    //MARK: - Private Method

    private func setupStyle() {
        backgroundColor = .kakaoWhite
        
        bankImage.do {
            $0.image = .imgKakaobankLogo
        }
        
        accountNickName.do {
            $0.text = "도훈 카뱅"
            $0.font = .appleRegular(size: 13)
            $0.textColor = .kakaoGray600
            $0.textAlignment = .center
        }
        
        showMoney.do {
            $0.text = "잔액 보기"
            $0.font = .appleSemiBold(size: 16)
            $0.textColor = .kakaoBlack
            $0.textAlignment = .center
        }
        
        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 4
            $0.alignment = .leading
        }
        
        transferButton.do {
            $0.setTitle("송금", for: .normal)
            $0.setTitleColor(.kakaoBlack, for: .normal)
            $0.backgroundColor = .kakaoGray400
            $0.makeRounded(radius: 15)
            $0.titleLabel?.font = .appleSemiBold(size: 14)
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            bankImage,
            labelStackView,
            transferButton
        )
        
        labelStackView.addArrangedSubviews(accountNickName, showMoney)
    }
    
    private func setupLayout() {
        bankImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(36)
        }
        
        labelStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(bankImage.snp.trailing).offset(12)
        }
        
        transferButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(50)
            $0.height.equalTo(32)
        }
    }
}
