//
//  Array+Identifiable.swift
//  SwiftUI_Day3
//
//  Created by 陈金雷 on 2021/1/7.
//

import Foundation
extension Array where Element :Identifiable{
    func firstIndex(matching:Element)->Int? {
        for index in 0..<self.count{
            if self[index].id == matching.id {
                return index
            }
        }
        return nil  
    }
}
