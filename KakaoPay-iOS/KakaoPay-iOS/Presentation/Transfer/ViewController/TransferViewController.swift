//
//  TransferViewController.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/13.
//

import UIKit

final class TransferViewController: UIViewController {
    
    var recentAccountList: [GetHistoriesData]? {
        didSet{
            rootView.updateTableView()
        }
    }
    
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
        
        view.backgroundColor = .kakaoWhite
        
        setupDelegate()
        setupRegister()
        getRecentAccountHistoryAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.tabBarController?.tabBar.isHidden = true
        changeStatusBarBgColor(statusBarColor: .kakaoWhite)
        setNavigationBar()
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
    
    func setNavigationBar() {
        
        if let navigationBar = self.navigationController?.navigationBar {
            let emptyImage = UIImage()
            navigationBar.backgroundColor = .kakaoWhite
            navigationBar.barTintColor = .kakaoWhite
            navigationBar.isTranslucent = false
            navigationBar.shadowImage = emptyImage
        }
        
        let backBarButton = UIBarButtonItem(image: .icNavigationLeftarrow1, style: .plain, target: self, action: #selector(buttonTapped))
        
        let bluetoothLabelButton = UIButton()
        bluetoothLabelButton.setImage(.icNavigationBluetoothbar, for: .normal)
        
        let bluetoothButton = UIButton()
        bluetoothButton.setImage(.icNavigationBluetooth, for: .normal)
        
        let moreButton = UIButton()
        moreButton.setImage(.icNavigationMore1, for: .normal)
        moreButton.snp.makeConstraints { $0.width.equalTo(20)}
        
        let stackView = UIStackView(arrangedSubviews: [bluetoothLabelButton, bluetoothButton, moreButton])
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        let customView = UIBarButtonItem(customView: stackView)
        
        self.navigationItem.leftBarButtonItem = backBarButton
        self.navigationItem.rightBarButtonItem = customView
        
    }
    
    @objc
    func buttonTapped() {
        self.navigationController?.popViewController(animated: false)
    }
    
    func getRecentAccountHistoryAPI() {
        HistoriesService.shared.getHistoriesAPI { response in
            switch response {
            case .success(let data):
                guard let data = data as? GetHistoriesDTO else { return }
                self.recentAccountList = data.data
            default:
                return
            }
        }
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
            if let recentAccountList {
                cell.bindData(forModel: recentAccountList[indexPath.item])
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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
        return 34
    }
}
extension TransferViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let navigationBarHidden = scrollView.contentOffset.y > 0
        self.navigationController?.setNavigationBarHidden(navigationBarHidden, animated: false)
    }
}
