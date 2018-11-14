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
    
    func checkEntrantInformation() throws  {
        guard entrantInformation.firstName != nil else{throw EntrantInformationError.firstNameMissing }
        guard entrantInformation.lastName != nil else{throw EntrantInformationError.lastNameMissing }
        guard entrantInformation.city != nil else{throw EntrantInformationError.cityMissing }
        guard entrantInformation.zipCode != nil else{throw EntrantInformationError.zipCodeMissing }
        guard entrantInformation.streetAddress != nil else{throw EntrantInformationError.streetAddressMissing }
        guard entrantInformation.state != nil else{throw EntrantInformationError.stateMissing }
        guard entrantInformation.socialSecurityNumber == nil else{throw EntrantInformationError.socialSecurityNumberNotNeeded }
        guard entrantInformation.dateOfBirth != nil else{throw EntrantInformationError.dateOfBirthMissing }
        
        
    }
    
    override func validateEntrantInformation()  {
        do {try checkEntrantInformation()}
        catch{print( "information incomplete")}
        print("information complete")
    }
    
}
