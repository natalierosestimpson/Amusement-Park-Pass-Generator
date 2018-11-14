import UIKit

//define a subclass of Guest for seniors
//date of birth needed to prove entrant is indeed a senior
//includes function to include date of birth in a senior pass

class SeniorGuest: Guest {
    var dateOfBirth: DateComponents
    var firstName: String
    var lastName: String
    
    
    init(firstName: String, lastName: String, dateOfBirth: DateComponents){
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        super.init(guestType: .senior)
    }
    
    override func generatePass() -> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: EntrantInformation(firstName: firstName, lastName: lastName, streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityNumber: nil, dateOfBirth: dateOfBirth), position: nil, dateOfVendorVisit: nil, vendorCompany: nil, projectNumber: nil)
    }
}
