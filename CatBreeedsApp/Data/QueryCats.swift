//
//  QueryCats.swift
//  CatBreeedsApp
//
//  Created by MacBook Pro on 10/05/23.
//

import Foundation

protocol CatsManagerDelegate {
    func showCatsList(lista:[Cat])
}

struct CatsManager {
    var delegado: CatsManagerDelegate?
    func verGatos(){
        //MARK: URL
        let url = URL(string:"https://api.thecatapi.com/v1/breeds")
        guard url != nil else {
            print("error creating url")
            return
        }
        //MARK: URL Request
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        //MARK: HEADER
        let header = [
            "x-api-key": "bda53789-d59e-46cd-9bc4-2936630fde39"
        ]
        request.allHTTPHeaderFields = header
        
        //MARK: set the http request
        request.httpMethod = "GET"
        
        //MARK: get the URL SESSION
        let session = URLSession.shared
        
        //MARK: create the data task
        let dataTask = session.dataTask(with: request) { datos, respuesta, Error in
            if Error != nil {
                print("error al obtener datos",Error?.localizedDescription as Any)
            }
            if let secureData = datos{
                if let productsList = self.parseJSON(productsData: secureData){
                    //print("lista de productos",productsList)
                    delegado?.showCatsList(lista: productsList)
                }
            }
        }
        
        //MARK: fire off the datatask
        dataTask.resume()
    }
    /*{
        let urlString = "https://fakestoreapi.com/products"
        if let url =  URL(string: urlString){
            let session = URLSession(configuration: .default)
            url.setValue("bda53789-d59e-46cd-9bc4-2936630fde39", forHTTPHeaderField: "x-api-key")
            let task = session.dataTask(with: url) { datos, respuesta, Error in
                if Error != nil {
                    print("error al obtener datos",Error?.localizedDescription as Any)
                }
                if let secureData = datos?.parseData(quitarString: "null, "){
                    if let productsList = self.parseJSON(productsData: secureData){
                        //print("lista de productos",productsList)
                        delegado?.showproductsList(lista: productsList)
                    }
                }
            }
            task.resume()
        }
    }*/
    func parseJSON(productsData:Data) -> [Cat]?{
        let decoder = JSONDecoder()
        do {
            let DecodedData = try decoder.decode([Cat].self, from: productsData)
            return DecodedData
        } catch  {
            print("error decoding Data",error.localizedDescription)
            return nil
        }
    }
}
extension Data{
    func parseData(quitarString str:String ) -> Data? {
        let DataAsString = String(data: self, encoding: .utf8)
        let parseDataString = DataAsString?.replacingOccurrences(of: str, with: "")
        guard let data = parseDataString?.data(using: .utf8) else {return nil}
        return data
        
    }
}
