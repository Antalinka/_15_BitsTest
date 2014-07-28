//
//  AppDelegate.m
//  _15_Bits
//
//  Created by Exo-terminal on 3/27/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "AppDelegate.h"
#import "GRStudents.h"

@interface AppDelegate()
@property (assign, nonatomic) NSInteger humanitiesCount;
@property (assign, nonatomic) NSInteger engineeringCount;

@property (assign, nonatomic) NSInteger developerCount;
@property (assign, nonatomic) NSInteger biologyCount;

@end

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
        
        [studentsDorm addObject:student];
    }
    
    NSLog(@"%@",studentsDorm);
    
    NSMutableArray* humanitiesScience = [[NSMutableArray alloc]init];
    NSMutableArray* engineeringScience = [[NSMutableArray alloc]init];

    self.developerCount = 0;
    self.biologyCount = 0;

    for (GRStudents* student in studentsDorm) {
        
        self.humanitiesCount = 0;
        self.engineeringCount = 0;
        
        GRStudentsSubjectType  myBitmask = GRStudentsSubjectTypeAnatomy | GRStudentsSubjectTypeArt | GRStudentsSubjectTypePsychology | GRStudentsSubjectTypeBiology;
        
        GRStudentsSubjectType humanitiesSubjectType = student.subjectType & myBitmask;
        GRStudentsSubjectType technicalSubjectType = student.subjectType & ~myBitmask;
 
        [self humanitiesWithType:humanitiesSubjectType student:student];
        [self engineeringWithType:technicalSubjectType student:student];
        
        NSLog(@"humanitiesCount = %d, engineeringCount = %d ", self.humanitiesCount,self.engineeringCount);

        if (self.humanitiesCount > self.engineeringCount) {
            NSLog(@"гуманитарий \n\n");
            [humanitiesScience addObject:student];
        }else{
            NSLog(@"технарь \n\n");
            [engineeringScience addObject:student];
        }
    }
    
    NSLog(@"Технарей - %d, Гуманитариев - %d, из них developer students - %d, biology canceled - %d",[engineeringScience count], [humanitiesScience count], self.developerCount, self.biologyCount);
    
    return YES;
}
-(void) humanitiesWithType:(GRStudentsSubjectType) type student:(GRStudents*) student{
    
    NSInteger intMask = 1;
    for (NSInteger i = 0; i < 8; i++) {
        
        if(type & intMask){
            self.humanitiesCount++;
        }
        intMask = intMask << 1;
    }
    
    if (type & GRStudentsSubjectTypeBiology) {
        student.subjectType = student.subjectType & ~GRStudentsSubjectTypeBiology;
        NSLog(@"biology canceled");
        self.biologyCount++;
    }
    
}
-(void) engineeringWithType:(GRStudentsSubjectType) type student:(GRStudents*) student{
    
    NSInteger intMask = 1;
    for (NSInteger i = 0; i < 8; i++) {
        
        if(type & intMask){
            self.engineeringCount++;
        }
        intMask = intMask << 1;
    }
    
    if (type & GRStudentsSubjectTypeDevelopment) {
        self.developerCount++;
    }
    
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
