//
//  PaymentView.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/15.
//

import UIKit

import SnapKit
import Then

final class PaymentView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let tabBar = UIImageView()
    private let customView = BarcodePaymentView()
    
    private let hanaCardImageView = UIImageView()
    private let addCardImageView = UIImageView()
    private let kakaoPayCardImageView = UIImageView()
    private let kakaoBankCardImageView = UIImageView()
    private let shinhanCardImageView = UIImageView()
    private let kakaoPayCardLabel = UILabel()
    private let cardStackView = UIStackView()
    
    private let closeButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension PaymentView {
    func setupStyle() {
        self.backgroundColor = .kakaoYellow
        tabBar.do {
            $0.image = .imgTabbarPay
        }
        
        customView.do {
            $0.layer.cornerRadius = 25
            $0.backgroundColor = .kakaoWhite
        }
        
        cardStackView.do {
            $0.axis = .horizontal
            $0.spacing = 20
            $0.alignment = .center
        }

        hanaCardImageView.image = .imgHanabank
        addCardImageView.image = .imgAddcard
        kakaoPayCardImageView.image = .imgKakaopay
        kakaoBankCardImageView.image = .imgKakaobank
        shinhanCardImageView.image = .imgShinhan
        
        kakaoPayCardLabel.text = StringLiterals.Payment.kakaoPayCard
    }
    
    func setupHierarchy() {
        addSubviews(tabBar, 
                    customView,
                    cardStackView)
        
        cardStackView.addArrangedSubviews(hanaCardImageView, 
                                          addCardImageView,
                                          kakaoPayCardImageView,
                                          kakaoBankCardImageView,
                                          shinhanCardImageView)
    }
    
    func setupLayout() {
        tabBar.snp.makeConstraints {
            $0.top.equalToSuperview().inset(65)
            $0.centerX.equalToSuperview()
        }
        
        customView.snp.makeConstraints {
            $0.top.equalTo(tabBar.snp.bottom).offset(13)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(344)
            $0.height.equalTo(329)
        }
        
        cardStackView.snp.makeConstraints {
            $0.top.equalTo(customView.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
        }
    }
}
