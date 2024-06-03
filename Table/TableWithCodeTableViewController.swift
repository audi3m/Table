//
//  TableWithCodeTableViewController.swift
//  Table
//
//  Created by J Oh on 5/23/24.
//

import UIKit

class TableWithCodeTableViewController: UITableViewController {
    
    let settings: Settings = .all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "설정"
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Settings.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Settings(rawValue: section)?.title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings(rawValue: section)?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settings")!
        
        let items = Settings(rawValue: indexPath.section)?.items
        cell.textLabel?.text = items?[indexPath.row]
        
        return cell
    }
    
}

enum Settings: Int, CaseIterable {
    case all
    case personal
    case etc
    
    var title: String {
        switch self {
        case .all:
            "전체 설정"
        case .personal:
            "개인 설정"
        case .etc:
            "기타"
        }
    }
    
    var items: [String] {
        switch self {
        case .all:
            ["공지사항", "실험실", "버전 정보"]
        case .personal:
            ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .etc:
            ["고객센터/도움말"]
        }
    }
}
