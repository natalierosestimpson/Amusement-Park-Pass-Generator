import UIKit

//define a subclass of Guest for season ticket holders
//personal information needed in season ticket pass

class SeasonGuest: Guest {
    var entrantInformation: EntrantInformation
    
    init(entrantInformation: EntrantInformation){
        self.entrantInformation = entrantInformation
        super.init(guestType: .seasonPass)
    }
        
    override func generatePass()-> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: entrantInformation, position: nil, dateOfVendorVisit: nil, vendorCompany: nil, projectNumber: nil)
        
    }
    
    
}
