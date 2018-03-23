//
//  MVHttpService.swift
//  MicroVote
//
//  Created by Chen on 2017/6/17.
//  Copyright © 2017年 YFY. All rights reserved.
//
import Moya
import SwiftyJSON

//protocol DecodableTargetType: Moya.TargetType {
//    associatedtype ResultType
//}


enum MVHttpService {
    case getZiXun(lottype:Int)
    case getPrecalc(playtype:Int,lottype:Int)
    case getChannelsByArea
    case getLiveChannelsByChannel(channel:Int)
    case submitFeedbackInfo(info:String,mobile:String)
    case getDevicesByOpenId(openId:String,unionId:String)
    case pushByDeviceId(openId:String,deviceId:String,pushUrl:String,unionId:String,umToken:String,brand:String,yfyToken:String,vedioType:String,vedioId:String,vedioName:String)
    case getShareChannelPlayBill(channelId:Int, menuId:Int)
    case getValidateCodeOnRegister(mobile:String)
    case checkValidateCode(mobile:String,validateCode:String,validateType:String)
    case getValidateCodeOnModifyPwd(mobile:String)
    case login(mobile:String,password:String)
    case register(mobile:String,password:String)
    case saveUserInfo(userId:Int,nickName:String,fileData:Data)
    case updatePwd(mobile:String,password:String)
    case reviewShare(id:Int, titlepic:String, shareurl:String)
    case getShareImage(url:String)
    
}

