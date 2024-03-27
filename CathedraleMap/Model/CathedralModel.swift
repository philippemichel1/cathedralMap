//
//  ModelCathedrale.swift
//  CathedraleMap
//
//  Created by Philippe MICHEL on 25/03/2024.
//

import Foundation
import SwiftUI
struct ModelCathedrale: Identifiable {
    var id:UUID = UUID()
    var name:String
    var longitude:Double
    var latitude:Double
}
