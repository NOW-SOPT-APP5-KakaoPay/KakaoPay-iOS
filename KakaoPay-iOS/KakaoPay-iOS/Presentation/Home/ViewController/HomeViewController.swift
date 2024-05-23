//
//  HomeViewController.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/10.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let rootView = HomeView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = self.rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegate()
        setRegister()
    }
}

private extension HomeViewController {
    func setDelegate() {
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
    }
    
    func setRegister() {
        rootView.collectionView.register(HomePayMoneyCollectionViewCell.self,
                                         forCellWithReuseIdentifier: HomePayMoneyCollectionViewCell.className)
        
        rootView.collectionView.register(HomeMenuCollectionViewCell.self,
                                         forCellWithReuseIdentifier: HomeMenuCollectionViewCell.className)
        
        rootView.collectionView.register(HomeTotalCollectionViewCell.self,
                                         forCellWithReuseIdentifier: HomeTotalCollectionViewCell.className)
        
        rootView.collectionView.register(HomeSendMoneyCollectionViewCell.self,
                                         forCellWithReuseIdentifier: HomeSendMoneyCollectionViewCell.className)
        
        rootView.collectionView.register(HomeGetMoneyCollectionViewCell.self,
                                         forCellWithReuseIdentifier: HomeGetMoneyCollectionViewCell.className)
        
        rootView.collectionView.register(HomePayPointCollectionViewCell.self,
                                         forCellWithReuseIdentifier: HomePayPointCollectionViewCell.className)
        
        rootView.collectionView.register(HomeScoreCollectionViewCell.self,
                                         forCellWithReuseIdentifier: HomeScoreCollectionViewCell.className)
        
        rootView.collectionView.register(HomeBottomCollectionViewCell.self,
                                         forCellWithReuseIdentifier: HomeBottomCollectionViewCell.className)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePayMoneyCollectionViewCell.className,
                                                                for: indexPath) as? HomePayMoneyCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.cornerRadius = 15
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeMenuCollectionViewCell.className,
                                                                for: indexPath) as? HomeMenuCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.cornerRadius = 15
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTotalCollectionViewCell.className,
                                                                for: indexPath) as? HomeTotalCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.cornerRadius = 15
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSendMoneyCollectionViewCell.className,
                                                                for: indexPath) as? HomeSendMoneyCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.cornerRadius = 15
            return cell
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeGetMoneyCollectionViewCell.className,
                                                                for: indexPath) as? HomeGetMoneyCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.cornerRadius = 15
            return cell
        case 5:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePayPointCollectionViewCell.className,
                                                                for: indexPath) as? HomePayPointCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.cornerRadius = 15
            return cell
        case 6:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeScoreCollectionViewCell.className,
                                                                for: indexPath) as? HomeScoreCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.cornerRadius = 15
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBottomCollectionViewCell.className,
                                                                for: indexPath) as? HomeBottomCollectionViewCell else { return UICollectionViewCell() }
            return cell
        }
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: 345, height: 153)
        case 1:
            return CGSize(width: 345, height: 165)
        case 2:
            return CGSize(width: 345, height: 168.5)
        case 3:
            return CGSize(width: 345, height: 187.5)
        case 4:
            return CGSize(width: 345, height: 187)
        case 5:
            return CGSize(width: 345, height: 147)
        case 6:
            return CGSize(width: 345, height: 167)
        
        default:
            return CGSize(width: 345, height: 74)
        }
    }
}
