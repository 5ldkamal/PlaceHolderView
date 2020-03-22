//
//  PlaceHolderConatiner.swift
//  KKPlaceholder
//
//  Created by Khaled kamal on 3/7/20.
//  Copyright © 2020 Khaled kamal. All rights reserved.
//

import UIKit

public protocol PlaceHolderConatiner: class {
    var baseView: UIView? {
        get set
    }
}

// View
extension UIView: PlaceHolderConatiner {
    public static let StatusViewTag = -999
    public var baseView: UIView? {
        get {
            return viewWithTag(UIView.StatusViewTag)
        }
        set {
            viewWithTag(UIView.StatusViewTag)?.removeFromSuperview()
            guard let view = newValue else { return }
            view.tag = UIView.StatusViewTag
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.centerXAnchor.constraint(equalTo: centerXAnchor),
                view.centerYAnchor.constraint(equalTo: centerYAnchor),
                view.leadingAnchor.constraint(greaterThanOrEqualTo: readableContentGuide.leadingAnchor),
                view.trailingAnchor.constraint(lessThanOrEqualTo: readableContentGuide.trailingAnchor),
                view.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),
                view.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)

            ])
        }
    }
}
