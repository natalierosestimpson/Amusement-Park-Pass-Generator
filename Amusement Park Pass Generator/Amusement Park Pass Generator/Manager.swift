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
    

    override func generatePass() -> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: entrantInformation, position: position, dateOfVendorVisit: nil, vendorCompany: nil, projectNumber: nil)
    }
}

