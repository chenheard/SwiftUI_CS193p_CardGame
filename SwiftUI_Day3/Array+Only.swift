//
//  Array+Only.swift
//  SwiftUI_Day3
//
//  Created by 陈金雷 on 2021/1/7.
//

import Foundation
extension Array{
    var only:Element?{
        count == 1 ? first : nil
    }
}
