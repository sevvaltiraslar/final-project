//
//  SearchViewController.swift
//  final-project-shopping
//
//  Created by SEVVAL on 6.11.2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var shoppingListViewModel: ShoppingListViewModel!
    var filteredData: [String] = []
    var data: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitleLabel.text = "SEARCH"
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        getData()
    }
    
    func getData() {
        let url = URL(string: "https://fakestoreapi.com/products")!
        Webservice().downloadShopping(url: url) { shoppings in
            if let shoppings = shoppings {
                self.shoppingListViewModel = ShoppingListViewModel(shoppingList: shoppings)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}
// MARK: Tableview delegate and daatsource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shoppingListViewModel == nil ? 0 : self.shoppingListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let shoppingViewModel = self.shoppingListViewModel.shoppingAtIndex(indexPath.row)
        cell.textLabel?.text = shoppingViewModel.title
        //self.data.append(shoppingViewModel.title)
        return cell
    }
}

// MARK: Search bar delegate
extension SearchViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredData = []
//        if searchText == "" {
//            self.data = self.filteredData
//        }
//        for word in data {
//            if word.uppercased().contains(searchText.uppercased()) {
//                filteredData.append(word)
//            }
//        }
//        self.tableView.reloadData()
//    }
}
