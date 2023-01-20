//
//  VehicleListVC.swift
//  Rides
//
//  Created by Najjar Singh on 2023-01-12.
//

import UIKit

class VehicleListVC: UIViewController,UITextFieldDelegate, SortCarsDelegateVC {
    func search(carType: String?) {
        let data = vehicleData.vehicleList
        self.mainArray = data.filter { $0.car_type == carType }
        DispatchQueue.main.async {
            self.mTableView.reloadData()
        }}
    @IBOutlet weak var mSortBtn: UIButton!
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mSearchTxtFld: UITextField!
    var vehicleData = vehicleViewModel()
    var vehicleArr = [vehicleViewModel]()
    var mainArray = [RandomVchl]()
    var locations: [[String: String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        mSortBtn.isHidden = true
        vehicleData.vc = self
        self.mSearchTxtFld.delegate = self
    }
    @IBAction func sortbtn(_ sender: Any) {
            let resultController = self.storyboard?.instantiateViewController(withIdentifier: "PopUpVCID") as? PopUpVC
            self.navigationController?.definesPresentationContext = true
            resultController?.delegate = self
            resultController?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            resultController?.modalTransitionStyle = .crossDissolve
            self.present(resultController!, animated: true, completion: nil)
            }
    @IBAction func mSearchBtnActn(_ sender: Any) {
        mSearchTxtFld.resignFirstResponder()
//        checking for value in range
        if Int(mSearchTxtFld.text!) != nil && Int(mSearchTxtFld.text!)! > 0 && Int(mSearchTxtFld.text!)! <= 100 {
            mSortBtn.isHidden = false
            let number = mSearchTxtFld.text!
            vehicleData.getVehicleData(number: number)
            }
        else {
                let alert = UIAlertController(title: "Please make a correction", message: "value must be an integer in the range 1 to 100", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
                self.present(alert, animated: true, completion: nil)
        }
    }

}
extension VehicleListVC:UITableViewDelegate,UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.mainArray.count    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mTableView.dequeueReusableCell(withIdentifier: "VehiclelistTableCellVC", for: indexPath) as! VehiclelistTableCellVC
        let data = self.mainArray[indexPath.row]
        cell.mCellView.layer.cornerRadius = 5
        cell.mCellView.layer.borderWidth = 0.2
        cell.mCellView.layer.borderColor = #colorLiteral(red: 0.7986437421, green: 0.7986437421, blue: 0.7986437421, alpha: 1)
        cell.mCellView.layer.shadowColor = #colorLiteral(red: 0.7986437421, green: 0.7986437421, blue: 0.7986437421, alpha: 1)
        cell.mCellView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.mCellView.layer.shadowOpacity = 0.7
        cell.mCellView.layer.shadowRadius = 4.0
        cell.mCellView.layer.masksToBounds = false
        cell.mMakeAndModelTxt.text = data.make_and_model
        cell.mVinNumber.text = data.vin
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let data = vehicleData.vehicleList[indexPath.row]
        let destinationvc = storyboard?.instantiateViewController(withIdentifier: "VehicleDetailsVCID") as! VehicleDetailsVC
        destinationvc.recievedData = data
        navigationController?.pushViewController(destinationvc, animated: true)
    }
}
class VehiclelistTableCellVC: UITableViewCell {

    @IBOutlet weak var mMakeAndModelTxt: UILabel!
    @IBOutlet weak var mCellView: UIView!
    @IBOutlet weak var mVinNumber: UILabel!
}
