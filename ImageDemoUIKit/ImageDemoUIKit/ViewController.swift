//
//  ViewController.swift
//  ImageDemoUIKit
//
//  Created by Kovács Márk on 2025. 02. 02..
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let images:[String] = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imgCell", for: indexPath) as! CustomTableViewCell
        cell.customImageView.image = UIImage(named: images[indexPath.row])
        return cell
    }
}

