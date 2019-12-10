//
//  CountryDetailViewController.swift
//  ConcurrencyCountryLab
//
//  Created by Tiffany Obi on 12/10/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    @IBOutlet weak var flagImage: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var populationLabel: UILabel!
    
    var countryDetails: Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      configureCell(for: countryDetails)
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
                    self.flagImage.image = image                }
            }
        }
        
        nameLabel.text = country.name
        capitalLabel.text = "Capital:\(country.capital)"
        populationLabel.text = "Population: \(country.population)"
    }

}
