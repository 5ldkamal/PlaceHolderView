//
//  KKPlaceHolderView.swift
//  KKPlaceholder
//
//  Created by Khaled kamal on 3/6/20.
//  Copyright © 2020 Khaled kamal. All rights reserved.
//

import UIKit

// MARK: - ViewProtocol

public protocol PlaceHV: class {
    // Properities
    var view: UIView {
        get
    }
    
    var model: PlaceHolderDataSourceProtocol? {
        get set
    }
    
    var tryAgainAction: Handler? {
        get set
    }
}

final class PlaceHolderView: UIView, PlaceHV {
    /// Handler
    public var tryAgainAction: Handler?
    ///Model
    public var model: PlaceHolderDataSourceProtocol? {
        didSet {
            guard let model = model else { return }
            titleLabel.text = model.title
            descriptionLabel.text = model.description
            imageView.image = model.image
            actionButton.setTitle(model.handlerTitle, for: .normal)
            imageView.isHidden = model.image == nil
            titleLabel.isHidden = model.title == nil
            descriptionLabel.isHidden = model.description == nil
            actionButton.isHidden = model.handlerTitle == nil
        }
    }
    ///View
    public var view: UIView {
        return self
    }
    
    /// Title
    private lazy var titleLabel: UILabel = {
        $0.font = UIFont(name: "", size: 17)
        $0.textColor = UIColor.black
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    /// Description
    private lazy var descriptionLabel: UILabel = {
        $0.font = UIFont(name: "", size: 17)
        $0.textColor = UIColor.black
        $0.textAlignment = .center
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    /// ImageView
    private let imageView: UIImageView = {
        $0.contentMode = .scaleToFill
        return $0
    }(UIImageView())
    
    /// Handler Button
    private lazy var actionButton: UIButton = {
        $0.setTitle(model?.handlerTitle, for: .normal)
        $0.addTarget(self, action: #selector(actionHandler), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    private let verticalStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .center
        $0.distribution = .fill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private let horizontalStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 10
        $0.alignment = .center
        return $0
    }(UIStackView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateUI()
    }
}

// MARK: - Actions

private extension PlaceHolderView {
    @objc func actionHandler() {
        tryAgainAction?()
    }
}

// MARK: - Constrains

private extension PlaceHolderView {
    func updateUI() {
        self.addSubview(verticalStackView)
        
        addViewsToVStack()
        addConstarinToVStack()
    }
    
    func addViewsToVStack() {
        verticalStackView.addArrangedSubview(imageView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(actionButton)
    }
    
    func addConstarinToVStack() {
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
