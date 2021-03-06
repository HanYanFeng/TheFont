//
//  ViewController.swift
//  Font
//
//  Created by 韩艳锋 on 2017/11/20.
//  Copyright © 2017年 韩艳锋. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var tableView : UITableView = UITableView()
    var dataSource = ["FamilyNames"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = CGRect(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height - 64)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.view.backgroundColor = UIColor.white
        self.title = "字体"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        var vc : UIViewController?
        switch dataSource[indexPath.row] {
        case "FamilyNames":
             vc = FamilyNamesVC()
        default:
            break
        }
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

