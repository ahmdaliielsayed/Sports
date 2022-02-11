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
    func getLeagueData()->Country
    func navigateToTeamDetailsVC(team:Team)
}


//MARK:-LastestEventsCellViewProtocol
protocol LastestEventsCellViewProtocol {
    //func updateImg()
    func updateTeamsName(fisrtTeam : String,secondTeam : String)
    func updateResult(result:String)
    func updateFirstTeamImgs(firstTeamimg:String)
    func updateSecondTeamImgs(secondTeamimg:String)
    func updateDate(date:String,time:String)
}


//MARK:-upcomingEventCellViewProtocol
protocol upcomingEventCellViewProtocol {
    func updateTeamsName(firstTeam : String,secondTeam : String)
    func getDate(date:String,time:String)
    func updateFirstTeamImgs(firstTeamimg:String)
    func updateSecondTeamImgs(secondTeamimg:String)
}


//MARK:LEAGUEDETAILS PRESENTER
class LeagueDetailsPresenter{
    
    
//MARK:Property section...........................
    private weak var view : LeagueDetailsViewProtocol?
    private var upcomingEvents = [Event]()
    private var latestEvents = [Event]()
    private var teams = [Team]()
    private var leagueName : String?
    private var interactorCD: CoreDataManager?
    private var leagueTeams = [Team]()
    
//MARK:Init
    init(view:LeagueDetailsViewProtocol, appDelegate: AppDelegate) {
        self.view = view
        self.interactorCD = CoreDataManager(appDelegate: appDelegate)
    }

    func viewdidload(){
        Event.latestEventCount = 0
        Event.upcomingEventCount = 0
        getEventsData()
        getteamsData()
        
    }
    
//MARK:Events Section........................
    

        
       
    
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
        view?.showIndicator()
        leagueApi.getLeagueDetails(leagueId: view?.getLeagueId() ?? "") {[weak self](result) in
            self?.view?.hideIndicator()
            switch result {
            case .success(let response):
                guard let eventResult = response else {return}
                self?.leagueName = eventResult.events?[0].leagueName
                for res in eventResult.events ?? [] {
                    self?.addEvent(newEvent:res)
                }
                self?.view?.updateView()
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
            dateFormatter.dateFormat = "yyyy-MM-dd"
            guard let eventdate = dateFormatter.date(from: newEvent.dateEvent ?? "")else{return}
            let order = Calendar.current.compare(today, to: eventdate,toGranularity: .day)
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
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd"
        guard let date = formatter.date(from: latestEvents[index].dateEvent ?? "") else {
            return
        }
        let components = date.get(.day, .month, .year)
        if let day = components.day, let month = components.month, let year = components.year {
            let dayOfWeek = date.dayOfWeek() ?? ""
            let monthOfDate = date.monthOfDate() ?? ""
            let eventTime = "\((event.time ?? "").prefix(5))"
            cell.updateDate(date: "\(dayOfWeek) \(day) \(monthOfDate)",time: eventTime)
        }
        for team in teams{
            if event.homeTeamId == team.teamid {
                cell.updateFirstTeamImgs(firstTeamimg: team.teamBadge ?? "")
            }
            else if event.awayTeamId == team.teamid{
                cell.updateSecondTeamImgs(secondTeamimg: team.teamBadge ?? "")
            }
            
        }
        
    }
    
    
    
    //MARK:--Configure upcoming cell
    func configureUpComingEventCell(cell:upcomingEventCellViewProtocol,index:Int)
    {
        let event = upcomingEvents[index]
        cell.updateTeamsName(firstTeam: event.homeTeam ?? "", secondTeam: event.awayTeam ?? "")
        //cell.getDate(date: "\(String(describing: upcomingEvents[index].dateEvent ?? ""))")
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd"
        guard let date = formatter.date(from: upcomingEvents[index].dateEvent ?? "") else {
            return
        }
        let components = date.get(.day, .month, .year)
        if let day = components.day, let month = components.month, let year = components.year {
            let dayOfWeek = date.dayOfWeek() ?? ""
            let monthOfDate = date.monthOfDate() ?? ""
            let eventTime = "\((event.time ?? "").prefix(5))"
            cell.getDate(date: "\(dayOfWeek) \(day) \(monthOfDate)", time: eventTime)
        }
        //............
        for team in teams{
            if event.homeTeamId == team.teamid {
                cell.updateFirstTeamImgs(firstTeamimg: team.teamBadge ?? "")
            }
            else if event.awayTeamId == team.teamid{
                cell.updateSecondTeamImgs(secondTeamimg: team.teamBadge ?? "")
            }
        }
        
    }
//MARK:Teams Section........................
    
    
    
   //MARK:--Fetch teams data
    func getteamsData()
    {
        let indicator = TeamAPI()
        indicator.getTeamsData(leagueName: view?.getLeagueData().strLeague ?? "") { [weak self](result) in
            switch result {
            case .success(let response):
                guard let teamsResult = response else {return}
                self?.teams = teamsResult.teams ?? []
                self?.view?.updateView()
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
//MARK:-did select team
    func didSelectTeam(index:Int)
    {
        view?.navigateToTeamDetailsVC(team: teams[index])
    }
}

