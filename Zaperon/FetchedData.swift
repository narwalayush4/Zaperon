//
//  FetchedData.swift
//  Zaperon
//
//  Created by Ayush Narwal on 06/11/23.
//

import Foundation

struct FetchedData: Codable {
    let error: Bool
    let msg: String
    let data: [Country]
}

struct Country: Codable, Hashable{
    let iso2: String
    let iso3: String
    let country: String
    let cities: [String]
}
