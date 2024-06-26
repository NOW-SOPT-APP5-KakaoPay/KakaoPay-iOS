//
//  RecentHeaderView.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/13.
//

import UIKit

import SnapKit
import Then

final class RecentHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - UI Component
    
    private let recentLabel = UILabel()
    
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

private extension RecentHeaderView {
    func setupStyle() {
        recentLabel.do {
            $0.text = StringLiterals.Transfer.recentAccount
            $0.font = .appleRegular(size: 13)
            $0.textColor = .kakaoBlack
        }
    }
    
    func setupHierarchy() {
        addSubview(recentLabel)
    }
    
    func setupLayout() {
        recentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(22)
        }
    }
}
