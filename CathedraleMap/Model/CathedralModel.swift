//
//  ModelCathedrale.swift
//  CathedraleMap
//
//  Created by Philippe MICHEL on 25/03/2024.
//

import Foundation
import SwiftUI
struct CathedralModel: Identifiable, Equatable {
    var id:UUID = UUID()
    var name:String
    var longitude:Double
    var latitude:Double
    var around_lon:Double
    var around_lat:Double
}
