//
//  Weather.swift
//  SwiftUI-WeatherApp
//
//  Created by Fabien Lebon on 15/11/2020.
//

import Foundation
import SwiftUI

struct Weather : Identifiable {
    var id = UUID()
    let day     : String
    let imageSF : String
    let temp    : String
    
    init(day: String, imageSF: String, temp: String) {
        self.day = day
        self.imageSF = imageSF
        self.temp = temp
    }
}
