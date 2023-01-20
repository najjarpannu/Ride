//
//  RandomVchl.swift
//  Rides
//
//  Created by Najjar Singh on 2023-01-12.
//

import Foundation
struct RandomVchl : Codable {
    let id : Int?
    let uid : String?
    let vin : String?
    let make_and_model : String?
    let color : String?
    let transmission : String?
    let drive_type : String?
    let fuel_type : String?
    let car_type : String?
    let car_options : [String]?
    let specs : [String]?
    let doors : Int?
    let mileage : Int?
    let kilometrage : Int?
    let license_plate : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case uid = "uid"
        case vin = "vin"
        case make_and_model = "make_and_model"
        case color = "color"
        case transmission = "transmission"
        case drive_type = "drive_type"
        case fuel_type = "fuel_type"
        case car_type = "car_type"
        case car_options = "car_options"
        case specs = "specs"
        case doors = "doors"
        case mileage = "mileage"
        case kilometrage = "kilometrage"
        case license_plate = "license_plate"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        uid = try values.decodeIfPresent(String.self, forKey: .uid)
        vin = try values.decodeIfPresent(String.self, forKey: .vin)
        make_and_model = try values.decodeIfPresent(String.self, forKey: .make_and_model)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        transmission = try values.decodeIfPresent(String.self, forKey: .transmission)
        drive_type = try values.decodeIfPresent(String.self, forKey: .drive_type)
        fuel_type = try values.decodeIfPresent(String.self, forKey: .fuel_type)
        car_type = try values.decodeIfPresent(String.self, forKey: .car_type)
        car_options = try values.decodeIfPresent([String].self, forKey: .car_options)
        specs = try values.decodeIfPresent([String].self, forKey: .specs)
        doors = try values.decodeIfPresent(Int.self, forKey: .doors)
        mileage = try values.decodeIfPresent(Int.self, forKey: .mileage)
        kilometrage = try values.decodeIfPresent(Int.self, forKey: .kilometrage)
        license_plate = try values.decodeIfPresent(String.self, forKey: .license_plate)
    }

}
