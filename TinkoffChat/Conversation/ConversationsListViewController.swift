//
//  ConversationsListViewController.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 04.03.2021.
//

import UIKit

final class ConversationsListViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let dataProvider: DataProvider = DummyDataProvider()
    private let rowHeight: CGFloat = 75
    private let baseCellId = "baseCellId"
    private lazy var items = dataProvider.getConversations()
    private lazy var sectionsModels: [ConversationListSectionModel] = []
    
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ConversationListTableViewCell.self, forCellReuseIdentifier: baseCellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        return tableView
    }()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateData()
        tableView.reloadData()
    }
    
    
    // MARK: - Private methods
    
    private func setupLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationItem.title = "Tinkoff Chat"
        
        let profileImageView = ProfileImageView()
        profileImageView.configure(with: dataProvider.getUser())
        profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                     action: #selector(presentProfileViewController)))
        let rightBarButtonView = UIView()
        rightBarButtonView.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: rightBarButtonView.leadingAnchor),
            profileImageView.topAnchor.constraint(equalTo: rightBarButtonView.topAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: rightBarButtonView.trailingAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: rightBarButtonView.bottomAnchor, constant: -5)
        ])
        
        let rightBarButton = UIBarButtonItem(customView: rightBarButtonView)
        navigationItem.rightBarButtonItem = rightBarButton
        
        let leftBarButtonItem = UIBarButtonItem(image: Appearance.settingsIcon, style: .plain, target: self, action: #selector(presentThemesViewController))
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc private func presentProfileViewController() {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() {
            let nc = BaseNavigationController(rootViewController: vc)
            
            present(nc, animated: true, completion: nil)
        }
    }
    
    @objc private func presentThemesViewController() {
        let vc = ThemesViewController()
        vc.themesPickerDelegate = Appearance.shared
        vc.themeSelectedCallback = Appearance.shared.themeSelectedCallback
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func updateData() {
        sectionsModels = [
            ConversationListSectionModel(sectionName: "Online",
                                         backgroundColor: Appearance.yellowSecondaryColor,
                                         items: items.filter { $0.isOnline }),
            ConversationListSectionModel(sectionName: "History",
                                         backgroundColor: nil,
                                         items: items.filter { !$0.isOnline && $0.message != "" }),
        ]
    }
}
// MARK: - UITableViewDataSource
extension ConversationsListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsModels[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: baseCellId) as? ConversationListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: sectionsModels[indexPath.section].items[indexPath.row])
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ConversationsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ConversationListTableViewHeader(frame: .zero)
        header.configure(with: sectionsModels[section])
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ConversationViewController()
        vc.conversationName = items[indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
