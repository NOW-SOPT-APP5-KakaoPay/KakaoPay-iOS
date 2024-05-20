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
    
    let closeButton = UIButton()
    
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
            $0.spacing = 8
            $0.alignment = .center
            $0.distribution = .equalSpacing
        }

        hanaCardImageView.image = .imgHanabank
        addCardImageView.image = .imgAddcard
        kakaoPayCardImageView.image = .imgKakaopay
        kakaoBankCardImageView.image = .imgKakaobank
        shinhanCardImageView.image = .imgShinhan
        

        kakaoPayCardLabel.do {
            $0.text = StringLiterals.Payment.kakaoPayCard
            $0.textColor = .kakaoGray600
            $0.font = .appleRegular(size: 12)
        }
        
        closeButton.do {
            $0.setImage(.icClose, for: .normal)
            $0.setTitle(" 닫기", for: .normal)
            $0.setTitleColor(.kakaoBlack, for: .normal)
            $0.backgroundColor = .clear
        }
    }
    
    func setupHierarchy() {
        addSubviews(tabBar, 
                    customView,
                    cardStackView,
                    kakaoPayCardLabel,
                    closeButton)
        
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
            $0.top.equalTo(customView.snp.bottom).offset(41)
            $0.horizontalEdges.equalToSuperview()
        }
        
        kakaoPayCardLabel.snp.makeConstraints {
            $0.top.equalTo(cardStackView.snp.bottom).offset(10)
            $0.centerX.equalTo(cardStackView)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(kakaoPayCardLabel.snp.bottom).offset(33)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(110)
            $0.height.equalTo(44)
        }
    }
}
