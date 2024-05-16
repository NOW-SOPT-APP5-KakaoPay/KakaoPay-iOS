//
//  AccountHeaderView.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

import SnapKit
import Then

final class AccountHeaderView: UICollectionReusableView {

    // MARK: - UIComponent

    private let accountLabel = UILabel()
    private let moreView = MoreView()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupStyle()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountHeaderView {
    
    //MARK: - Private Method

    private func setupStyle() {
        backgroundColor = .kakaoWhite
        makeRounded(radius: 15)
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        accountLabel.do {
            $0.text = "계좌"
            $0.font = .appleSemiBold(size: 20)
            $0.textColor = .kakaoBlack
            $0.textAlignment = .center
        }
    }

    private func setupHierarchy() {
        addSubviews(accountLabel, moreView)
    }

    private func setupLayout() {
        accountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        moreView.snp.makeConstraints {
            $0.centerY.equalTo(accountLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(18)
            $0.width.equalTo(55)
            $0.height.equalTo(19)
        }
    }
}
