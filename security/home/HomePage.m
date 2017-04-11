//
//  HomePage.m
//  security
//
//  Created by by.huang on 2017/4/7.
//  Copyright © 2017年 by.huang. All rights reserved.
//

#import "HomePage.h"



#define Latitude 22.58962
#define Lontitude 113.920137

@interface HomePage ()

@property (strong, nonatomic) BMKMapView *mapView;

@property (strong, nonatomic) BMKLocationService *locService;

@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil;
}

-(void)initView
{
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, NavigationBar_HEIGHT + StatuBar_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-(StatuBar_HEIGHT + NavigationBar_HEIGHT))];
    [_mapView setMapType:BMKMapTypeStandard];
    [_mapView setBuildingsEnabled:YES];
    [_mapView setTrafficEnabled:YES];
    _mapView.showsUserLocation = YES;
    _mapView.compassPosition = CGPointMake(20, 20);
    [_mapView setZoomLevel:21];
    [_mapView setCenterCoordinate:(CLLocationCoordinate2D){Latitude, Lontitude}];
    [self.view addSubview:_mapView];
    
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    
    [self setAreaCenterPoint];
    [self addLine];
   // [self startLocation];
}


//开始定位
-(void)startLocation
{
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;
}

//停止定位
-(void)stopLocation
{
    [_locService stopUserLocationService];
    _mapView.showsUserLocation = NO;
}

//处理方向变更信息
-(void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
}

//处理位置变更信
-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
   [_mapView updateLocationData:userLocation];
}


//设置中心点
-(void)setAreaCenterPoint
{
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = Latitude;
    coor.longitude = Lontitude;
    annotation.coordinate = coor;
    annotation.title = @"第一责任区";
    [_mapView addAnnotation:annotation];
    [_mapView selectAnnotation:annotation animated:YES];

}

//中心点属性
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorRed;
        newAnnotationView.animatesDrop = YES;
        return newAnnotationView;
    }
    return nil;
}



//绘制折线
-(void)addLine
{
    CLLocationCoordinate2D coors[8] = {0};
    coors[0].latitude = 22.589357;
    coors[0].longitude = 113.920766;
    coors[1].latitude = 22.58876;
    coors[1].longitude = 113.920048;
    coors[2].latitude = 22.58904;
    coors[2].longitude = 113.919796;
    coors[3].latitude = 22.589282;
    coors[3].longitude = 113.919599;
    coors[4].latitude = 22.589778;
    coors[4].longitude = 113.919356;
    coors[5].latitude = 22.589795;
    coors[5].longitude = 113.920115;
    coors[6].latitude = 22.589674;
    coors[6].longitude = 113.920429;
    coors[7].latitude = 22.589357;
    coors[7].longitude = 113.920766;
    BMKPolyline* polyline = [BMKPolyline polylineWithCoordinates:coors count:8];
    [_mapView addOverlay:polyline];
}

//折现属性
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay{
    if ([overlay isKindOfClass:[BMKPolyline class]]){
        BMKPolylineView* polylineView = [[BMKPolylineView alloc] initWithOverlay:overlay];
        polylineView.strokeColor = [[UIColor greenColor] colorWithAlphaComponent:1];
        polylineView.lineWidth = 2.0;
        return polylineView;
    }
    return nil;
}

@end
