//
//  ViewController.swift
//  Example
//
//  Created by Khaled kamal on 3/23/20.
//  Copyright © 2020 Khaled kamal. All rights reserved.
//

import KKPlaceholder
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        show(SEmptyStatus.empty1) {
            print("try agin !")
        }
    }
}

public enum SEmptyStatus: PlaceHolderDataSourceProtocol {
    case empty1

    public var image: UIImage? {
        return nil
    }

    public var title: String? {
        return "Title"
    }

    public var description: String? {
        return "description"
    }

    public var handlerTitle: String? {
        return "Try Again!!!!!!!"
    }
}
