//
//  ViewController.swift
//  SearchBar
//
//  Created by Apple on 02/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var searchBar: UISearchBar!
    var data = ["IOs","Java","php","c","cpp","web","react","html"]
    var filteredData = [String]()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }

}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
extension ViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == ""
        {
            filteredData = data
        }
        for word in data{
            if word.uppercased().contains(searchText.uppercased()){
                filteredData.append(word)
            }
                
        }
        self.tableView.reloadData()
    }
    
}
