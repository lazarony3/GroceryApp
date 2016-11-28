//
//  Array+Extension.swift
//  GroceryApp
//
//  Created by Lazarony, Robert on 11/27/16.
//  Copyright © 2016 Lazarony, Robert. All rights reserved.
//

import Foundation

extension Array {
    func value(at index: Int) -> Element? {
        guard index >= 0 && index < endIndex else {
            return nil
        }
        return self[index]
    }
}
