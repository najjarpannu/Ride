//
//  VehicleDetailsVC.swift
//  Rides
//
//  Created by Najjar Singh on 2023-01-12.
//

import UIKit

class VehicleDetailsVC: UIViewController {
    @IBOutlet weak var mVinTxtfld: UILabel!
    @IBOutlet weak var mColour: UILabel!
    @IBOutlet weak var mCarType: UILabel!
    var recievedData : RandomVchl!
    @IBOutlet weak var mMakeAndMdlTxtFld: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loaddata()
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
            swipeLeft.direction = .left
            self.view.addGestureRecognizer(swipeLeft)
    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
           let destinationvc = storyboard?.instantiateViewController(withIdentifier: "CarbonEmissionVCID") as! CarbonEmissionVC
           destinationvc.recievedMileage = recievedData
           navigationController?.pushViewController(destinationvc, animated: true)
       }
    }
    func loaddata(){
        self.mCarType.text = recievedData.car_type
        self.mVinTxtfld.text = recievedData.vin
        self.mColour.text = recievedData.color
        self.mMakeAndMdlTxtFld.text = recievedData.make_and_model
    }
}
