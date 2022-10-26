//
//  Api.swift
//  Avito Trainee Problem 2021 Try 2
//
//  Created by Pavel Zykov on 26.10.2022.
//

import Foundation

struct Api {
    
    let companyName: String
    let employees: [Employee]
    
    init?(apiData: ApiData) {
        companyName = apiData.company.name
        employees = apiData.company.employees
    }
}
