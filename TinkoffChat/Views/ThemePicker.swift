//
//  ThemePicker.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 11.03.2021.
//

import UIKit

class ThemePicker: UIView {

    // MARK: - Public properties
    
    var themeId: Int?

    // MARK: - UI
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.layer.borderColor = Appearance.yellow?.cgColor
        view.backgroundColor = .lightGray
        view.addSubview(leftBubbleView)
        view.addSubview(rightBubbleView)
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    private lazy var leftBubbleView = UIView()
    private lazy var rightBubbleView = UIView()

    private let borderWidth: CGFloat = 3
    private let mainViewHeight: CGFloat = 65
    private let vertivalSpacing: CGFloat = 15
    private let padding: CGFloat = 15
    private let bubbleHeight: CGFloat = 25
    private let bubbleWidthMultiplier: CGFloat = 0.4

    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupLayout()
    }

    // MARK: - Lifecycle methods
    
    override func layoutSubviews() {
        super.layoutSubviews()

        mainView.layer.cornerRadius = Appearance.baseCornerRadius
        leftBubbleView.layer.cornerRadius = Appearance.baseCornerRadius
        rightBubbleView.layer.cornerRadius = Appearance.baseCornerRadius
    }

    // MARK: - Private methods
    
    private func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [mainView, titleLabel])
        [mainView, leftBubbleView, rightBubbleView, stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        stackView.axis = .vertical
        stackView.spacing = vertivalSpacing
        addSubview(stackView)
        NSLayoutConstraint.activate([
            mainView.heightAnchor.constraint(equalToConstant: mainViewHeight),
            leftBubbleView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: padding),
            leftBubbleView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: padding),
            leftBubbleView.heightAnchor.constraint(equalToConstant: bubbleHeight),
            leftBubbleView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: bubbleWidthMultiplier),
            rightBubbleView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -padding),
            rightBubbleView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -padding),
            rightBubbleView.heightAnchor.constraint(equalToConstant: bubbleHeight),
            rightBubbleView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: bubbleWidthMultiplier),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - ConfigurableView
extension ThemePicker: ConfigurableView {

    func configure(with model: ThemeModel) {
        titleLabel.text = model.name

        if model.isSelected {
            mainView.layer.borderWidth = borderWidth
        } else {
            mainView.layer.borderWidth = 0
        }
        themeId = model.id

        leftBubbleView.backgroundColor = model.incomingMessageColor
        rightBubbleView.backgroundColor = model.outgoingMessageColor
        mainView.backgroundColor = model.backgroundColor
    }
}
