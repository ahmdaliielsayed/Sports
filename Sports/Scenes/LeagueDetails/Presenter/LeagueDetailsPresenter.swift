//
//  LeagueDetailsPresenter.swift
//  Sports
//
//  Created by Mohamed Adel on 2/4/22.
//  Copyright © 2022 Ahmed Ali. All rights reserved.
//

import Foundation
//MARK:NavigatetoTeamDetailsProtocol
protocol NavigateToTeamDetailsProtocols{
    func navigateToTeamDetailsVC(team:Team)
}

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


//MARK:LEAGUEDETAILS PRESENTER
class LeagueDetailsPresenter{
    
    
//MARK:Property section...........................
    private weak var view : LeagueDetailsViewProtocol?
    private var upcomingEvents = [Event]()
    private var latestEvents = [Event]()
    private var teams = [Team]()
    private var leagueName : String?
    
//MARK:Init
    init(view:LeagueDetailsViewProtocol) {
        self.view = view
    }
    
    
//MARK:Viewdidload

    private var interactorCD: CoreDataManager?
    

    func viewdidload(){
        Event.latestEventCount = 0
        Event.upcomingEventCount = 0
        getEventsData()
        getteamsData()
    }
    
//MARK:Events Section........................
    

        
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

    
    
    //MARK:--GetEventsData
    func getEventsData()
    {
        let leagueApi:LeagueDetailsAPIProtocol = LeagueDetailsAPI()
        print("events......")
        view?.showIndicator()
        leagueApi.getLeagueDetails(leagueId: view?.getLeagueId() ?? "") {[weak self](result) in
         //leagueApi.getLeagueDetails(leagueId: "4905") {[weak self](result) in
            self?.view?.hideIndicator()
            switch result {
            case .success(let response):
                guard let eventResult = response else {return}
                self?.leagueName = eventResult.events?[0].leagueName
                for res in eventResult.events ?? [] {
                    self?.addEvent(newEvent:res)
                    print("\(String(describing: res.EvnetTitle))\n\(String(describing: res.leagueName))\n\(String(describing: res.homeTeam))\n\(String(describing: res.homeTeamId))\n\(String(describing: res.awayTeam))\n\(String(describing: res.awayTeamId))\n\(String(describing:   res.homeTeamScore))\n\(String(describing: res.awayTeamScore))\n\(String(describing: res.isFinished))\n\(String(describing: res.date))\n")
                }
                self?.view?.updateView()
                print("success......")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK:--AddEvent
    /*
        Is there any better way to handle this ????
    */
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

    //MARK:--GetupcomingCount
    func getupComingCount()->Int{
        return Event.upcomingEventCount ?? 0
    }
    
    
    
     //MARK:--GetlatestCount
    func getlatestCount()->Int{
        return Event.latestEventCount ?? 0
    }
    
    
    
    
     //MARK:--Configure latest cell
    func configureLatestEventCell(cell:LastestEventsCellViewProtocol,index:Int)
    {
        let event = latestEvents[index]
        cell.updateTeamsName(fisrtTeam: event.homeTeam ?? "", secondTeam: event.awayTeam ?? "")
        cell.updateResult(result: "\(event.homeTeamScore ?? "") : \(event.awayTeamScore ?? "")")
    }
    
    
    
    //MARK:--Configure upcoming cell
    func configureUpComingEventCell(cell:upcomingEventCellViewProtocol,index:Int)
    {
        let event = upcomingEvents[index]
        cell.updateTeamsName(firstTeam: event.homeTeam ?? "", secondTeam: event.awayTeam ?? "")
        cell.getDate(date: "\(String(describing: upcomingEvents[index].dateEvent ?? ""))")
    }
//MARK:Teams Section........................
    
    
    
   //MARK:--Fetch teams data
    func getteamsData()
    {
        let indicator = TeamAPI()
        indicator.getTeamsData(leagueName: leagueName ?? "") { [weak self](result) in
            print("fetching teams dataa...............")
            switch result {
            case .success(let response):
                guard let teamsResult = response else {return}
                self?.teams = teamsResult.teams ?? []
                print("success.........................")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    //MARK:--GetTeamsCount
    func getTeamsCount()->Int
    {
        return teams.count
    }
    //MARK:--Configure teams cell
    func configureTeamsData(cell:GetTeamDataProtocol,index:Int)
    {
        cell.getTeam(name: teams[index].teamName ?? "", img: teams[index].teamBadge ?? "")
    }
}

