//
//  BarcodePaymentView.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/16.
//

import UIKit

import SnapKit
import Then

final class BarcodePaymentView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let barcodeImage = UIImageView()
    private let qrcodeImage = UIImageView()
    
    private let paymoneyLabel = UILabel()
    private let paymoneySubLabel = UILabel()
    private let paymoney = UILabel()
    private let moreButton = UIButton()
    
    private let paypointLabel = UILabel()
    private let paypoint = UILabel()
    private let toggleButton = UISwitch()
    
    private let availablecouponLabel = UILabel()
    private let gotoButton = UIButton()
    
    private let divideLineTop = CustomDivideView()
    private let divideLineBottom = CustomDivideView()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
        bindData()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension BarcodePaymentView {
    func setupStyle() {
        self.backgroundColor = .kakaoWhite
        
        barcodeImage.do {
            $0.image = .imgBarcode
        }
        
        qrcodeImage.do {
            $0.image = .imgQrcode
        }
        
        paymoneySubLabel.do {
            $0.text = "페이포인트 0.5% 적립"
            $0.textColor = .kakaoBlue
            $0.font = .appleRegular(size: 13)
        }
        
        paymoney.do {
            $0.textColor = .kakaoBlack
            $0.font = .appleSemiBold(size: 18)
        }
        
        moreButton.do {
            $0.setImage(.imgBtnMore, for: .normal)
        }
        
        paypoint.do {
            $0.textColor = .kakaoBlue
            $0.font = .appleRegular(size: 13)
        }
        
        //toggle button setting
        toggleButton.do {
            $0.isOn = false
            $0.onTintColor = .kakaoYellowDark
        }
        
        paymoneyLabel.text = "페이머니"
        paypointLabel.text = "페이포인트 사용"
        availablecouponLabel.text = "사용 가능한 쿠폰"
        
        [paymoneyLabel, paypointLabel, availablecouponLabel].forEach {
            $0.do {
                $0.textColor = .kakaoBlack
                $0.font = .appleSemiBold(size: 16)
            }
        }
        
        gotoButton.do {
            $0.setImage(.icGoto, for: .normal)
        }
    }
    
    func setupHierarchy() {
        addSubviews(barcodeImage,
                    qrcodeImage,
                    paymoneyLabel,
                    paymoneySubLabel,
                    paymoney,
                    moreButton,
                    paypointLabel,
                    paypoint,
                    toggleButton,
                    availablecouponLabel,
                    gotoButton,
        divideLineTop, divideLineBottom)
    }
    
    func setupLayout() {
        barcodeImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(21.5)
        }
        
        qrcodeImage.snp.makeConstraints {
            $0.top.equalTo(barcodeImage.snp.top)
            $0.trailing.equalToSuperview().inset(21.5)
        }
        
        paymoneyLabel.snp.makeConstraints {
            $0.top.equalTo(barcodeImage.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(22)
        }
        
        paymoneySubLabel.snp.makeConstraints {
            $0.top.equalTo(paymoneyLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(22)
        }
        
        paymoney.snp.makeConstraints {
            $0.top.equalTo(paymoneyLabel.snp.top).inset(10.5)
            $0.trailing.equalToSuperview().inset(50)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(paymoneyLabel.snp.top)
            $0.trailing.equalToSuperview()
        }
        
        divideLineTop.snp.makeConstraints {
            $0.top.equalTo(paymoneySubLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(298)
            $0.height.equalTo(1)
        }
        
        paypointLabel.snp.makeConstraints {
            $0.top.equalTo(divideLineTop.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(22)
        }
        
        paypoint.snp.makeConstraints {
            $0.top.equalTo(paypointLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(22)
        }
 
        toggleButton.snp.makeConstraints {
            $0.top.equalTo(paypointLabel.snp.top)
            $0.trailing.equalToSuperview().inset(22)
        }
        
        divideLineBottom.snp.makeConstraints {
            $0.top.equalTo(paypoint.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(298)
            $0.height.equalTo(1)
        }
        
        availablecouponLabel.snp.makeConstraints {
            $0.top.equalTo(divideLineBottom.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(22)
        }
        
        gotoButton.snp.makeConstraints {
            $0.top.equalTo(divideLineBottom.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}


extension BarcodePaymentView {
    func bindData() {
        paymoney.text = "50,000원"
        paypoint.text = "5,000원"
    }
}
