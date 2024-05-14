//
//  MyAccountCollectionViewCell.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/13.
//

import UIKit

import SnapKit
import Then

final class MyAccountTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let addImage = UIImageView()
    private let addAccountLabel = UILabel()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Private Extensions

private extension MyAccountTableViewCell {
    func setupStyle() {
        addImage.image = .imgAddButton
        addAccountLabel.do {
            $0.text = "계좌추가"
            $0.font = .appleSemiBold(size: 16)
            $0.textColor = .kakaoBlack
        }
    }
    
    func setupHierarchy() {
        addSubviews(addImage, addAccountLabel)
    }
    
    func setupLayout() {
        addImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalToSuperview().inset(22)
        }
        
        addAccountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.leading.equalTo(addImage.snp.trailing).offset(13)
        }
    }
}
