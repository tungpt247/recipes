//
//  APIClient.swift
//  Recipes
//
//  Created by tungphan on 8/19/15.
//  Copyright (c) 2015 tp. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {

  // Block to be executed when request has completed.
  typealias APIClientCompletion = (data: NSData?, statusCode: Int?, response: NSURLResponse?, error: NSError?) -> ()

  // Represents an HTTP method.
  enum Method {
    case GET, POST, PUT, DELETE, OPTIONS, HEAD, PATCH, TRACE, CONNECT

    func method() -> Alamofire.Method {
      switch self {
      case .GET:
        return .GET
      case .POST:
        return .POST
      case .PUT:
        return .PUT
      case .DELETE:
        return .DELETE
      case .HEAD:
        return .HEAD
      case .OPTIONS:
        return .OPTIONS
      case PATCH:
        return .PATCH
      case TRACE:
        return .TRACE
      case .CONNECT:
        return .CONNECT
      }
    }
  }

  // Choice of parameter encoding.
  enum ParameterEncoding {
    case URL
    case JSON
    case PropertyList(NSPropertyListFormat, NSPropertyListWriteOptions)
    case Custom((URLRequestConvertible, [String: AnyObject]?) -> (NSMutableURLRequest, NSError?))

    func parameterEncoding() -> Alamofire.ParameterEncoding {
      switch self {
      case .URL:
        return .URL
      case .JSON:
        return .JSON
      case .PropertyList(let format, let options):
        return .PropertyList(format, options)
      case .Custom(let closure):
        return .Custom(closure)
      }
    }
  }
}

class APIClientProvider {
  let manager = Alamofire.Manager.sharedInstance
  // Cool stuff
}