extension MVHttpService: TargetType {
    var task: Task {
        switch self {
        case .getZiXun(let lottype):
            return .requestParameters(parameters: ["lottype" : lottype], encoding: URLEncoding.queryString)
        case .getPrecalc(let playtype, let lottype):
            return .requestParameters(parameters: ["playtype" : playtype,"lottype":lottype,"lastid":"-1"], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        return ["iosversion":"1.4.5","lastid":"-1"]
    }
    
    var baseURL: URL {
        switch self {
        case .getPrecalc:
            return URL(string: "http://115.29.175.83/cpyc/")!
        case .submitFeedbackInfo(_,_),.getDevicesByOpenId,.pushByDeviceId:
            return URL(string: "http://screenshare.otvcloud.com/wechat/")!
        case .getShareChannelPlayBill, .reviewShare:
            return URL(string: "http://liveclips.otvcloud.com/eshare/php/")!
        case .getValidateCodeOnRegister,.checkValidateCode,.login,.register,.saveUserInfo,.updatePwd,.getValidateCodeOnModifyPwd:
            return URL(string: "http://screenshare.otvcloud.com/")!
        default:
            return URL(string: "http://115.29.175.83/cpyc/")!
        }
        
    }
    var path: String {
        switch self {
        case .getZiXun:
            return "zjnews.php"
        case .getPrecalc:
            return "getprecalc.php"
        case .getChannelsByArea:
            return "getChannelsByArea.php"
        case .getLiveChannelsByChannel:
            return "getLiveChannelsByChannel.php"
        case .submitFeedbackInfo(_, _):
            return "feedbackInfo"
        case .getDevicesByOpenId:
            return "getDevicesByOpenId"
        case .pushByDeviceId:
            return "pushByDeviceId"
        case .getShareChannelPlayBill:
            return "getShareChannelPlayBill.php"
        case .getValidateCodeOnRegister(_):
            return "users/getValidateCodeOnRegister"
        case .checkValidateCode(_,_,_):
            return "users/checkValidateCode"
        case .login(_,_):
            return "users/login"
        case .register(_,_):
            return "users/register"
        case .saveUserInfo(_, _, _):
            return "users/saveUserInfo"
        case .updatePwd(_, _):
            return "users/updatePwd"
        case .getValidateCodeOnModifyPwd(_):
            return "users/getValidateCodeOnModifyPwd"
        case .reviewShare:
            return "review_share.php"
        case .getShareImage:
            return "getShareImage.php"
        }

    }
    var method: Moya.Method {
        switch self {
        case .getValidateCodeOnRegister(_),.checkValidateCode(_,_,_),.login(_,_),.register(_,_),.saveUserInfo(_, _, _),.updatePwd(_, _),.getValidateCodeOnModifyPwd(_):
            return .post
        default:
            return .get
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .getZiXun(let lottype):
            return ["lottype":lottype]
        case .getPrecalc(let playtype, let lottype):
            return ["playtype":playtype,"lottype":lottype,"lastid":-1]
        case .getChannelsByArea:
            return ["areaId":1000]
        case .getLiveChannelsByChannel(let channel):
            return ["channel": channel]
        case .submitFeedbackInfo(let info, let mobile):
            return ["info":info,"mobile":mobile]
        case .getDevicesByOpenId(let openId,let unionId):
            return ["openId":openId,"unionId":unionId,"channelId":0]
        case .pushByDeviceId(let openId ,let deviceId,let pushUrl,let unionId,let umToken,
                             let brand,let yfyToken,let vedioType,let vedioId,let vedioName):
            
            return ["openId":openId,"deviceId":deviceId,"pushUrl":pushUrl,
                    "channelId":0,"unionId":unionId,"umToken":umToken,
                    "brand":brand,"yfyToken":yfyToken,"vedioType":vedioType,
                    "vedioId":vedioId,"vedioName":vedioName]

        case .getShareChannelPlayBill(let channelId, let menuId):
            let date = Int(NSDate().timeIntervalSince1970)
            return ["id":menuId,"channel":channelId,"day":date]
        case .getValidateCodeOnRegister(let mobile),.getValidateCodeOnModifyPwd(let mobile):
            return ["mobile":mobile]
        case .checkValidateCode(let mobile,let validateCode,let validateType):
            return ["mobile":mobile,"validateCode":validateCode,"validateType":validateType]
        case .login(let mobile,let password),.register(let mobile,let password),.updatePwd(let mobile,let password):
            return ["mobile":mobile,"password":password]
        case .saveUserInfo(let userId, let nickName, _):
            return ["userId":userId,"nickName":nickName]
        case .reviewShare(let id, let titlepic, let shareurl):
            return ["id":id,"userid":"1","text":"","starttime":self.getCurrentDateStr(),"offset":60,"channel":"","titlepic":titlepic,"shareurl":shareurl]
        case .getShareImage(let url):
            
//            let formart = DateFormatter()
//            formart.locale = Locale.current
//            formart.dateFormat = "yyyyMMdd"
//            let dayStr = formart.string(from: NSDate() as Date)
//            
//            formart.dateFormat = "HHmmss"
//            let timeStr = formart.string(from: NSDate() as Date)
//            
//            let startTime = dayStr + "T" + timeStr
//            debugPrint("dateStr = \(startTime)")
            return ["url":url,"starttime":self.getCurrentDateStr(),"offset":60,"try":0]
        }
    }
    
    func getCurrentDateStr()-> String! {
        let formart = DateFormatter()
        formart.locale = Locale.current
        formart.dateFormat = "yyyyMMdd"
        let dayStr = formart.string(from: NSDate() as Date)
        
        formart.dateFormat = "HHmmss"
        let timeStr = formart.string(from: NSDate() as Date)
        
        let startTime = dayStr + "T" + timeStr
        return startTime
    }
    
    var parameterEncoding: ParameterEncoding {
        /*switch self {
        case .getChannelsByArea,.getLiveChannelsByChannel:
            return URLEncoding.default // Send parameters in URL for GET, DELETE and HEAD. For other HTTP methods, parameters will be
        }*/
        switch self {
        case .getValidateCodeOnRegister(_),.checkValidateCode(_,_,_),.login(_,_),.register(_,_),.updatePwd(_, _),.getValidateCodeOnModifyPwd(_):
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    var sampleData: Data {
        switch self {
        case .getChannelsByArea:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        case .getLiveChannelsByChannel(let channel):
            return "{\"id\": \(channel), \"first_name\": \"Harry\", \"last_name\": \"Potter\"}".utf8Encoded
        default:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
    }
    
    /*var multipartBody: [MultipartFormData]? {
        switch self {
        case .saveUserInfo(_,_,let fileData):
            return [MultipartFormData(provider: .data(fileData), name: "file", fileName: "avatar.png", mimeType:"image/png")]
        default:
            return nil
        }
    }*/

//    var task: Task {
//        switch self {
//        case .getChannelsByArea, .getLiveChannelsByChannel:
//            return .request
//        case .saveUserInfo(_, _, let fileData):
//            return .upload(UploadType.multipart([MultipartFormData.init(provider: .data(fileData), name: "file", fileName: "avatar.png", mimeType: "image/png")]))
//        default:
//            return .request
//        }
//        return .request
//    }
    
}


public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}



