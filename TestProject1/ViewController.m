//
//  ViewController.m
//  TestProject1
//
//  Created by Quazi Ridwan Hasib on 7/01/2016.
//  Copyright © 2016 Quazi Ridwan Hasib. All rights reserved.
//

#import "ViewController.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kLatestKivaLoansURL [NSURL URLWithString:@"http://quaziridwanhasib.com/getData.php"]
//"https://api.meetup.com/2/groups?lat=51.509980&lon=-0.133700&page=20&key=1f5718c16a7fb3a5452f45193232"]


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    getData();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

void getData()
{
    NSError* error;
    NSData* data = [NSData dataWithContentsOfURL: kLatestKivaLoansURL];
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    
    
    NSArray* latestLoan = [json objectForKey:@"result"];
    //NSLog(@"mmm:%@",json);
    //NSLog(@"id:%@",[latestLoan valueForKey:@"id"]);
    //NSLog(@"name:%@", [latestLoan valueForKey:@"name"]);
    //NSLog(@"result:%@",latestLoan);
    
//    NSMutableArray *array = [NSMutableArray arrayWithObjects:a,nil];
    NSMutableArray *array;
    for (NSDictionary *dic in latestLoan){
        // Now you have dictionary get value for key
        NSString *firstName = (NSString*) [dic valueForKey:@"name"];
        array = [NSMutableArray arrayWithObjects:firstName,nil];
        NSLog(@"firstName:%@",firstName);
    }
    NSLog(@"TheText = %@", array);
//    for (id obj in array)
//    {
//        NSLog(@"obj: %@", obj);
//    }

}


@end
