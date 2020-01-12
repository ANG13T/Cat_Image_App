//
//  DetailViewController.swift
//  Cat_App
//
//  Created by Angelina Tsuboi on 1/11/20.
//  Copyright © 2020 Angelina Tsuboi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonPressed))

        if let imageToLoad = selectedImage {
            image.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareButtonPressed(){
        guard let image = image.image?.jpegData(compressionQuality: 0.8) else{
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
