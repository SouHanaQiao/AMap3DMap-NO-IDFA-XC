//
//  MapView.swift
//  Example
//
//  Created by 葬花桥 on 2023/6/9.
//

import UIKit
import MAMapKit

/// 地图View
class BGMapView: UIView {
    lazy var mapView: MAMapView = {
        let mapView = MAMapView(frame: self.bounds)
        mapView.delegate = self
        mapView.showsUserLocation = false
        mapView.showsCompass = false //指南针
        mapView.showsScale = false   //比例尺
        mapView.isRotateEnabled = false
        mapView.isRotateCameraEnabled = false
        mapView.isShowTraffic = false
        mapView.customMapStyleEnabled = true
        
        mapView.userTrackingMode = .none
        //设置缩放比例
        mapView.setZoomLevel(3, animated: true)
        /// 以手势点为缩放中心
        mapView.zoomingInPivotsAroundAnchorPoint = false
        mapView.centerCoordinate = .init(latitude: -8, longitude: 105)
        mapView.setCenter(.init(latitude: -8, longitude: 105), animated: true)
        mapView.limitRegion = .init(center: .init(latitude: -2, longitude: 105), span: .init(latitudeDelta: 130, longitudeDelta: 80))
        return mapView
    }()
    
    /// 复用标识
    static var reuseIndetifier = "annotationReuseIndetifier"
    
    /// 到达区域边界折线颜色
    var polylineRendererStrokeColor = UIColor.lightGray {
        didSet {
            mapView.reloadMap()
        }
    }
    /// 地图上标注颜色
    var annotationColor = #colorLiteral(red: 0, green: 1, blue: 0.7843137255, alpha: 1) {
        didSet {
            mapView.reloadMap()
        }
    }
    /// 到达次数超过40次的区域颜色
    var moreThan40Color = #colorLiteral(red: 0.2274509804, green: 0.3490196078, blue: 0.6588235294, alpha: 0.8) {
        didSet {
            mapView.reloadMap()
        }
    }
    /// 到达次数超过20次的区域颜色
    var moreThan20Color = #colorLiteral(red: 0.1764705882, green: 0.2823529412, blue: 0.5529411765, alpha: 0.8) {
        didSet {
            mapView.reloadMap()
        }
    }
    /// 到达次数超过0次的区域颜色
    var moreThan0Color = #colorLiteral(red: 0.2274509804, green: 0.3490196078, blue: 0.6588235294, alpha: 0.8) {
        didSet {
            mapView.reloadMap()
        }
    }
    
    private let options = MAMapCustomStyleOptions()
    /// 地图样式
    var styleData: Data? {
        didSet {
            options.styleData = styleData
            mapView.setCustomMapStyleOptions(options)
            mapView.reloadMap()
        }
    }
    /// 地图样式
    var styleExtraData: Data? {
        didSet {
            options.styleExtraData = styleExtraData
            mapView.setCustomMapStyleOptions(options)
            mapView.reloadMap()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initMap()
    }
    
    required init?(coder: NSCoder) {
        //        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        initMap()
    }
    
    private func initMap() {
  
        AMapServices.shared().enableHTTPS = true
//        AMapServices.shared().apiKey = BGDrivingReportManager.shared.amapApiKey
        
//        let resourceBundle = Bundle.resourceBundle
//
//        guard let path = resourceBundle.path(forResource: "style", ofType: "data"), let extraPath = resourceBundle.path(forResource: "style_extra", ofType: "data") else {
//            return
//        }
        
//        let options = MAMapCustomStyleOptions()
        
//        if let data = try? NSData(contentsOfFile: path) as Data {
//            options.styleData = data
//        }
//
//        if let extraData = try? NSData(contentsOfFile: extraPath) as Data {
//            options.styleExtraData = extraData
//        }
        
//        mapView.setCustomMapStyleOptions(options)
        
        addSubview(mapView)
    }
    
}

// MARK: - MAMapViewDelegate
extension BGMapView: MAMapViewDelegate {
    func mapViewRequireLocationAuth(_ locationManager: CLLocationManager!) {
        locationManager.requestAlwaysAuthorization()
    }
    
    
    /**
     * @brief 根据anntation生成对应的View。
     
     注意：
     1、5.1.0后由于定位蓝点增加了平滑移动功能，如果在开启定位的情况先添加annotation，需要在此回调方法中判断annotation是否为MAUserLocation，从而返回正确的View。
     if ([annotation isKindOfClass:[MAUserLocation class]]) {
     return nil;
     }
     
     2、请不要在此回调中对annotation进行select和deselect操作，此时annotationView还未添加到mapview。
     
     * @param mapView 地图View
     * @param annotation 指定的标注
     * @return 生成的标注View
     */
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if annotation.isKind(of: BGCarPointAnnotation.self) {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Self.reuseIndetifier)
            
            func setup(annotationView: inout MAAnnotationView) {
                //        annotationView.image = [UIImage imageNamed:@"bg_icon_drivereport_calendar"];
                //设置中心点偏移，使得标注底部中间点成为经纬度对应点
                annotationView.centerOffset = .zero
                let view = UIView(frame: .init(x: 0, y: 0, width: 4, height: 4))
                annotationView.addSubview(view)
                view.backgroundColor = annotationColor
                view.layer.cornerRadius = 2
                view.center = .init(x: annotationView.imageView.center.x, y: annotationView.imageView.center.y - 1)
            }
            
            guard var annotationView else {
                var annotationView: MAAnnotationView?
                if var view = MAAnnotationView(annotation: annotation, reuseIdentifier: Self.reuseIndetifier) {
                    setup(annotationView: &view)
                    annotationView = view
                }
                
                return annotationView
            }
            
            setup(annotationView: &annotationView)
            
            return annotationView
        }
        return nil
    }
}

class BGCarPointAnnotation: MAPointAnnotation {
    
}
