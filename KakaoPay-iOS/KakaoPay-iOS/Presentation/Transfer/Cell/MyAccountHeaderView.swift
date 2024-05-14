//
//  MyAccountHeaderView.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/13.
//

import UIKit

import SnapKit
import Then

final class MyAccountHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - UI Components
    
    private let myAccountLabel = UILabel()
    private let countLabel = UILabel()
    private let arrowButton = UIButton()
    
    
    // MARK: - Life Cycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
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
}

private extension MyAccountHeaderView {
    func setupStyle() {
        myAccountLabel.do {
            $0.text = StringLiterals.Transfer.myAccount
            $0.font = .appleRegular(size: 13)
            $0.textColor = .kakaoBlack
        }
        
        countLabel.do {
            $0.text = StringLiterals.Transfer.countPlusOne
            $0.font = .appleRegular(size: 13)
            $0.textColor = .kakaoGray600
        }
        
        arrowButton.do {
            $0.setImage(.icDown, for: .normal)
        }
    }
    
    func setupHierarchy() {
        addSubviews(myAccountLabel, 
                    countLabel,
                    arrowButton)
    }
    
    func setupLayout() {
        myAccountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(22)
        }
        
        countLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.trailing.equalToSuperview().inset(49)
        }
        
        arrowButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
