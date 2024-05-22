//
//  TotalMoneyCell.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

import SnapKit
import Then

final class TotalMoneyCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let moneyLabel = UILabel()
    private let arrowButton = UIButton()
    
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

extension TotalMoneyCell {
    
    //MARK: - Private Method

    private func setupStyle() {
        backgroundColor = .kakaoYellow
        makeRounded(radius: 15)
        
        titleLabel.do {
            $0.text = StringLiterals.Asset.totalMoney
            $0.font = .appleSemiBold(size: 20)
            $0.textColor = .kakaoBlack
            $0.textAlignment = .center
        }
        
        subTitleLabel.do {
            $0.text = "보험부터 부동산까지"
            $0.font = .appleRegular(size: 14)
            $0.textColor = .kakaoBlack
            $0.textAlignment = .center
        }
        
        moneyLabel.do {
            $0.font = .appleSemiBold(size: 18)
            $0.textColor = .kakaoBlack
            $0.textAlignment = .center
        }
        
        arrowButton.do {
            $0.setImage(UIImage(resource: .icArrowBlack), for: .normal)
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            titleLabel,
            subTitleLabel,
            moneyLabel,
            arrowButton
        )
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(25)
            $0.leading.equalToSuperview().inset(20)
        }
        
        moneyLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(arrowButton.snp.leading)
        }
        
        arrowButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    //MARK: - Method
    
    func bindData(_ data: GetBalanceData) {
        moneyLabel.text = data.balance + "원"
    }
}
