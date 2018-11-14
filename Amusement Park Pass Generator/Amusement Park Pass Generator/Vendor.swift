import UIKit

enum vendorCompany {
    case acme
    case orkin
    case fedex
    case nkElectrical
}


class Vendor: Entrant {
    
    var dateOfBirth: DateComponents
    var firstName: String
    var lastName: String
    var dateOfVendorVisit: DateComponents
    var vendorCompany: vendorCompany
 
    init(firstName: String, lastName: String, dateOfBirth: DateComponents, vendorCompany: vendorCompany) {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.dateOfVendorVisit = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        self.vendorCompany = vendorCompany
        super.init(entrantType: .vendor)
    }
 
    override func areaAccess () -> AreaAccess {
        switch vendorCompany {
        case .acme: return AreaAccess(amusementAreas: false, kitchenAreas: false, rideControlAreas: true, maintenanceAreas: false, officeAreas: false)
        case .orkin: return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintenanceAreas: false, officeAreas: false)
        case .fedex: return AreaAccess(amusementAreas: false, kitchenAreas: false, rideControlAreas: false, maintenanceAreas: true, officeAreas: true)
        case .nkElectrical: return AreaAccess(amusementAreas: true, kitchenAreas: true, rideControlAreas: true, maintenanceAreas: true, officeAreas: true)
        }
    }
    
    override func generatePass() -> EntrantPass {
        return EntrantPass(areaAccess: self.areaAccess(), rideAccess: self.rideAccess(), discountAccess: self.discountAccess(), information: EntrantInformation(firstName: firstName, lastName: lastName, streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityNumber: nil, dateOfBirth: dateOfBirth), position: nil, dateOfVendorVisit: dateOfVendorVisit, vendorCompany: vendorCompany, projectNumber: nil)
    }
 }

