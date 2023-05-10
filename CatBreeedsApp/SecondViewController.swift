//
//  SecondViewController.swift
//  CatBreeedsApp
//
//  Created by MacBook Pro on 10/05/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productRate: UILabel!
    @IBOutlet weak var productCount: UILabel!
    var cat: Cat!
    override func viewDidLoad() {
        super.viewDidLoad()
        /*titleLbl.text = cat!.title
        productImage.loadFrom(URLAddres:cat.image)
        productDescription.text = cat!.description
        productCategory.text = "categoria: \(cat!.category)"
        productPrice.text = "precio:  $\(cat!.price)"
        productRate.text = "rating: \(cat!.rating.rate)"
        productCount.text = "unidades: \(cat!.rating.count)"
        
        //print("producto seleccionado:  \(product)")
        if let producto = cat {
            titleLbl?.text = producto.title
        }
        
        
        self.titleLbl?.text = cat?.title
        self.navigationController?.navigationItem.leftBarButtonItem?.isEnabled = true
        self.navigationController?.isNavigationBarHidden = false
        
        // Do any additional setup after loading the view.
    }
}
extension UIImageView{
    func loadFrom(URLAddres:String) {
        guard let url = URL(string:  URLAddres) else { return }
        DispatchQueue.main.async {
            if let imageData = try? Data(contentsOf: url){
                if let loadedImage = UIImage(data: imageData){
                    self.image = loadedImage
                }
            }
        }*/
    }
}
