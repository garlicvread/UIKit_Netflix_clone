//
//  Extensions.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/5/22.
//

import Foundation


extension String {
    func capitalizeTheFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
