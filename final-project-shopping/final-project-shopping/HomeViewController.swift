//
//  HomeViewController.swift
//  final-project-shopping
//
//  Created by SEVVAL on 6.11.2022.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var shoppingListViewModel: ShoppingListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
    // MARK: Functions
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

// MARK: Table view delegate and datesource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shoppingListViewModel == nil ? 0 : self.shoppingListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        let shoppingViewModel = self.shoppingListViewModel.shoppingAtIndex(indexPath.row)
        cell.titleLabel.text = shoppingViewModel.title
        return cell
    }
}
