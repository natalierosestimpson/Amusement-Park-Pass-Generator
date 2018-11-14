import UIKit

//define a subclass of Guest for children
//date of birth needed to prove entrant is indeed a child
//includes function to include date of birth in a child pass

class FreeChildGuest: Guest {
    var dateOfBirth: DateComponents
    
    
    init(dateOfBirth: DateComponents){
        self.dateOfBirth = dateOfBirth
        super.init(guestType: .freeChild)
    }
    
    override func generatePass() -> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: EntrantInformation(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityNumber: nil, dateOfBirth: dateOfBirth), position: nil, dateOfVendorVisit: nil, vendorCompany: nil, projectNumber: nil)
    }
}



