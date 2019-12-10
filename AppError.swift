//
//  AppError.swift
//  ConcurrencyCountryLab
//
//  Created by Tiffany Obi on 12/9/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation
//handling errors against the newWork request. (network Helper) (for our pictures).
enum AppError: Error {
    case badURL(String)
    case noResponse
    case networkClientError(Error)
    case noData
    case decodingError(Error)
    case badStatusCode(Int) //  404/500
    case badMimetype(String) // image/jpg
}
