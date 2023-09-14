//
//  CategoryModel.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 13/09/2023.
//

import Foundation

struct Category : Identifiable, Equatable{
    let id = UUID()
    let title : String
    let image : String
}
