//
//  ViewController.m
//  UITaskManual
//
//  Created by Алекс  on 11.05.17.
//  Copyright © 2017 Алекс . All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
}
@property (retain, nonatomic) NSMutableArray* data;
@property (retain, nonatomic) IBOutlet UITextField *textField1;
@property (retain, nonatomic) IBOutlet UILabel *label;

- (void) addComponents;
- (void) addString: (UIButton*) sender;
- (void) sortMethod: (UIButton*) sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addComponents];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) addComponents{
    ///создание кнопки
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 270, 200, 30)];
    [button setTitle:@"Добавить" forState:UIControlStateNormal ];
    [button setTitleEdgeInsets:(UIEdgeInsetsMake(2, 50, 2, 50))];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor grayColor]];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button addTarget:self action:@selector(addString:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    //Текстовые поля
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 150, 30)];
    [_label setText:@"Введите слово:"];
    [_label setBackgroundColor:[UIColor blueColor]];
    [_label setTextColor:[UIColor blackColor]];
    [self.view addSubview:_label];
    
    _textField1 = [[UITextField alloc] initWithFrame:CGRectMake(200, 200, 200, 30)];
    [_textField1 setBorderStyle:UITextBorderStyleRoundedRect];
    [_textField1 setBackgroundColor:[UIColor whiteColor]];
    [_textField1 setText:@""];
    [self.view addSubview:_textField1];
    
    
    ///создание кнопки
    UIButton *buttonSort = [[UIButton alloc] initWithFrame:CGRectMake(0, 350, 200, 30)];
    [buttonSort setTitle:@"Sort" forState:UIControlStateNormal ];
    [buttonSort setTitleEdgeInsets:(UIEdgeInsetsMake(2, 50, 2, 50))];
    [buttonSort setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonSort setBackgroundColor:[UIColor grayColor]];
    buttonSort.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [buttonSort addTarget:self action:@selector(sortMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSort];
    
}

- (void) addString:(UIButton*) sender{
    if(_data == nil)//Если массив  еще не создан
        _data = [[NSMutableArray alloc] init];//
    [_data addObject:_textField1.text];//Добавление элемента в массив
    
    
}

//Сoбытие, сортировка массива
- (void) sortMethod: (UIButton*) sender{
    NSArray *sortedArray = [_data sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    for(NSString *string in sortedArray){
        NSLog(@"%@",string);
        [string release];
        
    }
    //? почему нельзя так делать?
    // [sortedArray release];// попытка уничтожение массива не увенчалась успехом
    // [_data release];
    
}

- (void) dealloc{
    [_data release];
    [_textField1 release];
    [_label release];
    
    [super dealloc];
}

@end

