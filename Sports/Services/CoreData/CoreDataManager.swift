//
//  CoreDataManager.swift
//  Sports
//
//  Created by Ahmed on 2/2/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    var appDelegate: AppDelegate!
    var appContext: NSManagedObjectContext!
    
    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
        appContext = appDelegate.persistentContainer.viewContext
    }
    
    func insertRow(country: Country) {
        
        let entity = NSEntityDescription.entity(forEntityName: "CountryModel", in: appContext)
        let countryRow = NSManagedObject(entity: entity!, insertInto: appContext)
        countryRow.setValue(country.idLeague, forKey: "idLeague")
        countryRow.setValue(country.idSoccerXML, forKey: "idSoccerXML")
        countryRow.setValue(country.idAPIfootball, forKey: "idAPIfootball")
        countryRow.setValue(country.strSport, forKey: "strSport")
        countryRow.setValue(country.strLeague, forKey: "strLeague")
        countryRow.setValue(country.strLeagueAlternate, forKey: "strLeagueAlternate")
        countryRow.setValue(country.strDivision, forKey: "strDivision")
        countryRow.setValue(country.idCup, forKey: "idCup")
        countryRow.setValue(country.strCurrentSeason, forKey: "strCurrentSeason")
        countryRow.setValue(country.intFormedYear, forKey: "intFormedYear")
        countryRow.setValue(country.dateFirstEvent, forKey: "dateFirstEvent")
        countryRow.setValue(country.strGender, forKey: "strGender")
        countryRow.setValue(country.strCountry, forKey: "strCountry")
        countryRow.setValue(country.strWebsite, forKey: "strWebsite")
        countryRow.setValue(country.strFacebook, forKey: "strFacebook")
        countryRow.setValue(country.strInstagram, forKey: "strInstagram")
        countryRow.setValue(country.strTwitter, forKey: "strTwitter")
        countryRow.setValue(country.strYoutube, forKey: "strYoutube")
        countryRow.setValue(country.strRSS, forKey: "strRSS")
        countryRow.setValue(country.strDescriptionEN, forKey: "strDescriptionEN")
        countryRow.setValue(country.strDescriptionDE, forKey: "strDescriptionDE")
        countryRow.setValue(country.strDescriptionFR, forKey: "strDescriptionFR")
        countryRow.setValue(country.strDescriptionIT, forKey: "strDescriptionIT")
        countryRow.setValue(country.strDescriptionCN, forKey: "strDescriptionCN")
        countryRow.setValue(country.strDescriptionJP, forKey: "strDescriptionJP")
        countryRow.setValue(country.strDescriptionRU, forKey: "strDescriptionRU")
        countryRow.setValue(country.strDescriptionES, forKey: "strDescriptionES")
        countryRow.setValue(country.strDescriptionPT, forKey: "strDescriptionPT")
        countryRow.setValue(country.strDescriptionSE, forKey: "strDescriptionSE")
        countryRow.setValue(country.strDescriptionNL, forKey: "strDescriptionNL")
        countryRow.setValue(country.strDescriptionHU, forKey: "strDescriptionHU")
        countryRow.setValue(country.strDescriptionNO, forKey: "strDescriptionNO")
        countryRow.setValue(country.strDescriptionPL, forKey: "strDescriptionPL")
        countryRow.setValue(country.strDescriptionIL, forKey: "strDescriptionIL")
        countryRow.setValue(country.strTvRights, forKey: "strTvRights")
        countryRow.setValue(country.strFanart1, forKey: "strFanart1")
        countryRow.setValue(country.strFanart2, forKey: "strFanart2")
        countryRow.setValue(country.strFanart3, forKey: "strFanart3")
        countryRow.setValue(country.strFanart4, forKey: "strFanart4")
        countryRow.setValue(country.strBanner, forKey: "strBanner")
        countryRow.setValue(country.strBadge, forKey: "strBadge")
        countryRow.setValue(country.strLogo, forKey: "strLogo")
        countryRow.setValue(country.strPoster, forKey: "strPoster")
        countryRow.setValue(country.strTrophy, forKey: "strTrophy")
        countryRow.setValue(country.strNaming, forKey: "strNaming")
        countryRow.setValue(country.strComplete, forKey: "strComplete")
        countryRow.setValue(country.strLocked, forKey: "strLocked")
        
        do {
            try appContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func selectAllCountrys() -> [CountryModel] {
        var countrysList: [CountryModel] = []
        
        do {
            countrysList = try appContext.fetch(NSFetchRequest<NSManagedObject>(entityName: "CountryModel")) as! [CountryModel]
        } catch let error {
            print(error.localizedDescription)
        }
        
        return countrysList
    }
    
    func deleteRow(idLeague: String) {
                
        let countrys = selectAllCountrys()
        
        for country in countrys {
            if idLeague == country.idLeague {
                appContext.delete(country)
                break;
            }
        }
        
        do {
            try appContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func isLeagueExist(idLeague: String) -> Bool {
        
        var exist: Bool = false
        
        let leagues = selectAllCountrys()
        
        for league in leagues {
            if idLeague == league.idLeague {
                exist = true
                break;
            }
        }
        
        return exist
    }
}
