//
//  SpendingCell.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

import SnapKit
import Then

final class SpendingCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let todayCaseLabel = UILabel()
    private let arrowImage = UIImageView()
    private let dividerView = UIView()
    private let analyzeMoneyImage = UIImageView()
    private let whereLabel = UILabel()
    private let spendingQuestionLabel = UILabel()
    private let labelStackView = UIStackView()
    private let analysisButton = UIButton()
    private let usingCardView = UIView()
    private let monthButton = UIButton()
    private let usingCardQuestionLabel = UILabel()
    
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

extension SpendingCell {
    
    //MARK: - Private Method
    
    private func setupStyle() {
        backgroundColor = .kakaoWhite
        makeRounded(radius: 15)
        
        titleLabel.do {
            $0.text = StringLiterals.Asset.spentMoney
            $0.textColor = .kakaoBlack
            $0.font = .appleSemiBold(size: 20)
            $0.textAlignment = .center
        }
        
        todayCaseLabel.do {
            $0.text = "오늘 0건"
            $0.textColor = .kakaoGray600
            $0.font = .appleSemiBold(size: 16)
            $0.textAlignment = .center
        }
        
        arrowImage.do {
            $0.image = .icArrowGray600
        }
        
        dividerView.do {
            $0.makeRounded(radius: 0.5)
            $0.backgroundColor = .kakaoBluegray400
        }
        
        analyzeMoneyImage.do {
            $0.image = .imgAnalyzemoney
        }
        
        whereLabel.do {
            $0.text = "어디에"
            $0.textColor = .kakaoBlack
            $0.font = .appleRegular(size: 14)
            $0.textAlignment = .center
        }
        
        spendingQuestionLabel.do {
            $0.text = "많이 쓰는 타입인가요?"
            $0.textColor = .kakaoBlack
            $0.font = .appleSemiBold(size: 16)
            $0.textAlignment = .center
        }
        
        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
            $0.alignment = .leading
        }
        
        analysisButton.do {
            $0.setTitle("분석", for: .normal)
            $0.setTitleColor(.kakaoBlack, for: .normal)
            $0.titleLabel?.font = .appleSemiBold(size: 14)
            $0.makeRounded(radius: 15)
            $0.backgroundColor = .kakaoBluegray400
        }
        
        usingCardView.do {
            $0.backgroundColor = .kakaoGray200
            $0.makeRounded(radius: 10)
        }
        
        monthButton.do {
            $0.setTitle("4월", for: .normal)
            $0.setTitleColor(.kakaoGray600, for: .normal)
            $0.titleLabel?.font = .appleSemiBold(size: 12)
            $0.backgroundColor = .clear
            $0.makeRounded(radius: 9.5)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.kakaoGray500.cgColor
        }
        
        usingCardQuestionLabel.do {
            $0.text = "이번 달 카드 이용금액은?"
            $0.textColor = .kakaoBlack
            $0.font = .appleSemiBold(size: 16)
            $0.textAlignment = .center
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            titleLabel,
            todayCaseLabel,
            arrowImage,
            dividerView,
            analyzeMoneyImage,
            labelStackView,
            analysisButton,
            usingCardView
        )
        labelStackView.addArrangedSubviews(whereLabel, spendingQuestionLabel)
        usingCardView.addSubviews(monthButton, usingCardQuestionLabel)
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(20)
        }
        
        todayCaseLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalTo(arrowImage.snp.leading)
        }
        
        arrowImage.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(30)
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(11)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
        
        analyzeMoneyImage.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(44)
        }
        
        labelStackView.snp.makeConstraints {
            $0.centerY.equalTo(analyzeMoneyImage.snp.centerY)
            $0.leading.equalTo(analyzeMoneyImage.snp.trailing).offset(13)
        }
        
        analysisButton.snp.makeConstraints {
            $0.centerY.equalTo(analyzeMoneyImage.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(50)
            $0.height.equalTo(32)
        }
        
        usingCardView.snp.makeConstraints {
            $0.top.equalTo(analyzeMoneyImage.snp.bottom).offset(23)
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(7)
        }
        
        monthButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(31)
            $0.height.equalTo(19)
        }
        
        usingCardQuestionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(monthButton.snp.trailing).offset(7)
        }
    }
}
