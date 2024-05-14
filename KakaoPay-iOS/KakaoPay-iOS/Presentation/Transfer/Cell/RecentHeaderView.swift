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
    
    // MARK: - UIComponent
    
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
    
    // MARK: - set up Style
    
    private func setupStyle() {
        recentLabel.do {
            $0.text = "최근"
            $0.font = .appleRegular(size: 13)
            $0.textColor = .kakaoBlack
        }
    }
    
    // MARK: - set up Hierarchy
    
    private func setupHierarchy() {
        addSubview(recentLabel)
    }
    
    // MARK: - set up Layout
    
    private func setupLayout() {
        recentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(22)
        }
    }
}
