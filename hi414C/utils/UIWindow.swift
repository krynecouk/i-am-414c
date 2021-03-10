//
//  UIWindow.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 09.03.2021.
//

import Foundation
import SwiftUI

extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}
