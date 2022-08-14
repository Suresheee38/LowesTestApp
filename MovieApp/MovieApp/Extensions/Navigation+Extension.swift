//
//  Navigation+Extension.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/14/22.
//

import UIKit

extension UINavigationController: Navigatable {
    func pop(animated: Bool) {
        popViewController(animated: animated)
    }
    
    func show(_ viewController: UIViewController, animated: Bool) {
        pushViewController(viewController, animated: true)
    }
}
