//
//  TinkoffFintechMessenger.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 11.03.2021.
//

import UIKit

class ThemesViewController: UIViewController {
    
    // MARK: - Public properties
    
    // Retain cycle возникнет, если мы будем также хранить жесткую ссылку на ThemesViewController в классе Appearance
    // в данной ситуации weak не обязателен
    var themesPickerDelegate: ThemesPickerDelegate?
    var themeSelectedCallback: ((Int) -> Void)?
    
    // MARK: - UI
    
    private lazy var themePickers: [ThemePicker] = {
        var pickers: [ThemePicker] = []
        themes.forEach {
            let picker = ThemePicker()
            picker.configure(with: $0)
            picker.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                               action: #selector(themePickerPressed(sender:))))
            pickers.append(picker)
        }
        return pickers
    }()
    
    private let horizontalPadding: CGFloat = 35
    private let heightMultiplier: CGFloat = 0.6
    
    // MARK: - Private properties
    
    private var themes = Appearance.shared.themes
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    // MARK: - Private methods
    
    private func setupLayout() {
        view.backgroundColor = Appearance.navyColor
        navigationItem.title = "Settings"
        
        let stackView = UIStackView(arrangedSubviews: themePickers)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: navigationController?.navigationBar.frame.height ?? 0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: heightMultiplier)
        ])
    }
    
    @objc private func themePickerPressed(sender: UITapGestureRecognizer) {
        guard let themePicker = sender.view as? ThemePicker,
              let id = themePicker.themeId else { return }
        
        if let delegate = themesPickerDelegate {
            delegate.themeSelected(width: id)
        } else if let themeSelectedCallback = themeSelectedCallback {
            themeSelectedCallback(id)
        }
        
        themes.forEach {
            themePickers[$0.id].configure(with: $0)
        }
    }
}
