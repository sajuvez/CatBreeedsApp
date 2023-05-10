//
//  ViewController.swift
//  CatBreeedsApp
//
//  Created by MacBook Pro on 10/05/23.
//

import UIKit

class ViewController: UIViewController {
    var catsManager = CatsManager()
    var catsData :[Cat] = []
    var detalleCat: Cat?
    var gatoSeleccionado:Cat?
    
    @IBOutlet weak var TablaGatos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TablaGatos.register(UINib(nibName: "CatViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "catCell")
        catsManager.delegado = self
        catsManager.verGatos()
        // Do any additional setup after loading the view.
    }
    
    func dataTable(){
        TablaGatos.delegate = self
        TablaGatos.dataSource = self
    }
    
}
extension ViewController:CatsManagerDelegate{
    func showCatsList(lista: [Cat]) {
        catsData = lista
        DispatchQueue.main.async {
            
            self.dataTable()
            self.TablaGatos.reloadData()
        }
    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(productsData)
        return catsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = TablaGatos.dequeueReusableCell(withIdentifier: "catCell", for: indexPath) as! CatViewCellTableViewCell
        //nombre del producto
        celda.catName?.text = catsData[indexPath.row].name
        //imagen del producto
        let imageUrl = "https://cdn2.thecatapi.com/images/\(catsData[indexPath.row].referenceImageId ?? "test").jpg"
        print(imageUrl)
        if let urlString = imageUrl as? String {
            if let imageUrl = URL(string: urlString){
                DispatchQueue.global().async {
                    guard let imagenData = try? Data(contentsOf: imageUrl) else
                    { return }
                    let image = UIImage(data:  imagenData)
                    DispatchQueue.main.async {
                        celda.catImage.image = image
                    }
                }
            }
        }
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         gatoSeleccionado = catsData[indexPath.row]
        performSegue(withIdentifier: "productDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productDetail"{
            let gatoSelected = segue.destination as! SecondViewController
            gatoSelected.cat = gatoSeleccionado
            //print(productoSeleccionado)
        }
    }
    
    
}

