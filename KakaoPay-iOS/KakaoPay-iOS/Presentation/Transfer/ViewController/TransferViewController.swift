//
//  TransferViewController.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/13.
//

import UIKit

final class TransferViewController: UIViewController {
    
    // MARK: - Properties
    
    private var transferData = TransferModel.dummy()
    
    // MARK: - UI Components
    
    private let rootView = TransferView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        setupRegister()
    }
}

private extension TransferViewController {
    func setupDelegate() {
        rootView.transferTableView.delegate = self
        rootView.transferTableView.dataSource = self
    }
    
    func setupRegister() {
        rootView.transferTableView.register(MyAccountTableViewCell.self,
                                            forCellReuseIdentifier: MyAccountTableViewCell.className)
        rootView.transferTableView.register(RecentTableViewCell.self,
                                            forCellReuseIdentifier: RecentTableViewCell.className)
        
        rootView.transferTableView.register(MyAccountHeaderView.self,
                                            forHeaderFooterViewReuseIdentifier: MyAccountHeaderView.className)
        rootView.transferTableView.register(RecentHeaderView.self,
                                            forHeaderFooterViewReuseIdentifier: RecentHeaderView.className)
    }
}


extension TransferViewController: UITableViewDelegate {
    
}

extension TransferViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return transferData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyAccountTableViewCell.className, for: indexPath) as? MyAccountTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecentTableViewCell.className, for: indexPath) as? RecentTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.bindData(forModel: transferData[indexPath.item])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        print(section)
        switch section {
        case 0:
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyAccountHeaderView.className) as? MyAccountHeaderView else { return UITableViewHeaderFooterView() }
            return header
        default:
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: RecentHeaderView.className) as? RecentHeaderView else { return UITableViewHeaderFooterView() }
            return header
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
}
extension TransferViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let navigationBarHidden = scrollView.contentOffset.y > 0
        self.navigationController?.setNavigationBarHidden(navigationBarHidden, animated: false)
    }
}
