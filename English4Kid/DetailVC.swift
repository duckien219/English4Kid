//
//  DetailVC.swift
//  English4Kid
//
//  Created by Kien Nguyen Duc on 8/8/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit

class DetailVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKeys: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.title = stringTitle
        self.loadPlist(title: stringTitle)
        
        //        Đặt identifier cho Cell
        //        self.tableView.register((UITableViewCell.self), forCellReuseIdentifier: "cell")
        
    }
    
    func loadPlist(title: String) {
        var path: String = ""
        
        if (title == "Fruits") {
            path = Bundle.main.path(forResource: "FruitsList", ofType: "plist")!
        }
        if (title == "Animals") {
            
            path = Bundle.main.path(forResource: "AnimalsList", ofType: "plist")!
        }
        if (title == "Shapes") {
            path = Bundle.main.path(forResource: "ShapesList", ofType: "plist")!
        }
        dictData = NSDictionary(contentsOfFile: path)!
        arrayKeys = dictData.allKeys as NSArray!
        
        // Sắp xếp các phần tử trong mảng arrayKeys theo thứ tự a,b
        arrayKeys = arrayKeys.sortedArray(using: "compare:") as! NSArray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let key: String = arrayKeys[indexPath.row] as! String
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        print("\(indexPath.row) - \(arrayKeys[indexPath.row])")
    //
    //        // Get Cell Label
    //        let indexPath = tableView.indexPathForSelectedRow!
    //        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
    //
    //        performSegue(withIdentifier: "ShowImage", sender: self)
    //
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "ShowImage") {
            
            //tạo 1 biến nhận dữ liệu để chuyển đến Class "BottomVC"
            let bottomVC = segue.destination as! BottomVC
            
            let selectedRow: IndexPath = self.tableView.indexPathForSelectedRow!
            
            let stringTitle = arrayKeys[selectedRow.row]
            
            let valueOfKey = dictData[stringTitle] as! NSString
            
            bottomVC.nameImage = valueOfKey
        }
    }
}
