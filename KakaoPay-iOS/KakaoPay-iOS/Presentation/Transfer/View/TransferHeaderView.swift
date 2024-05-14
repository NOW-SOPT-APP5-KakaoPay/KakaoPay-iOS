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
    
    private let accountTransferButton = UIButton()
    private let friendTransferButton = UIButton()
    private let blackLineView = UIImageView()
    private let grayLineView = UIImageView()
    
    private let halfWidth = UIScreen.main.bounds.size.width / 2
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setView() {
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - set up Style
    
    private func setupStyle() {
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
    
    // MARK: - set up Hierarchy
    
    private func setupHierarchy() {
        addSubviews(accountTransferButton,
                    friendTransferButton,
                    blackLineView,
                    grayLineView)
    }
    
    // MARK: - set up Layout
    
    private func setupLayout() {
        accountTransferButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(63)
            $0.leading.equalToSuperview()
            $0.width.equalTo(halfWidth)
        }
        
        blackLineView.snp.makeConstraints {
            $0.top.equalTo(accountTransferButton.snp.bottom)
            $0.leading.equalTo(accountTransferButton)
            $0.width.equalTo(halfWidth)
        }
        
        friendTransferButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(63)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(halfWidth)
        }
        
        grayLineView.snp.makeConstraints {
            $0.top.equalTo(friendTransferButton.snp.bottom)
            $0.leading.equalTo(friendTransferButton)
            $0.width.equalTo(halfWidth)
        }
    }
}
