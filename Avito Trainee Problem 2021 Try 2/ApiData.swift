// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let avitoEmployeesData = try? newJSONDecoder().decode(AvitoEmployeesData.self, from: jsonData)

import Foundation

// MARK: - AvitoEmployeesData
struct ApiData: Codable {
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
    let employees: [Employee]
}

// MARK: - Employee
struct Employee: Codable {
    let name, phoneNumber: String
    let skills: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}
