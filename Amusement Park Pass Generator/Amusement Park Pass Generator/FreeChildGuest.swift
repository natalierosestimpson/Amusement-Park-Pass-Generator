import UIKit

//define a subclass of Guest for children who have free access to the park
//date of birth needed to prove entrant is indeed a child
//includes function to include date of birth in a free child pass

class FreeChildGuest: Guest {
    let dateOfBirth: DateComponents
    
    
    init(entrantType: EntrantType, guestType: GuestType, dateOfBirth: DateComponents){
        self.dateOfBirth = dateOfBirth
        super.init(entrantType: entrantType, guestType: guestType)
    }
    
    override func generatePass() -> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: EntrantInformation(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityNumber: nil, dateOfBirth: dateOfBirth), position: nil)
    }
}


