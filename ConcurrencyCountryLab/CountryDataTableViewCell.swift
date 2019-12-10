//
//  CountryDataTableViewCell.swift
//  ConcurrencyCountryLab
//
//  Created by Tiffany Obi on 12/9/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class CountryDataTableViewCell: UITableViewCell {

    @IBOutlet weak var countryFlagImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var populationLabel: UILabel!
    
    var country: Country!
    
    override func layoutSubviews() {
        countryFlagImage.layer.cornerRadius = 4
    }
    
    func configureCell(for country: Country) {
        
    //get image
        NetworkHelper.shared.performingDataTask(with:"https://www.countryflags.io/\(country.alpha2Code)/shiny/64.png") { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let data):
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imageView?.image = image
                }
            }
        }
        
        nameLabel.text = country.name
        capitalLabel.text = country.capital
        populationLabel.text = String(country.population)
    }
}
