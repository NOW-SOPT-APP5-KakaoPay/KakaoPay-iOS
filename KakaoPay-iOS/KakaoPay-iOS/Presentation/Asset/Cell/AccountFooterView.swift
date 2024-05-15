//
//  AccountFooterView.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

import SnapKit
import Then

final class AccountFooterView: UICollectionReusableView {

    // MARK: - UIComponent

    private let pointMoneyLabel = UILabel()
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

extension AccountFooterView {
    private func setupStyle() {
        backgroundColor = .kakaoWhite
        makeRounded(radius: 15)
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        pointMoneyLabel.do {
            $0.text = "포인트·머니"
            $0.font = .appleSemiBold(size: 20)
            $0.textColor = .kakaoGray600
            $0.textAlignment = .center
        }
        
        moneyLabel.do {
            $0.text = "0원"
            $0.font = .appleSemiBold(size: 16)
            $0.textColor = .kakaoGray600
            $0.textAlignment = .center
        }
        
        arrowButton.do {
            $0.setImage(UIImage(resource: .icArrowGray600), for: .normal)
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            pointMoneyLabel,
            moneyLabel,
            arrowButton
        )
    }
    
    private func setupLayout() {
        pointMoneyLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        moneyLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(arrowButton.snp.leading)
        }
        
        arrowButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(14)
        }
    }
}
