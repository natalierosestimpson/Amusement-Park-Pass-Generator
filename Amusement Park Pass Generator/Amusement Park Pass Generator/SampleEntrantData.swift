import UIKit

//sample entrant data that can be used to populate form

class ExampleData {
    let exampleAdult = EntrantInformation(firstName: "Mike", lastName: "Smith", streetAddress: "10 Oxford street", city: "London", state: "UK", zipCode: "W1U 1DQ", socialSecurityNumber: "123-45-6789", dateOfBirth: DateComponents(year: 1990, month: 6, day: 30))
    
    let exampleChildDob = DateComponents(year: 2015, month: 11, day:30)
    
    let projectNumber: String = "123456"
    
    let companyName: String = "Unknown"
}


