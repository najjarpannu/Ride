//
//  CarbonEmissionVC.swift
//  Rides
//
//  Created by Najjar Singh on 2023-01-17.
//

import UIKit

class CarbonEmissionVC: UIViewController {
    @IBOutlet weak var messageLBl: UILabel!
    @IBOutlet weak var mMstxt: UILabel!
    var recievedMileage : RandomVchl!
    override func viewDidLoad() {
        super.viewDidLoad()
        loaddata()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view.
    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
       if gesture.direction == .right {
           navigationController?.popViewController(animated: true)
       }}
   func loaddata(){
       if recievedMileage.kilometrage! <= 5000{
           let km = recievedMileage.kilometrage!
           self.messageLBl.text = String(km)
           mMstxt.text = "1 unit of carbon is emitted per kilometre"
           
       }
       else if recievedMileage.kilometrage! > 5000{
           let km = recievedMileage.kilometrage!
           let carbon = Double(km) * 1.5
           self.messageLBl.text = String(carbon)
           self.mMstxt.text = "1.5 unit of carbon is emitted per kilometre"
       }
        
    }

}
