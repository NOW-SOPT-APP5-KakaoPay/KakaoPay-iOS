//
//  RecentTableViewCell.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/13.
//

import UIKit

import SnapKit
import Then

final class RecentTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    private var recentAccountlist = [GetHistoriesData]()
    
    // MARK: - UI Components
    
    private let bankImage = UIImageView()
    private let personName = UILabel()
    private let bankLabel = UILabel()
    private let accountLabel = UILabel()
    private let starButton = UIButton()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        setupStyle()
        setupHierarchy()
        setupLayout()
        setAddTarget()
    }
}


// MARK: - Private Extensions

private extension RecentTableViewCell {
    func setupStyle() {
        personName.do {
            $0.font = .appleSemiBold(size: 16)
            $0.textColor = .kakaoBlack
        }
        
        [bankLabel, accountLabel].forEach {
            $0.do {
                $0.font = .appleRegular(size: 12)
                $0.textColor = .kakaoGray600
            }
        }
        
        starButton.do {
            $0.setImage(.imgStarEmpty, for: .normal)
            $0.setImage(.imgStarSelect, for: .selected)
        }
        
    }
    
    func setupHierarchy() {
        contentView.addSubviews(bankImage,
                                personName,
                                bankLabel,
                                accountLabel,
                                starButton)
    }
    
    func setupLayout() {
        bankImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(22)
        }
        
        personName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalTo(bankImage.snp.trailing).offset(12)
        }
        
        bankLabel.snp.makeConstraints {
            $0.top.equalTo(personName.snp.bottom).offset(4)
            $0.leading.equalTo(personName.snp.leading)
        }
        
        accountLabel.snp.makeConstraints {
            $0.top.equalTo(bankLabel.snp.top)
            $0.leading.equalTo(bankLabel.snp.trailing).offset(3)
        }
        
        starButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(24)
            $0.height.width.equalTo(40)
        }
    }
    
    func setAddTarget() {
        starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
    }
}

extension RecentTableViewCell {
    
    //MARK: - Private Method
    
    private func postBookmarkAPI() {
        BookmarkService.shared.postBookmarkAPI(bank: recentAccountlist.first?.bank ?? "", bankAccount: recentAccountlist.first?.bankAccount ?? "") { response in
            switch response {
            case .success(let data):
                print("Succese")
            default:
                return
            }
        }
    }
    
    private func deleteBookmarkAPI() {
        BookmarkService.shared.deleteBookmarkAPI(bank: recentAccountlist.first?.bank ?? "", bankAccount: recentAccountlist.first?.bankAccount ?? "") { response in
            switch response {
            case .success(let data):
                print("Succese")
            default:
                return
            }
        }
    }
    
    //MARK: - Method
    
    func bindData(forModel: GetHistoriesData) {
        recentAccountlist.append(forModel)
        
        bankImage.image = checkBank(bank: forModel.bank).image
        personName.text = forModel.name
        bankLabel.text = forModel.bank
        accountLabel.text = forModel.bankAccount
    }
    
    func checkBank(bank: String) -> UIImageView {
        let bankImage = UIImageView()
        
        if bank == "신한" {
            bankImage.image = .imgShinhanLogo
        } else if bank == "카카오뱅크" {
            bankImage.image = .imgKakaobankLogo
        } else {
            bankImage.image = .imgTossLogo
        }
        
        return bankImage
    }
    
    //MARK: - @Objc Method
    
    @objc private func starButtonTapped() {
        starButton.isSelected ? deleteBookmarkAPI() : postBookmarkAPI()
        starButton.isSelected.toggle()
    }
}


