//
//  KKPlaceHolderDateProtocol.swift
//  KKPlaceholder
//
//  Created by Khaled kamal on 3/4/20.
//  Copyright © 2020 Khaled kamal. All rights reserved.
//

import UIKit

public typealias Handler = (() -> ())
public protocol PlaceHolderDataSourceProtocol {
    var image: UIImage? {
        get
    }
    var title: String? {
        get
    }
    var description: String? {
        get
    }
    var handlerTitle: String? {
        get
    }
}
