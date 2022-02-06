//
//  LeagueDetailsPresenter.swift
//  Sports
//
//  Created by Mohamed Adel on 2/4/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
//MARK:-LeagueDetailsViewProtocol
protocol LeagueDetailsViewProtocol:class{
    func getLeagueId()->String
    func showIndicator()
    func hideIndicator()
    func updateView()
    func displayFavouriteImage(isFavourite: Bool)
}
//MARK:-LastestEventsCellViewProtocol
protocol LastestEventsCellViewProtocol {
    //func updateImg()
    func updateTeamsName(fisrtTeam : String,secondTeam : String)
    func updateResult(result:String)
}
//MARK:-upcomingEventCellViewProtocol
protocol upcomingEventCellViewProtocol {
    func updateTeamsName(firstTeam : String,secondTeam : String)
    func getDate(date:String)
}

class LeagueDetailsPresenter{
    
    private weak var view : LeagueDetailsViewProtocol?
    private var upcomingEvents = [Event]()
    private var latestEvents = [Event]()
    private var interactorCD: CoreDataManager?
    
    func viewdidload(){
        Event.latestEventCount = 0
        Event.upcomingEventCount = 0
        getEventsData()
        
    }
    init(view:LeagueDetailsViewProtocol, appDelegate: AppDelegate) {
        self.view = view
        self.interactorCD = CoreDataManager(appDelegate: appDelegate)
    }
    
    func addToFavourite(idLeague: String, country: Country) {
        let isExist = interactorCD!.isLeagueExist(idLeague: idLeague)
        if isExist {
            interactorCD!.deleteRow(idLeague: idLeague)
        } else {
            interactorCD!.insertRow(country: country)
        }
        changeIconFavourite(idLeague: idLeague)
    }
    
    func changeIconFavourite(idLeague: String) {
        let isExist = interactorCD!.isLeagueExist(idLeague: idLeague)
        view!.displayFavouriteImage(isFavourite: isExist)
    }
    
    func getEventsData()
    {
        let leagueApi:LeagueDetailsAPIProtocol = LeagueDetailsAPI()
        print("events......")
        view?.showIndicator()
        //leagueApi.getLeagueDetails(leagueId: view?.getLeagueId() ?? "") {[weak self](result) in
          leagueApi.getLeagueDetails(leagueId: "4905") {[weak self](result) in
            self?.view?.hideIndicator()
            switch result {
            
            case .success(let respone):
                guard let eventResult = respone else {return}
                for res in eventResult.events ?? [] {
                    self?.addEvent(newEvent:res)
                    print("\(String(describing: res.EvnetTitle))\n\(String(describing: res.homeTeam))\n\(String(describing: res.homeTeamId))\n\(String(describing: res.awayTeam))\n\(String(describing: res.awayTeamId))\n\(String(describing:   res.homeTeamScore))\n\(String(describing: res.awayTeamScore))\n\(String(describing: res.isFinished))\n\(String(describing: res.date))\n")
                }
                self?.view?.updateView()
                print("success......")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    func addEvent(newEvent:Event)
    {
        if newEvent.date != nil{
            let today = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let date = dateFormatter.date(from:newEvent.date ?? "")!
            let order = Calendar.current.compare(today, to: date,toGranularity: .day)
            switch order {
            case .orderedDescending:
                Event.latestEventCount! += 1
                latestEvents.append(newEvent)
                newEvent.isFinished = true
            case .orderedSame:
                Event.upcomingEventCount! += 1
                newEvent.date = "Today"
                upcomingEvents.append(newEvent)
                newEvent.isFinished = false
            default:
                Event.upcomingEventCount! += 1
                upcomingEvents.append(newEvent)
                newEvent.isFinished = false
            }
        }
        else{
            
        }
    }
    
        func getupComingCount()->Int{
            return Event.upcomingEventCount ?? 0
        }
        func getlatestCount()->Int{
            return Event.latestEventCount ?? 0
        }
        func configureLatestEventCell(cell:LastestEventsCellViewProtocol,index:Int)
        {
            let event = latestEvents[index]
            cell.updateTeamsName(fisrtTeam: event.homeTeam ?? "", secondTeam: event.awayTeam ?? "")
            cell.updateResult(result: "\(event.homeTeamScore ?? "") : \(event.awayTeamScore ?? "")")
        }
        func configureUpComingEventCell(cell:upcomingEventCellViewProtocol,index:Int)
        {
            let event = upcomingEvents[index]
            cell.updateTeamsName(firstTeam: event.homeTeam ?? "", secondTeam: event.awayTeam ?? "")
        }
    
}

