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
    }
    
    func setupHierarchy() {
        addSubviews(tabBar, customView)
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
    }
}
