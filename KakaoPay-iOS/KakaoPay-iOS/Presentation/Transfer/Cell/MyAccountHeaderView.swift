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
    
    // MARK: - set up Style
    
    private func setupStyle() {
        myAccountLabel.do {
            $0.text = "내 계좌"
            $0.font = .appleRegular(size: 13)
            $0.textColor = .kakaoBlack
        }
        
        countLabel.do {
            $0.text = "+1개"
            $0.font = .appleRegular(size: 13)
            $0.textColor = .kakaoGray600
        }
        
        arrowButton.do {
            $0.setImage(.icDown, for: .normal)
        }
    }
    
    // MARK: - set up Hierarchy
    
    private func setupHierarchy() {
       addSubviews(myAccountLabel, countLabel, arrowButton)
    }
    
    // MARK: - set up Layout
    
    private func setupLayout() {
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
