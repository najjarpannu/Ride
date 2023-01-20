//
//  PopUpVC.swift
//  Rides
//
//  Created by Najjar Singh on 2023-01-19.
//

import UIKit

protocol SortCarsDelegateVC :AnyObject {
    func search(carType:String?)
    
}

class PopUpVC: UIViewController {
    var delegate : SortCarsDelegateVC?
    
    var ArrCarType = ["SUV","Coupe","Passenger Van","Minivan","Convertible","Cargo Van","Hatchback","Wagon","Extended Cab Pickup","Crew Cab Pickup","Regular Cab Pickup"]
    @IBOutlet weak var mTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
extension PopUpVC:UITableViewDelegate,UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ArrCarType.count    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mTableView.dequeueReusableCell(withIdentifier: "PopUpCellVC", for: indexPath) as! PopUpCellVC
        let data = ArrCarType[indexPath.row]
        cell.mView.layer.cornerRadius = 5
        cell.mView.layer.borderWidth = 0.2
        cell.mView.layer.borderColor = #colorLiteral(red: 0.7986437421, green: 0.7986437421, blue: 0.7986437421, alpha: 1)
        cell.mView.layer.shadowColor = #colorLiteral(red: 0.7986437421, green: 0.7986437421, blue: 0.7986437421, alpha: 1)
        cell.mView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.mView.layer.shadowOpacity = 0.7
        cell.mView.layer.shadowRadius = 4.0
        cell.mView.layer.masksToBounds = false
        cell.mLabel.text = data
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let data = ArrCarType[indexPath.row]
        self.dismiss(animated: true, completion: {
            self.delegate?.search(carType : data)
        })
    }
    
}



class PopUpCellVC : UITableViewCell{
    
    
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var mView: UIView!
    
}
