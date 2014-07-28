//
//  GRStudents.m
//  _15_Bits
//
//  Created by Exo-terminal on 3/27/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRStudents.h"



@implementation GRStudents

-(NSString*)answerByType:(GRStudentsSubjectType) type{
    return self.subjectType & type ? @"yes": @"no";
}
-(NSString*) description{
    return [NSString stringWithFormat:@"Studient studies: \n"
                                        "biology - %@ \n"
                                        "math - %@ \n"
                                        "development - %@ \n"
                                        "engineering - %@ \n"
                                        "art - %@ \n"
                                        "psychology - %@ \n"
                                        "anatomy - %@ \n"
                                        "mechanica - %@ \n",
                                        [self answerByType:(GRStudentsSubjectTypeBiology)],
                                        [self answerByType:(GRStudentsSubjectTypeMath)],
                                        [self answerByType:(GRStudentsSubjectTypeDevelopment)],
                                        [self answerByType:(GRStudentsSubjectTypeEngineering)],
                                        [self answerByType:(GRStudentsSubjectTypeArt)],
                                        [self answerByType:(GRStudentsSubjectTypePsychology)],
                                        [self answerByType:(GRStudentsSubjectTypeAnatomy)],
                                        [self answerByType:(GRStudentsSubjectTypeMechanica)]];
}
@end
