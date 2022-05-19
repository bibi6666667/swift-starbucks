//
//  Events.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/13.
//

import Foundation
import UIKit

import Foundation

// MARK: - HomeEvents
struct HomeEvents: Codable {
    let list: [List]
}

// MARK: - List
struct List: Codable {
    let seq, content: String
    let menuCD: String
    let delYN, regUSER, regDT, modUSER: String
    let modDT, productCD: String
    let storeCODE: String?
    let storeNM, viewYN: String
    let proSEQ: Int
    let subVIEW: String
    let imgUPLOADPATH: String
    let searchDATETYPE, searchSTARTDATE, searchENDDATE, searchVIEWYN: String
    let searchKEY, searchVALUE: String
    let menuCDARR: String?
    let title, storeCD: String
    let storeCNT: Int
    let startDT, endDT, onlineYN, capacity: String
    let imgNM, flashNM, viewORDER, hit: String
    let storeMEMO, storeGUBUN, flashW, flashH: String
    let startHOUR, startMINUTE, endHOUR, endMINUTE: String
    let contentMOBILE, etcMEMO, topYN, topDATE: String
    let stat: String
    let viewTYPE: String
    let viewDATE, viewSDT1, viewSDT2, viewEDT1: String
    let viewEDT2, contentTABLET: String
    let proCONSEQ, strSEQ, fileSEQ: Int
    let fileCD, fileNM, webTHUM, mobTHUM: String
    let tabTHUM, webIMG, mobIMG, tabIMG: String
    let webBTNIMG, appBTNIMG: String
    let webTHUMSEQ, mobTHUMSEQ, tabTHUMSEQ, webIMGSEQ: Int
    let mobIMGSEQ, tabIMGSEQ, pagesize, page: Int
    let record: Int
    let status, searchMENUCD, searchENDYN: String
    let fileDELARRAY: String?
    let eventPAGENAME, sbtitleNAME: String
    let webXPSRYN, appXPSRYN, contnCTNCNTNT, contnCNTNTXPSRDVSNCODE: String?
    let webCONTNBTNLINKURL, appCONTNBTNLINKURL, webCONTNLINKNWNDWYN, bannerTYPE: String?
    let webxpsrseqc: String
    let pageINDEX, pageUNIT, pageSIZE, firstINDEX: Int
    let lastINDEX, recordCOUNTPERPAGE, totalCNT, rnum: Int

    enum CodingKeys: String, CodingKey {
        case seq, content
        case menuCD = "menu_CD"
        case delYN = "del_YN"
        case regUSER = "reg_USER"
        case regDT = "reg_DT"
        case modUSER = "mod_USER"
        case modDT = "mod_DT"
        case productCD = "product_CD"
        case storeCODE = "store_CODE"
        case storeNM = "store_NM"
        case viewYN = "view_YN"
        case proSEQ = "pro_SEQ"
        case subVIEW = "sub_VIEW"
        case imgUPLOADPATH = "img_UPLOAD_PATH"
        case searchDATETYPE = "search_DATE_TYPE"
        case searchSTARTDATE = "search_START_DATE"
        case searchENDDATE = "search_END_DATE"
        case searchVIEWYN = "search_VIEW_YN"
        case searchKEY = "search_KEY"
        case searchVALUE = "search_VALUE"
        case menuCDARR = "menu_CD_ARR"
        case title
        case storeCD = "store_CD"
        case storeCNT = "store_CNT"
        case startDT = "start_DT"
        case endDT = "end_DT"
        case onlineYN = "online_YN"
        case capacity
        case imgNM = "img_NM"
        case flashNM = "flash_NM"
        case viewORDER = "view_ORDER"
        case hit
        case storeMEMO = "store_MEMO"
        case storeGUBUN = "store_GUBUN"
        case flashW = "flash_W"
        case flashH = "flash_H"
        case startHOUR = "start_HOUR"
        case startMINUTE = "start_MINUTE"
        case endHOUR = "end_HOUR"
        case endMINUTE = "end_MINUTE"
        case contentMOBILE = "content_MOBILE"
        case etcMEMO = "etc_MEMO"
        case topYN = "top_YN"
        case topDATE = "top_DATE"
        case stat
        case viewTYPE = "view_TYPE"
        case viewDATE = "view_DATE"
        case viewSDT1 = "view_SDT1"
        case viewSDT2 = "view_SDT2"
        case viewEDT1 = "view_EDT1"
        case viewEDT2 = "view_EDT2"
        case contentTABLET = "content_TABLET"
        case proCONSEQ = "pro_CON_SEQ"
        case strSEQ = "str_SEQ"
        case fileSEQ = "file_SEQ"
        case fileCD = "file_CD"
        case fileNM = "file_NM"
        case webTHUM = "web_THUM"
        case mobTHUM = "mob_THUM"
        case tabTHUM = "tab_THUM"
        case webIMG = "web_IMG"
        case mobIMG = "mob_IMG"
        case tabIMG = "tab_IMG"
        case webBTNIMG = "web_BTN_IMG"
        case appBTNIMG = "app_BTN_IMG"
        case webTHUMSEQ = "web_THUM_SEQ"
        case mobTHUMSEQ = "mob_THUM_SEQ"
        case tabTHUMSEQ = "tab_THUM_SEQ"
        case webIMGSEQ = "web_IMG_SEQ"
        case mobIMGSEQ = "mob_IMG_SEQ"
        case tabIMGSEQ = "tab_IMG_SEQ"
        case pagesize, page, record, status
        case searchMENUCD = "search_MENU_CD"
        case searchENDYN = "search_END_YN"
        case fileDELARRAY = "file_DEL_ARRAY"
        case eventPAGENAME = "event_PAGE_NAME"
        case sbtitleNAME = "sbtitle_NAME"
        case webXPSRYN = "web_XPSR_YN"
        case appXPSRYN = "app_XPSR_YN"
        case contnCTNCNTNT = "contn_CTN_CNTNT"
        case contnCNTNTXPSRDVSNCODE = "contn_CNTNT_XPSR_DVSN_CODE"
        case webCONTNBTNLINKURL = "web_CONTN_BTN_LINK_URL"
        case appCONTNBTNLINKURL = "app_CONTN_BTN_LINK_URL"
        case webCONTNLINKNWNDWYN = "web_CONTN_LINK_NWNDW_YN"
        case bannerTYPE = "banner_TYPE"
        case webxpsrseqc
        case pageINDEX = "page_INDEX"
        case pageUNIT = "page_UNIT"
        case pageSIZE = "page_SIZE"
        case firstINDEX = "first_INDEX"
        case lastINDEX = "last_INDEX"
        case recordCOUNTPERPAGE = "record_COUNT_PER_PAGE"
        case totalCNT = "total_CNT"
        case rnum
    }
}
