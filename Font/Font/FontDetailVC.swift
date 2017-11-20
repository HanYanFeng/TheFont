//
//  FontDetailVC.swift
//  Font
//
//  Created by 韩艳锋 on 2017/11/20.
//  Copyright © 2017年 韩艳锋. All rights reserved.
//

import UIKit

class FontDetailVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var familyName : String!
    var tableView : UITableView = UITableView()
    
    var dataSource = ["1","2","3","4","5","6","7","8","9","一","二","三","四","五","六","七","八","九","十"]
    let sectoionCount = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = familyName
        tableView.frame = CGRect(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height - 64)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.view.backgroundColor = UIColor.white
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectoionCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "FontDetailVCcell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "FontDetailVCcell")
            
            print(UILabel().font.familyName)
        }
        switch indexPath.section {
        case 0:
            cell?.textLabel?.font = UIFont.init(name: familyName, size: 30)
            break
        case 1:
            cell?.textLabel?.font = UIFont.init(name: familyName + "-Bold", size: 30)
            break
        case 2:
            cell?.textLabel?.font = UIFont.init(name: familyName + "-Oblique", size: 30)
        default:
            break
        }
        cell?.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

