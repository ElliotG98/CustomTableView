//
//  ViewController.swift
//  CutomTableView
//
//  Created by Elliot Glaze on 20/09/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    var products : [Product] = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createProductArray()
        tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    func createProductArray() {
        products.append(Product(productName: "Soap", productImage: UIImage(named: "soap")!, productDesc: "This is the best soap i've ever used"))
        products.append(Product(productName: "Sandles", productImage: UIImage(named: "sandles")!, productDesc: "These are comfy"))
        products.append(Product(productName: "Headphones", productImage: UIImage(named: "headphones")!, productDesc: "The sound through these is amazing"))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductCell
        let currentLastItem = products[indexPath.row]
        cell.product = currentLastItem
        return cell
    }


}

