//
//  AssetViewController.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

final class AssetViewController: UIViewController {

    // MARK: - Properties
    
    private let rootView = AssetView()
    
    private let totalMoneyModelData = TotalMoneyModel.dummy()
    private let newsModelDateList = NewsModel.dummy()
    private let investmentAndLoanDataList = InvestmentAndLoanModel.dummy()

    // MARK: - Life Cycles

    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDelegate()
    }
}

extension AssetViewController {
    
    //MARK: - Private Method

    private func setupDelegate() {
        rootView.setupCollectionView(self)
    }
}

extension AssetViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 3, 4, 5:
            return 1
        case 2:
            return 3
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TotalMoneyCell.className, for: indexPath) as? TotalMoneyCell else {
                return UICollectionViewCell()
            }
            cell.bindData(totalMoneyModelData)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccontCell.className, for: indexPath) as? AccontCell else {
                return UICollectionViewCell()
            }
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.className, for: indexPath) as? NewsCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(newsModelDateList[indexPath.item])
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpendingCell.className, for: indexPath) as? SpendingCell else {
                return UICollectionViewCell()
            }
            return cell
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: investmentAndLoanCell.className, for: indexPath) as? investmentAndLoanCell else {
                return UICollectionViewCell()
            }
            cell.configureCellWithHightlightText(data: investmentAndLoanDataList[0], hightlightText: "5개")
            return cell
        case 5:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: investmentAndLoanCell.className, for: indexPath) as? investmentAndLoanCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(data: investmentAndLoanDataList[1])
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 1:
            if kind == UICollectionView.elementKindSectionHeader {
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MoneyHeaderView.className, for: indexPath) as? MoneyHeaderView else {
                    return UICollectionReusableView()
                }
                headerView.configureGrayTitleHeader(forTitle: "계좌")
                return headerView
            } else if kind == UICollectionView.elementKindSectionFooter {
                guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AccountFooterView.className, for: indexPath) as? AccountFooterView else {
                    return UICollectionReusableView()
                }
                return footerView
            } else {
                return UICollectionReusableView()
            }
        case 4:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MoneyHeaderView.className, for: indexPath) as? MoneyHeaderView else {
                return UICollectionReusableView()
            }
            headerView.configureBlackTitleHeader(forTitle: "투자한 돈")
            return headerView
        case 5:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MoneyHeaderView.className, for: indexPath) as? MoneyHeaderView else {
                return UICollectionReusableView()
            }
            headerView.configureBlackTitleHeader(forTitle: "빌린 돈")
            return headerView
        default: return UICollectionReusableView()
        }
    }
}

extension AssetViewController: UICollectionViewDelegate {
    
}
