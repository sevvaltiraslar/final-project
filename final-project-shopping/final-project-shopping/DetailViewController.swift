//
//  DetailViewController.swift
//  final-project-shopping
//
//  Created by SEVVAL on 6.11.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var pageTitleLable: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    private var shoppingListViewModel: ShoppingListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTitleLable.text = "DETAİLS"
        getData()
        setLabel()
    }
    // MARK: Buttons actions
    @IBAction func backClicked(_ sender: Any) {
        performSegue(withIdentifier: "toTabBarViewController", sender: nil)
    }
    
    
    // MARK: Functions
    func getData() {
        let url = URL(string: "https://fakestoreapi.com/products")!
        Webservice().downloadShopping(url: url) { shoppings in
            if let shoppings = shoppings {
                self.shoppingListViewModel = ShoppingListViewModel(shoppingList: shoppings)
            }
        }
    }
    
    func setLabel() {
        categoryLabel.text = "Category: "
        titleLabel.text = "Title: "
        descriptionLabel.text = "Description: "
        priceLabel.text = "Price: "
    }
}


// \()
