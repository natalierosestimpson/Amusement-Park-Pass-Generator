//define the subcategories of Guest
enum GuestType {
    case classic
    case vip
    case freeChild
    //case seasonPass
    //case senior
}


//define Guest, a subclass of Entrant
//define the particular access settings that apply to Guest
class Guest: Entrant {
    var guestType: GuestType
    
    
    init (entrantType: EntrantType, guestType: GuestType) {
        self.guestType = guestType
        super.init(entrantType: entrantType)
    }
    
    override func areaAccess () -> AreaAccess {
        return AreaAccess(amusementAreas: true, kitchenAreas: false, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
    }
    
    override func rideAccess() -> RideAccess {
        switch guestType {
        case .vip/*, .senior, .seasonPass*/: return RideAccess(accessAllRides: true, skipAllRideLines: true)
        default: return RideAccess(accessAllRides: true, skipAllRideLines: false)
        }
}

    override func discountAccess() -> DiscountAccess {
        switch guestType {
        case .classic, .freeChild : return DiscountAccess(discountOnFood: 0.0, discountOnMerchandise: 0.0)
        case .vip/*, .seasonPass*/: return DiscountAccess(discountOnFood: 0.10, discountOnMerchandise: 0.20)
            //case .senior: return DiscountAccess(discountOnFood: 0.10, discountOnMerchandise: 0.10)
        }
    }
}


