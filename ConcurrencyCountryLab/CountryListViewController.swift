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
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let countryDetails = segue.destination as? CountryDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("verify class name in Identity insepctor")
        }
        
        let details = countryList[indexPath.row]
        
        countryDetails.countryDetails = details
        
        
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

extension CountryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension CountryListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        resignFirstResponder()
    }
}
