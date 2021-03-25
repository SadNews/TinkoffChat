//
//  ProfileImageView.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 05.03.2021.
//

import UIKit

class ProfileImageView: UIView {
    
    var profileImage: UIImage? {
        imageView.image
    }
    // MARK: - UI
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = Appearance.yellow
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var initialsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Appearance.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Appearance.mediumFont115
        label.adjustsFontSizeToFitWidth = true
        label.baselineAdjustment = .alignCenters
        label.textAlignment  = .center

        return label
    }()

    private let labelSizeMultiplier: CGFloat = 0.6
    
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

        layer.cornerRadius = frame.width / 2
    }

    // MARK: - Private methods
    
    private func setupLayout() {
        clipsToBounds = true
        addSubview(imageView)
        addSubview(initialsLabel)

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalTo: widthAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            initialsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            initialsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            initialsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: labelSizeMultiplier),
            initialsLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: labelSizeMultiplier)
        ])
    }
}

// MARK: - ConfigurableView
extension ProfileImageView: ConfigurableView {
    func configure(with model: PersonViewModel) {
        imageView.image = model.profileImage
        initialsLabel.isHidden = model.profileImage != nil
        initialsLabel.text = model.initials
    }
}
