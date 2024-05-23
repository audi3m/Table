//
//  TableWithCodeTableViewController.swift
//  Table
//
//  Created by J Oh on 5/23/24.
//

import UIKit

class TableWithCodeTableViewController: UITableViewController {
    
    let sectionList = ["전체 설정", "개인 설정", "기타"]
    let sectionRowItems = [
        ["공지사항", "실험실", "버전 정보"],
        ["개인/보안", "알림", "채팅", "멀티프로필"],
        ["고객센터/도움말"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "설정"
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionList[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionRowItems[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settings")!
        
        let items = sectionRowItems[indexPath.section]
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
}
