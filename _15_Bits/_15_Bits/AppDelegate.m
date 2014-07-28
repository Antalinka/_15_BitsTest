//
//  AppDelegate.m
//  _15_Bits
//
//  Created by Exo-terminal on 3/27/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "AppDelegate.h"
#import "GRStudents.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
   
    NSMutableArray* studentsDorm = [[NSMutableArray alloc]init];
    
    for (NSInteger i = 0; i<10; i++) {
       GRStudents* student = [[GRStudents alloc]init];
        
        void(^studentBlock)(GRStudentsSubjectType) = ^(GRStudentsSubjectType type){
            
            BOOL result = arc4random()%2;
            if (result) {
                student.subjectType = student.subjectType | type;
            }
       };
        
        studentBlock(GRStudentsSubjectTypeBiology);
        studentBlock(GRStudentsSubjectTypeMath);
        studentBlock(GRStudentsSubjectTypeDevelopment);
        studentBlock(GRStudentsSubjectTypeEngineering);
        studentBlock(GRStudentsSubjectTypeArt);
        studentBlock(GRStudentsSubjectTypeAnatomy);
        studentBlock(GRStudentsSubjectTypePsychology);
        studentBlock(GRStudentsSubjectTypeMechanica);
        
//        NSLog(@"%@",student);
        
        [studentsDorm addObject:student];
    }
    
    NSLog(@"%@",studentsDorm);
    
    NSMutableArray* humanitiesScience = [[NSMutableArray alloc]init];
    NSMutableArray* engineeringScience = [[NSMutableArray alloc]init];

    __block NSInteger developerCount = 0;
    __block NSInteger biologyCount = 0;
    
    for (GRStudents* student in studentsDorm) {
        
        __block NSInteger humanitiesCount = 0;
        __block NSInteger engineeringCount = 0;
        
        void(^studentBlock)(GRStudentsSubjectType) = ^(GRStudentsSubjectType type){
            
            if (type & GRStudentsSubjectTypeDevelopment){
                developerCount++;
                engineeringCount++;
            }
            if (type & GRStudentsSubjectTypeMath ||type & GRStudentsSubjectTypeDevelopment ||type & GRStudentsSubjectTypeEngineering ||type & GRStudentsSubjectTypeMechanica){
                 engineeringCount++;
            }
            if (type & GRStudentsSubjectTypeAnatomy ||type & GRStudentsSubjectTypeArt ||type & GRStudentsSubjectTypePsychology ||type & GRStudentsSubjectTypeBiology) {
                humanitiesCount++;
            }
            if (type & GRStudentsSubjectTypeBiology) {
                student.subjectType = student.subjectType & ~ GRStudentsSubjectTypeBiology;
                NSLog(@"Discipline canceled");
                biologyCount++;
            }
        };
        
        studentBlock(student.subjectType & GRStudentsSubjectTypeBiology);
        studentBlock(student.subjectType & GRStudentsSubjectTypeMath);
        studentBlock(student.subjectType & GRStudentsSubjectTypeDevelopment);
        studentBlock(student.subjectType & GRStudentsSubjectTypeEngineering);
        studentBlock(student.subjectType & GRStudentsSubjectTypeArt);
        studentBlock(student.subjectType & GRStudentsSubjectTypeAnatomy);
        studentBlock(student.subjectType & GRStudentsSubjectTypePsychology);
        studentBlock(student.subjectType & GRStudentsSubjectTypeMechanica);
        
//        if (student.subjectType & GRStudentsSubjectTypeMath) {
//            engineeringCount++;
//        }
//        if (student.subjectType & GRStudentsSubjectTypeDevelopment) {
//            engineeringCount++;
//            developerCount++;
//        }
//        if (student.subjectType & GRStudentsSubjectTypeEngineering) {
//            engineeringCount++;
//        }
//        if (student.subjectType & GRStudentsSubjectTypeMechanica) {
//            engineeringCount++;
//        }
//        if (student.subjectType & GRStudentsSubjectTypeAnatomy) {
//            humanitiesCount++;
//        }
//        if (student.subjectType & GRStudentsSubjectTypeArt) {
//            humanitiesCount++;
//        }
//        if (student.subjectType & GRStudentsSubjectTypePsychology) {
//            humanitiesCount++;
//        }
//        if (student.subjectType & GRStudentsSubjectTypeBiology) {
//            humanitiesCount++;
//        }
//        
        if (humanitiesCount > engineeringCount) {
            NSLog(@"гуманитарий");
            [humanitiesScience addObject:student];
        }else{
            NSLog(@"технарь");
            [engineeringScience addObject:student];
        }
        
    }
    
    NSLog(@"Технарей - %d, Гуманитариев - %d, из них developer students - %d, biology canceled - %d",[engineeringScience count], [humanitiesScience count], developerCount, biologyCount);
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
