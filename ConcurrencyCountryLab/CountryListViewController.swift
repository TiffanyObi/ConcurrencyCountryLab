//
//  ViewController.swift
//  ConcurrencyCountryLab
//
//  Created by Tiffany Obi on 12/9/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController {

    @IBOutlet weak var seachBar: UISearchBar!
    
     @IBOutlet weak var tableView: UITableView!
    
    var countryList = [Country]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    func loadCountries () {
        countryList = Country.getCountries()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCountries()
        seachBar.delegate = self
        tableView.dataSource = self
    }


}

extension CountryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let countryCell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryDataTableViewCell else {
            fatalError("coudlnt dequeue cell")
        }
        
        let country = countryList[indexPath.row]
        
        countryCell.configureCell(for: country)
        return countryCell
    }
    
    
    
}

extension CountryListViewController: UISearchBarDelegate {
    
}
