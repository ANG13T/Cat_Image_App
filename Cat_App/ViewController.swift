//
//  ViewController.swift
//  Cat_App
//
//  Created by Angelina Tsuboi on 1/11/20.
//  Copyright © 2020 Angelina Tsuboi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var images = [String]()
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Catastic!"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if(item.hasPrefix("cat")){
                images.append(item)
            }
        }
        
        images.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for:indexPath)
        cell.textLabel?.text = "Cat \(indexPath.row + 1)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedImage = images[indexPath.row]
            vc.title = "\(indexPath.row + 1) out of \(images.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

