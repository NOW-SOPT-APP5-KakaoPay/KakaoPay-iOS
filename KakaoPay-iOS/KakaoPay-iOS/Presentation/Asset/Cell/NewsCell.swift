//
//  NewsCell.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

import SnapKit
import Then

final class NewsCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let newsImage = UIImageView()
    private let discriptionLabel = UILabel()
    private let mainLabel = UILabel()
    
    // MARK: - Life Cycles
    
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

// MARK: - Extensions

extension NewsCell {
    
    //MARK: - Private Method
    
    private func setupStyle() {
        backgroundColor = .kakaoWhite
        makeRounded(radius: 15)
        
        discriptionLabel.do {
            $0.textColor = .kakaoGray600
            $0.font = .appleRegular(size: 14)
        }
        
        mainLabel.do {
            $0.textColor = .kakaoBlack
            $0.font = .appleSemiBold(size: 16)
        }
    }
    
    private func setupHierarchy() {
        addSubviews(newsImage, 
                    discriptionLabel,
                    mainLabel)
    }
    
    private func setupLayout() {
        newsImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(20)
        }
        
        discriptionLabel.snp.makeConstraints {
            $0.top.equalTo(newsImage.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(20)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(discriptionLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(20)
        }
    }
    
    //MARK: - Method
    
    func configureCell(_ data: NewsModel) {
        newsImage.image = data.image
        discriptionLabel.text = data.discription
        mainLabel.text = data.main
    }
    
    func configureCellWithHightlightText(data: NewsModel, hightlightText: String) {
        newsImage.image = data.image
        discriptionLabel.text = data.discription
        mainLabel.text = data.main
        mainLabel.asColor(targetString: hightlightText, color: .kakaoBlue)
    }
}
