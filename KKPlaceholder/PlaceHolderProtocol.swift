//
//  KKPlaceHolderProtocol.swift
//  KKPlaceholder
//
//  Created by Khaled kamal on 3/4/20.
//  Copyright © 2020 Khaled kamal. All rights reserved.
//

import UIKit

public protocol PlaceHolderProtocol: NSObject {
    ///
    func show(_ placeHolderModel: PlaceHolderDataSourceProtocol, withComplation complation: (() -> ())?)
    func hide()
    ///
    var conatiner: PlaceHolderConatiner? { get }
    var placeHolderView: PlaceHV { get }
}

extension PlaceHolderProtocol {
    /// Default View
    public var placeHolderView: PlaceHV {
        return PlaceHolderView()
    }

    /// HideView
    public func hide() {
        conatiner?.baseView = nil
    }

    public func show(_ placeHolderModel: PlaceHolderDataSourceProtocol, withComplation complation: Handler? = nil) {
        let pView = placeHolderView;
        pView.model = placeHolderModel
        pView.tryAgainAction = complation
        conatiner?.baseView = pView as? UIView
        
    }
}

// MARK: - As UIView

extension UIView: PlaceHolderProtocol {}

public extension PlaceHolderProtocol where Self: UIView {
    /// Base View
    var conatiner: PlaceHolderConatiner? {
        return self
    }
}

public extension PlaceHolderProtocol where Self: UITableView {
    /// Base View
    var conatiner: PlaceHolderConatiner? {
        return self.backgroundView
    }
}

public extension PlaceHolderProtocol where Self: UICollectionView {
    /// Base View
    var conatiner: PlaceHolderConatiner? {
        return self.backgroundView
    }
}

// MARK: - As UIViewController

extension UIViewController: PlaceHolderProtocol {}

extension PlaceHolderProtocol where Self: UIViewController {
    /// Base View
    public var conatiner: PlaceHolderConatiner? {
        return view
    }
}

extension PlaceHolderProtocol where Self: UITableViewController {
    /// Base View
    public var conatiner: PlaceHolderConatiner? {
        return self.tableView.backgroundView
    }
}

extension PlaceHolderProtocol where Self: UICollectionViewController {
    /// Base View
    public var conatiner: PlaceHolderConatiner? {
        return self.collectionView.backgroundView
    }
}
