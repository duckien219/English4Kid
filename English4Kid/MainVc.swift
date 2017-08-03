//
//  MainVc.swift
//  English4Kid
//
//  Created by Kien Nguyen Duc on 8/3/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit

class MainVc: UITableViewController {

    var dictList = ["Fruits" : "fruits.png", "Animals" : "animals.jpeg", "Numbers" : "numbers.png", "Shapes" : "shapes.png" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var arrayKey = Array(dictList.keys)
        cell.textLabel?.text = arrayKey[indexPath.row]
        cell.imageView?.image = UIImage(named: dictList["\(arrayKey[indexPath.row])"]!)

        return cell
    }

    }
