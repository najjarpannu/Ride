//
//  VehicleViewModel.swift
//  Rides
//
//  Created by Najjar Singh on 2023-01-12.
//

import Foundation

class vehicleViewModel{
weak var vc : VehicleListVC?
    var randomVehicle : RandomVchl!
    var vehicleList = [RandomVchl]()
    var baseUrl = "https://random-data-api.com/api/vehicle/random_vehicle?size="
    
    // we can also use Alamofire to Get, push, post ,Delete,etc because it is easy and simple with Alamofire.
    func getVehicleData(number : String){
        let url = baseUrl+number
        print(url)
        URLSession.shared.dataTask(with: URL(string: url)!) {(data , response, error) in
            if error == nil{
                if let data = data{
                    print(data)
                    do{
                        let userResponse = try JSONDecoder().decode([RandomVchl].self, from: data)
                        print(userResponse)
                        self.vehicleList = userResponse
                        DispatchQueue.main.async {
                            self.vc?.mainArray = self.vehicleList
                            self.vc?.mTableView.reloadData()
                        }
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
            }else{
                print(error?.localizedDescription as Any)
            }
            
        }.resume()
    }
}
