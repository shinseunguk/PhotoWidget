//
//  extension.swift
//  PhotoWidget
//
//  Created by ukBook on 2022/11/21.
//

import Foundation
import UIKit


extension UITextField {
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}
