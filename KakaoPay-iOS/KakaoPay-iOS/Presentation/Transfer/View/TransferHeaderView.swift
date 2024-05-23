//
//  TransferHeaderView.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/13.
//

import UIKit

import SnapKit
import Then

final class TransferHeaderView: UIView {
    
    // MARK: - Properties
    
    private let halfWidth = UIScreen.main.bounds.size.width / 2
    
    // MARK: - UI Components
    
    private let accountTransferButton = UIButton()
    private let friendTransferButton = UIButton()
    private let blackLineView = UIImageView()
    private let grayLineView = UIImageView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setView() {
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
}

private extension TransferHeaderView {
    func setupStyle() {
        accountTransferButton.do {
            $0.setTitle("계좌 송금", for: .normal)
            $0.setTitleColor(.kakaoBlack, for: .normal)
            $0.titleLabel?.font = .appleSemiBold(size: 18)
        }
        
        friendTransferButton.do {
            $0.setTitle("친구 송금", for: .normal)
            $0.setTitleColor(.kakaoGray600, for: .normal)
            $0.titleLabel?.font = .appleSemiBold(size: 18)
        }
        
        blackLineView.do {
            $0.image = .imgBlackLine
        }
        
        grayLineView.do {
            $0.image = .imgGrayLine
        }
    }
    
    func setupHierarchy() {
        addSubviews(accountTransferButton,
                    friendTransferButton,
                    blackLineView,
                    grayLineView)
    }
    
    func setupLayout() {
        accountTransferButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(halfWidth)
        }
        
        blackLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(accountTransferButton)
            $0.width.equalTo(halfWidth)
        }
        
        friendTransferButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(halfWidth)
        }
        
        grayLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(friendTransferButton)
            $0.width.equalTo(halfWidth)
        }
    }
}
