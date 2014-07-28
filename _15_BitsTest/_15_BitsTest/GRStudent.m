//
//  GRStudent.m
//  _15_BitsTest
//
//  Created by Exo-terminal on 3/26/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRStudent.h"

@implementation GRStudent

-(NSString*) answerByType: (GRStudentSubjectType) type{
    return self.subjectType & type ? @"yes": @"no";
}

-(NSString*)description{
    
    return  [NSString stringWithFormat:@"Studient studies:\n"
             "biology - %@\n"
             "math - %@\n"
             "development - %@\n"
             "engineering - %@\n"
             "art - %@\n"
             "psychology - %@\n"
             "anatomy - %@\n",
             [self answerByType:(GRStudentSubjectTypeBiology)],
             [self answerByType:(GRStudentSubjectTypeMath)],
             [self answerByType:(GRStudentSubjectTypeDevelopment)],
             [self answerByType:(GRStudentSubjectTypeEngineering)],
             [self answerByType:(GRStudentSubjectTypeArt)],
             [self answerByType:(GRStudentSubjectTypePsychology)],
             [self answerByType:(GRStudentSubjectAnatomy)]];

}

@end
