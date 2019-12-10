//
//  CountriesData.swift
//  ConcurrencyCountryLab
//
//  Created by Tiffany Obi on 12/9/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name: String
    let alpha2Code: String
    let subregion: String
    let population: Double
    let nativeName: String
    let currencies: [Currency]
    let languages: [Language]
    let capital: String
}

struct Currency:Codable {
    let code: String
    let name: String
    let symbol: String
}

struct Language:Codable {
    let nativeName: String
}

extension Country {
    
    static func getCountries () -> [Country] {
        
        var countries = [Country]()
        
        guard let fileURL = Bundle.main.url(forResource: "countries", withExtension: "json") else {
            fatalError("could not locate file")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let countryData = try JSONDecoder().decode([Country].self, from: data)
            
            countries = countryData
        } catch {
            fatalError("failed to load contents: \(error)")
        }
        return countries
    }
}
