//
//  ShoppingTableViewController.swift
//  Table
//
//  Created by J Oh on 5/24/24.
//

import UIKit

struct ShoppingItem {
    let itemName: String
    var check: Bool = false
    var star: Bool = false
}



class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var newItemTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var addNewView: UIView!
    
    var list: [ShoppingItem] = [
        ShoppingItem(itemName: "Sample1"),
        ShoppingItem(itemName: "Sample2"),
        ShoppingItem(itemName: "Sample3"),
        ShoppingItem(itemName: "Sample4"),
        ShoppingItem(itemName: "Sample5")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "쇼핑"
        tableView.rowHeight = 50 
        
        addNewView.layer.cornerRadius = 10
        addNewView.backgroundColor = .systemGray6
        
        newItemTextField.placeholder = "무엇을 구매하실 건가요?"
        newItemTextField.borderStyle = .none
        
        addButton.addTarget(self, action: #selector(addNewItem), for: .touchUpInside)
        addButton.tintColor = .black
         
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.itemLabel.text = item.itemName
        cell.itemLabel.font = .boldSystemFont(ofSize: 14)
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .systemGray6
        
        
        let checkImage = UIImage(systemName: item.check ? "checkmark.square" : "square")
        let starImage = UIImage(systemName: item.star ? "star.fill" : "star")
        
        cell.checkButton.setTitle("", for: .normal)
        cell.checkButton.setImage(checkImage, for: .normal)
        cell.checkButton.tintColor = .black
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        
        cell.starButton.setTitle("", for: .normal)
        cell.starButton.setImage(starImage, for: .normal)
        cell.starButton.tintColor = .black
        cell.starButton.tag = indexPath.row
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        
        return cell
        
    } 
    
    @objc func checkButtonClicked(sender: UIButton) {
        list[sender.tag].check.toggle()
        print("Update check, name: \(list[sender.tag].itemName)")
        tableView.reloadRows(at: [IndexPath.SubSequence(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @objc func starButtonClicked(sender: UIButton) {
        list[sender.tag].star.toggle()
        print("Update star, name: \(list[sender.tag].itemName)")
        tableView.reloadRows(at: [IndexPath.SubSequence(row: sender.tag, section: 0)], with: .automatic)
    }
    
    @objc func addNewItem() {
        let name = newItemTextField.text!
        
        if !name.isEmpty {
            let item = ShoppingItem(itemName: name)
            list.append(item)
            tableView.reloadData()
            newItemTextField.text = ""
            view.endEditing(true)
        }
    }
    
}
