//define subcategories of Manager
enum ManagementTier {
    case shiftManager
    case generalManager
    case seniorManagegr
}

//define Manager, a subclass of Employee
//add manager specific information such as discount level and management tier
class Manager: Entrant {
    var position: ManagementTier
    var entrantInformation: EntrantInformation
    
    init(position: ManagementTier, entrantInformation: EntrantInformation) {
        self.position = position
        self.entrantInformation = entrantInformation
        super.init(entrantType: .manager)
    }
    
    override func areaAccess () -> AreaAccess {
        return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintenanceAreas: true, officeAreas: true)
    }
    
    override func discountAccess() -> DiscountAccess {
        return DiscountAccess(discountOnFood: 0.25, discountOnMerchandise: 0.25)
    }
    
    func checkEntrantInformation() throws  {
        guard entrantInformation.firstName != nil else{throw EntrantInformationError.firstNameMissing
        }
        guard entrantInformation.lastName != nil else{throw EntrantInformationError.lastNameMissing }
        guard entrantInformation.city != nil else{throw EntrantInformationError.cityMissing }
        guard entrantInformation.zipCode != nil else{throw EntrantInformationError.zipCodeMissing }
        guard entrantInformation.streetAddress != nil else{throw EntrantInformationError.streetAddressMissing }
        guard entrantInformation.state != nil else{throw EntrantInformationError.stateMissing }
        guard entrantInformation.socialSecurityNumber != nil else{throw EntrantInformationError.socialSecurityNumberMissing }
        guard entrantInformation.dateOfBirth != nil else{throw EntrantInformationError.dateOfBirthMissing }
        
        
    }
    
    override func validateEntrantInformation()  {
        do {try checkEntrantInformation()}
        catch{print( "information incomplete")}
        print("information complete")
    }
    
    
    override func generatePass() -> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: entrantInformation, position: position, dateOfVendorVisit: nil, vendorCompany: nil, projectNumber: nil)
    }
}

