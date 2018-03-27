//
//  ViewController.swift
//  iPay
//
//  Created by Mahnoor Fatima on 3/26/18.
//  Copyright © 2018 Mahnoor Fatima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectView: UICollectionView!
    
    var TrafficData:[String] = ["Alabama","Maryland","Virginia","Washington DC","New York","New Jersey","Delaware","Pennsylvania","West Virginia","North Carolina","South Carolina","Texas","Utah","Florida","Georgia","Nevada","Missouri","California","EZPass","Express Lanes"]
    var TrafficImageNames:[String] = ["talabama.jpg","tmaryland.jpg","tvirginia.png","twashington_dc.jpg","tnew_york.jpg","tnew_jersey.jpg","tdelawar.png","tpennsylvnia.png","twest_virginia.jpg","tnorth_carolina.jpg","tsouth_carolina.jpg","ttexas.jpg","tutah.jpg","tflorida.jpg","tgeorgia.jpg","tnevada.png","tmissouri.jpg","tcalifornia.jpg","ezpass.png","express_lanes.png"]
    
    var TrafficURLs:[String] = ["https://traffic.alacourt.gov","https://paymentsolutions.lexisnexis.com/pc/md/city/annapolis/districtcourt",
                                "http://www.courts.state.va.us/caseinfo/tickets.html",
                                "https://dmv.dc.gov/service/pay-tickets",
                                "https://www.ncourt.com/x-press/x-onlinepayments.aspx?juris=1cbb3ad0-7f8d-4f83-b461-8474288aff77",
                                "https://portal.njcourts.gov/webe11/atswepr2/home.do",
                                "https://pubsrv.deljis.delaware.gov/ePayment/",
                                "http://www.courts.phila.gov/traffic/pay-ticket.asp",
                                "http://transportation.wv.gov/dmv/Pages/default.aspx",
                                "https://www.nc.gov/payncticket",
                                "http://sc.gov/OnlineServices/Pages/CourtPayments.aspx",
                                "https://www.trafficpayment.com/",
                                "https://dotnet.slcgov.com/court/courtonlinepayment/Default.aspx",
                                "https://www.myfloridacounty.com/ttpay/",
                                "https://online.dds.ga.gov/OnlineServices/SSIntro.aspx",
                                "https://nvcourts.gov/Supreme/How_Do_I/Pay_a_Ticket",
                                "https://www.mofcc.com/pbw/",
                                "https://ww2.lacourt.org/traffic2b/ui/trafficOS.aspx?s=1&language=1",
                                "https://www.ezpassva.com/EZPages/RegisterOnTheGo.aspx"]
    
    
    var CourtData:[String] = ["Alabama","Maryland","Virginia","Washington DC","New York","NewJersey","Delaware","Pennsylvania","West Virginia","North Carolina","SouthCarolina","Texas","Utah","Florida","Georgia","Nevada","Missouri","California"]
    var CourtImageNames:[String] = ["alabama.png","maryland.png","virginia.jpg","washingtonDC.jpg","newYork.jpg","newJersay.png","delware.png","pennsylvania.png","westVirginia.jpg","northCarolina.png","southCarolina.jpg","texas.jpg","utah.jpg","florida.png","georgia.png","nevada.png","missourist.jpg","california.png"]
    var CourtURLs:[String] = ["https://www.ncourt.com/x-press/x-onlinepayments.aspx?juris=1cbb3ad0-7f8d-4f83-b461-8474288aff11","http://casesearch.courts.state.md.us/casesearch//processDisclaimer.jis","http://www.courts.state.va.us/online/home.html","https://www.dccourts.gov/","https://www.ncourt.com/x-press/x-onlinepayments.aspx?juris=1cbb3ad0-7f8d-4f83-b461-8474288aff77","https://portal.njcourts.gov/webe11/atswepr2/home.do","https://pubsrv.deljis.delaware.gov/ePayment/","https://ujsportal.pacourts.us/ePay.aspx","http://www.courtswv.gov/","http://onlineservices.nccourts.org","http://www.sc.gov/OnlineServices/Pages/courtPayments.aspx#municipalities","http://dallascityhall.com/departments/courtdetentionservices/Pages/Pay-Your-Ticket.aspx","https://www.utcourts.gov/epayments","https://www.floridasafetycouncil.org/home/clerksofcourt","http://www.courtreference.com/Georgia-Court-Fine-Payments.htm","https://nvcourts.gov/Find_a_Court/Justice_Courts/","https://www.courts.mo.gov/page.jsp?id=1886","http://www.courts.ca.gov/find-my-court.htm"]
    
    var OthersURLs:[String] = ["http://www.alabama.gov/",
                               "https://www.princegeorgescountymd.gov/1902/Payment-Services",
                               "https://www.virginia.gov/government/",
                               "https://dc.gov/online-services",
                               "http://www.ny.gov/",
                               "http://www.nj.gov/",
                               "https://delaware.gov/",
                               "https://www.pa.gov/",
                               "http://www.wv.gov/services/Pages/default.aspx",
                               "https://www.nc.gov/services",
                               "http://sc.gov/OnlineServices/Pages/onlineServicesA-Z.aspx",
                               "https://texas.gov/",
                               "https://www.utah.gov/index.html",
                               "http://www.myflorida.com/",
                               "https://georgia.gov/",
                               "http://nv.gov/",
                               "https://www.mo.gov/",
                               "http://www.ca.gov/",]
    var OthersData:[String] = ["Alabama","Maryland","Virginia","Washington DC","New York","New Jersey","Delaware","Pennsylvania","West Virginia","North NC","South NC","Texas","Utah","Florida","Georgia","Nevada","Missouri","California"]
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectView.delegate = self
        collectView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller:WebViewVC = segue.destination as! WebViewVC
        controller.url = sender as! String
    }
    
    deinit {
        print("deinitialized class")
    }
    
    
}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func getCellHeaderSize(Width:CGFloat, aspectRatio:CGFloat, padding:CGFloat) -> CGSize {
        let cellWidth = (Width) - padding
        let cellHeight = cellWidth / aspectRatio
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TrafficData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectView.dequeueReusableCell(withReuseIdentifier: "PayTicket", for: indexPath) as! iPayCVCell
        if view.tag == 1 {
            cell.ticketImgView.image = UIImage(named: CourtImageNames[indexPath.row])
            cell.titleLbl.text = CourtData[indexPath.row]
        } else if view.tag == 2
        {
            cell.ticketImgView.image = UIImage(named: TrafficImageNames[indexPath.row])
            cell.titleLbl.text = TrafficData[indexPath.row]
        } else
        {
            cell.titleLbl.text = OthersData[indexPath.row]
        }
        

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let itemPerRow:CGFloat = 3
//        let paddingSpace = sectionInsets.left * (itemPerRow+1)
//        let width:CGFloat  = (view.frame.width - paddingSpace)/itemPerRow
//        return CGSize(width:width, height:width)
        
        return self.getCellHeaderSize(Width: self.view.frame.width/3, aspectRatio: 100/100, padding: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var url:String = ""
        
        if view.tag == 1 {
            url = CourtURLs[indexPath.row]
        } else if view.tag == 2
        {
            url = TrafficURLs[indexPath.row]
        } else
        {
            url = OthersURLs[indexPath.row]
        }
        self.performSegue(withIdentifier: "webviewSegue", sender: url)
    }
    
    
    
}

