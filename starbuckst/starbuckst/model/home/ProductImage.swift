//
//  ProductImage.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/18.
//

import Foundation

// MARK: - ProductImage
struct ProductImage: Codable {
    let file: [File]
}

// MARK: - File
struct File: Codable {
    let content, cateCD, delYN, regUSER: String
    let regDT, modUSER, modDT, fileNAME: String
    let infoTABLE, fileTABLE, cateTABLE, cardTABLE: String
    let msrSEQ: Int
    let webIMAGEWEBVIEW, webIMAGETABVIEW, webIMAGEMOBVIEW, productENGNM: String
    let productCD, productNM, filePATH, cateNAME: String
    let recommend, viewYN, kcal, fat: String
    let price, newSDATE, newEDATE, sellCAT: String
    let giftVALUE, hotYN, soldOUT, frontVIEWYN: String
    let viewSDATE, viewEDATE, noteTYPE, youtubeCODE: String
    let newicon, recomm, fileMASTER, thumbnail: String
    let imgORDER, standard, unit, satFAT: String
    let transFAT, cholesterol, sugars, chabo: String
    let protein, sodium, caffeine, allergy: String
    let kcalL, fatL, satFATL, transFATL: String
    let cholesterolL, sugarsL, chaboL, proteinL: String
    let sodiumL, caffeineL, msrSEQ2, webNEW: String
    let appIMAGE, webCARDBIRTH, cardYEAR, cardMONTH: String
    let egiftCARDYN, nutTABLE, pairTABLE: String
    let proSEQ: Int
    let subVIEW, fCATECD, pcateCD, allCATECD: String
    let imgUPLOADPATH: String
    let premier: String
    let searchDATETYPE, searchSTARTDATE, searchENDDATE, search1_CATE: String?
    let search2_CATE, search3_CATE, searchSALETYPE, searchVIEWYN: String?
    let searchKEY: String
    let searchVALUE: String?
    let themeSEARCH, egiftIMGCATGCODE: String
    let pageINDEX, pageUNIT, pageSIZE, firstINDEX: Int
    let lastINDEX, recordCOUNTPERPAGE, totalCNT, rnum: Int

    enum CodingKeys: String, CodingKey {
        case content
        case cateCD = "cate_CD"
        case delYN = "del_YN"
        case regUSER = "reg_USER"
        case regDT = "reg_DT"
        case modUSER = "mod_USER"
        case modDT = "mod_DT"
        case fileNAME = "file_NAME"
        case infoTABLE = "info_TABLE"
        case fileTABLE = "file_TABLE"
        case cateTABLE = "cate_TABLE"
        case cardTABLE = "card_TABLE"
        case msrSEQ = "msr_SEQ"
        case webIMAGEWEBVIEW = "web_IMAGE_WEBVIEW"
        case webIMAGETABVIEW = "web_IMAGE_TABVIEW"
        case webIMAGEMOBVIEW = "web_IMAGE_MOBVIEW"
        case productENGNM = "product_ENGNM"
        case productCD = "product_CD"
        case productNM = "product_NM"
        case filePATH = "file_PATH"
        case cateNAME = "cate_NAME"
        case recommend
        case viewYN = "view_YN"
        case kcal, fat, price
        case newSDATE = "new_SDATE"
        case newEDATE = "new_EDATE"
        case sellCAT = "sell_CAT"
        case giftVALUE = "gift_VALUE"
        case hotYN = "hot_YN"
        case soldOUT = "sold_OUT"
        case frontVIEWYN = "front_VIEW_YN"
        case viewSDATE = "view_SDATE"
        case viewEDATE = "view_EDATE"
        case noteTYPE = "note_TYPE"
        case youtubeCODE = "youtube_CODE"
        case newicon, recomm
        case fileMASTER = "file_MASTER"
        case thumbnail
        case imgORDER = "img_ORDER"
        case standard, unit
        case satFAT = "sat_FAT"
        case transFAT = "trans_FAT"
        case cholesterol, sugars, chabo, protein, sodium, caffeine, allergy
        case kcalL = "kcal_L"
        case fatL = "fat_L"
        case satFATL = "sat_FAT_L"
        case transFATL = "trans_FAT_L"
        case cholesterolL = "cholesterol_L"
        case sugarsL = "sugars_L"
        case chaboL = "chabo_L"
        case proteinL = "protein_L"
        case sodiumL = "sodium_L"
        case caffeineL = "caffeine_L"
        case msrSEQ2 = "msr_SEQ2"
        case webNEW = "web_NEW"
        case appIMAGE = "app_IMAGE"
        case webCARDBIRTH = "web_CARD_BIRTH"
        case cardYEAR = "card_YEAR"
        case cardMONTH = "card_MONTH"
        case egiftCARDYN = "egift_CARD_YN"
        case nutTABLE = "nut_TABLE"
        case pairTABLE = "pair_TABLE"
        case proSEQ = "pro_SEQ"
        case subVIEW = "sub_VIEW"
        case fCATECD = "f_CATE_CD"
        case pcateCD = "pcate_CD"
        case allCATECD = "all_CATE_CD"
        case imgUPLOADPATH = "img_UPLOAD_PATH"
        case premier
        case searchDATETYPE = "search_DATE_TYPE"
        case searchSTARTDATE = "search_START_DATE"
        case searchENDDATE = "search_END_DATE"
        case search1_CATE = "search_1_CATE"
        case search2_CATE = "search_2_CATE"
        case search3_CATE = "search_3_CATE"
        case searchSALETYPE = "search_SALE_TYPE"
        case searchVIEWYN = "search_VIEW_YN"
        case searchKEY = "search_KEY"
        case searchVALUE = "search_VALUE"
        case themeSEARCH = "theme_SEARCH"
        case egiftIMGCATGCODE = "egift_IMG_CATG_CODE"
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
